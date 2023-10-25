# jx-CTC

#Requirement
+ Source code of shared library, can extend and maintainance
+ Override KBuySell::Buy funtion on /server1/jx_linux_y
+ Compile with gcc C++11 32bit, shared library
+ Fix core dump for KBuySell::Buy when input parameter:
  Breakpoint 1, KBuySell::Buy (this=0x949b1a0 <BuySell>, nPlayerIdx=1, nBuy=141, nBuyIdx=1205862400, nPlace=3, nX=0, nY=0)
