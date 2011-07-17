-- jpd 1/25/2011
-- Stripped-down, repaired, parameterized version of Armadeus FIFO
-- Removed unimplemented flags
-- data_count now indicates occupancy
-- wr_ack now pulses upon successful write
-- counter widths and memory size reflect A parameter
-- setting of A reflects Spartan 3 block memory size

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity cfifo is
  generic (
    A         : integer := 4;          -- Address bits
    B         : integer := 8);         -- Depth of the FIFO: 2 ** A-1
  port (
    -- Inputs
    ---- Global signals
    clk, reset   : in std_logic;
    ---- Data
    din          : in std_logic_vector(B-1 downto 0);
    ---- Flags for Read and Write instructions
    rd_en, wr_en : in std_logic;

    -- Outputs
    ---- Data
    dout        : out std_logic_vector(B-1 downto 0);
    ---- Status
    data_count  : out std_logic_vector(A-1 downto 0);
    empty, full : out std_logic;
    wr_ack      : out std_logic);
end entity;

architecture fifo_syn_a of cfifo is
  subtype wrdtype is std_logic_vector(B-1 downto 0);
  constant memdepth : integer := 2 ** A - 1;
  type regtype is array (0 to memdepth) of wrdtype;
  signal reg        : regtype;

  signal RdCntr, WrCntr, DCntr : std_logic_vector(A-1 downto 0);

  signal RW      : std_logic_vector(1 downto 0);
  signal fullxB  : std_logic := '0';
  signal emptyxB : std_logic := '1';
begin
  RW <= rd_en & wr_en;

  seq : process (clk, reset)
  begin  -- process seq
    if reset = '1' then                 -- asynchronous reset (active low)
      RdCntr  <= (others => '0');
      WrCntr  <= (others => '0');
      Dcntr   <= (others => '0');
      emptyxB <= '1';
      fullxB  <= '0';
      wr_ack  <= '0';
    elsif rising_edge(clk) then         -- rising clock edge
      case RW is
        when "11" =>                    -- read and write at the same time
          RdCntr                    <= RdCntr + 1;
          WrCntr                    <= WrCntr + 1;
          wr_ack                    <= '1';
          reg(conv_integer(WrCntr)) <= din;

        when "10" =>                    -- only read
          if (emptyxB = '0') then       -- not empty
            if ((RdCntr +1) = WrCntr) then
              emptyxB <= '1';
            end if;
            RdCntr <= RdCntr + 1;
            DCntr  <= DCntr - 1;
          end if;
          fullxB <= '0';
          wr_ack <= '0';

        when "01" =>                    -- only write
          emptyxB <= '0';
          if fullxB = '0' then          -- not full
            reg(conv_integer(WrCntr)) <= din;
            if WrCntr+1 = RdCntr then
              fullxB <= '1';
            end if;
            WrCntr <= WrCntr +1;
            DCntr  <= DCntr + 1;
            wr_ack <= '1';
          end if;
          
        when "00" =>
          wr_ack <= '0';
          
        when others => null;
      end case;
    end if;
  end process seq;

  dout <= reg(conv_integer(RdCntr)) when emptyxB = '0'
          else (others => '0');
  full       <= fullxB;
  empty      <= emptyxB;
  data_count <= DCntr;

end architecture;
