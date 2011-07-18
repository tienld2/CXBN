v 20110619 2
C 42300 47450 1 0 0 charci_arc.sym
{
T 44000 48870 5 10 1 1 0 6 1
refdes=CHAR_TO_LOGIC
T 42900 48850 5 10 0 0 0 0 1
device=charci
}
C 47300 47850 1 0 0 charco_arc.sym
{
T 49000 49270 5 10 1 1 0 6 1
refdes=LOGIC_TO_CHAR
T 47900 49250 5 10 0 0 0 0 1
device=charco
}
N 42600 45800 45100 45800 4
N 46700 45400 49300 45400 4
C 42800 48000 1 0 1 IPAD-CHAR.sym
{
T 42700 48800 5 10 0 0 0 6 1
device=IPAD
T 42250 48450 5 10 1 1 0 6 1
refdes=char_in
}
C 42800 44400 1 0 1 IPAD-STD_LOGIC.sym
{
T 42700 45200 5 10 0 0 0 6 1
device=IPAD
T 42250 44850 5 10 1 1 0 6 1
refdes=reset
}
N 45100 45400 44300 45400 4
N 44300 45400 44300 44700 4
N 44300 44700 42600 44700 4
C 42800 46700 1 0 1 IPAD-STD_LOGIC.sym
{
T 42700 47500 5 10 0 0 0 6 1
device=IPAD
T 42250 47150 5 10 1 1 0 6 1
refdes=rd_en
}
N 42600 47000 44300 47000 4
N 44300 46200 44300 47000 4
N 44300 46200 45100 46200 4
C 42800 45500 1 0 1 IPAD-STD_LOGIC.sym
{
T 42700 46300 5 10 0 0 0 6 1
device=IPAD
T 42250 45950 5 10 1 1 0 6 1
refdes=wr_en
}
N 44300 48300 44500 48300 4
N 44500 46600 44500 48300 4
N 44500 46600 45100 46600 4
C 42800 49300 1 0 1 IPAD-STD_LOGIC.sym
{
T 42700 50100 5 10 0 0 0 6 1
device=IPAD
T 42250 49750 5 10 1 1 0 6 1
refdes=clk
}
N 42600 49600 44700 49600 4
N 44700 47000 44700 49600 4
N 44700 47000 45100 47000 4
C 49100 49500 1 0 0 OPAD-STD_LOGIC_VECTOR_A.sym
{
T 49200 50300 5 10 0 0 0 0 1
device=OPAD
T 49650 49950 5 10 1 1 0 0 1
refdes=data_count
}
C 49100 48400 1 0 0 OPAD-CHAR.sym
{
T 49200 49200 5 10 0 0 0 0 1
device=OPAD
T 49650 48850 5 10 1 1 0 0 1
refdes=char_out
}
N 46700 45800 47400 45800 4
N 47400 45800 47400 46500 4
N 47400 46500 49300 46500 4
C 49100 47300 1 0 0 OPAD-STD_LOGIC.sym
{
T 49200 48100 5 10 0 0 0 0 1
device=OPAD
T 49650 47750 5 10 1 1 0 0 1
refdes=empty
}
N 49300 47600 47200 47600 4
N 47200 47600 47200 46200 4
N 47200 46200 46700 46200 4
C 49100 46200 1 0 0 OPAD-STD_LOGIC.sym
{
T 49200 47000 5 10 0 0 0 0 1
device=OPAD
T 49650 46650 5 10 1 1 0 0 1
refdes=full
}
N 46700 46600 47000 46600 4
N 47000 46600 47000 48700 4
N 47000 48700 47600 48700 4
C 49100 45100 1 0 0 OPAD-STD_LOGIC.sym
{
T 49200 45900 5 10 0 0 0 0 1
device=OPAD
T 49650 45550 5 10 1 1 0 0 1
refdes=wr_ack
}
N 46700 47000 46800 47000 4
N 46800 47000 46800 49800 4
N 46800 49800 49300 49800 4
C 44800 44700 1 0 0 cfifo_fifo_syn_a.sym
{
T 46400 47420 5 10 1 1 0 6 1
refdes=BUF
T 45400 47400 5 10 0 0 0 0 1
device=cfifo
T 45400 45000 5 10 1 0 0 0 1
a : integer=a
T 45400 45300 5 10 1 0 0 0 1
b : integer=char'length
}
T 45584 48100 8 10 1 1 0 0 1
entity=CFIFOC
T 51284 44600 8 10 1 0 0 0 1
a : integer=?4
T 51084 44900 8 10 1 0 0 0 1
architecture=arc
