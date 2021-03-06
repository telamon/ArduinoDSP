<Qucs Schematic 0.0.15>
<Properties>
  <View=-347,-90,1316,636,0.751315,0,0>
  <Grid=10,10,1>
  <DataSet=ArduinoDSP.dat>
  <DataDisplay=ArduinoDSP.dpl>
  <OpenDisplay=1>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.PortSym 40 20 2 0>
  <.PortSym 40 60 1 0>
  <.PortSym 40 100 3 0>
  <.PortSym 40 140 4 0>
  <.PortSym -10 180 5 0>
  <.PortSym -10 220 7 0>
  <.PortSym -10 260 6 0>
  <.PortSym -10 300 11 0>
  <.PortSym -10 340 10 0>
  <.PortSym -10 380 9 0>
  <.PortSym -10 420 8 0>
</Symbol>
<Components>
  <GND * 1 360 400 0 0 0 0>
  <R R1 1 320 220 -26 15 0 0 "1k Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <R R2 1 540 270 15 -26 0 1 "10k Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <R R3 1 540 170 15 -26 0 1 "1.2k Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <R R4 1 940 60 -26 15 0 0 "1.5k Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <R R5 1 940 160 -26 15 0 0 "390k Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <C C2 1 1070 60 -26 17 0 0 "2.2 uF" 1 "" 0 "neutral" 0>
  <GND * 1 1120 190 0 0 0 0>
  <Port OutRight_Gnd 1 1160 160 4 -35 0 2 "7" 0 "analog" 0>
  <Port OutRight_V 1 1160 60 4 -35 0 2 "6" 0 "analog" 0>
  <Port Ain0 1 680 220 4 -35 0 2 "3" 0 "analog" 0>
  <Port D6 1 850 160 -23 12 0 0 "5" 0 "analog" 0>
  <Port D5 1 850 60 -23 12 0 0 "4" 0 "analog" 0>
  <R R6 1 940 310 -26 15 0 0 "1.5k Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <R R7 1 940 410 -26 15 0 0 "390k Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <C C3 1 1070 310 -26 17 0 0 "2.2 uF" 1 "" 0 "neutral" 0>
  <GND * 1 1120 440 0 0 0 0>
  <Port D3 1 850 310 -23 12 0 0 "11" 0 "analog" 0>
  <Port D11 1 850 410 -23 12 0 0 "10" 0 "analog" 0>
  <Port OutLeft_V1 1 1160 310 4 -35 0 2 "9" 0 "analog" 0>
  <Port OutLeft_Gnd1 1 1160 410 4 -35 0 2 "8" 0 "analog" 0>
  <Port VSignal 1 -300 200 -23 12 0 0 "1" 0 "analog" 0>
  <Port VSignalGND 1 -300 300 -23 12 0 0 "2" 0 "analog" 0>
  <Sub LM386 1 100 160 -154 -26 0 3 "lm386dummy.sch" 0>
  <potentiometer POT1 1 -180 30 -61 -32 0 3 "1e4" 0 "120" 0 "0" 0 "1" 0 "240.0" 0 "0.2" 0 "0.2" 0 "1" 0 "100" 0 "26.85" 0 "26.85" 0>
  <C C1 1 440 220 -26 17 0 0 "2.2 uF" 1 "" 0 "neutral" 0>
  <C C4 1 190 70 17 -26 0 1 "10 uF" 1 "" 0 "neutral" 0>
  <Vdc Arduino5vOutput 1 320 30 -26 18 0 0 "5 V" 1>
  <GND * 1 290 30 0 0 0 3>
</Components>
<Wires>
  <360 300 360 400 "" 0 0 0 "">
  <360 300 540 300 "" 0 0 0 "">
  <540 220 540 240 "" 0 0 0 "">
  <540 200 540 220 "" 0 0 0 "">
  <540 30 540 140 "" 0 0 0 "">
  <540 220 680 220 "" 0 0 0 "">
  <850 60 910 60 "" 0 0 0 "">
  <850 160 910 160 "" 0 0 0 "">
  <970 60 1020 60 "" 0 0 0 "">
  <970 160 1020 160 "" 0 0 0 "">
  <1020 60 1040 60 "" 0 0 0 "">
  <1020 60 1020 160 "" 0 0 0 "">
  <1120 160 1160 160 "" 0 0 0 "">
  <1120 160 1120 190 "" 0 0 0 "">
  <1100 60 1160 60 "" 0 0 0 "">
  <850 310 910 310 "" 0 0 0 "">
  <850 410 910 410 "" 0 0 0 "">
  <970 410 1020 410 "" 0 0 0 "">
  <970 310 1020 310 "" 0 0 0 "">
  <1020 310 1040 310 "" 0 0 0 "">
  <1020 310 1020 410 "" 0 0 0 "">
  <1120 410 1160 410 "" 0 0 0 "">
  <1120 410 1120 440 "" 0 0 0 "">
  <1100 310 1160 310 "" 0 0 0 "">
  <390 30 540 30 "" 0 0 0 "">
  <390 -10 390 30 "" 0 0 0 "">
  <-300 300 -180 300 "" 0 0 0 "">
  <-180 300 130 300 "" 0 0 0 "">
  <190 300 360 300 "" 0 0 0 "">
  <190 190 190 300 "" 0 0 0 "">
  <130 300 190 300 "" 0 0 0 "">
  <130 190 130 300 "" 0 0 0 "">
  <-300 200 70 200 "" 0 0 0 "">
  <70 190 70 200 "" 0 0 0 "">
  <-180 70 -180 300 "" 0 0 0 "">
  <130 30 130 130 "" 0 0 0 "">
  <-160 30 130 30 "" 0 0 0 "">
  <-180 -10 390 -10 "" 0 0 0 "">
  <70 110 70 130 "" 0 0 0 "">
  <70 110 290 110 "" 0 0 0 "">
  <290 110 290 220 "" 0 0 0 "">
  <-110 190 10 190 "" 0 0 0 "">
  <470 220 540 220 "" 0 0 0 "">
  <350 220 410 220 "" 0 0 0 "">
  <-110 40 -110 190 "" 0 0 0 "">
  <-110 40 190 40 "" 0 0 0 "">
  <190 100 190 130 "" 0 0 0 "">
  <350 30 390 30 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
