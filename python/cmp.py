#!/usr/bin/python
#import json
#import os
#import sys

right = "/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../libexec/gcc/mips-linux-uclibc/4.8.5/collect2 --sysroot=/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc --build-id --eh-frame-hdr -EL -dynamic-linker /lib/ld-uClibc.so.0 -melf32ltsmip -o testAB /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crt1.o /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crti.o /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float/crtbegin.o -L/home/sarah/master/target/tmpfs/lib -L/home/sarah/master/target/tmpfs/lib -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/usr/lib/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5 -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/usr/lib -ltestA -ltestB testAB.o -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float/crtend.o /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crtn.o"
wrong = "/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../libexec/gcc/mips-linux-uclibc/4.8.5/collect2 --sysroot=/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc --build-id --eh-frame-hdr -EL -dynamic-linker /lib/ld-uClibc.so.0 -melf32ltsmip -o testAB /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crt1.o /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crti.o /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float/crtbegin.o -L/home/sarah/master/target/tmpfs/lib -L/home/sarah/master/target/tmpfs/lib -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/usr/lib/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5 -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/usr/lib -ltestA testAB.o -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float/crtend.o /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crtn.o"

r1 = right.split(" ")
w1 = wrong.split(" ")
lr = len(r1)
lw = len(w1)
#print lr
#print lw
for i in range(0,lw):
    if r1[i] == w1[i]:
        continue
    else:
        #print "right: ",r1[i]
        #print "wrong: ",w1[i]
        pass

#part of result of make testAB_build (makefile)
sdkld="/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../libexec/gcc/mips-linux-uclibc/4.8.5/collect2 --sysroot=/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc --build-id --eh-frame-hdr -EL -dynamic-linker /lib/ld-uClibc.so.0 -melf32ltsmip -o testAB /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crt1.o /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crti.o /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float/crtbegin.o -L/home/sarah/master/target/tmpfs/lib -L/home/sarah/master/target/tmpfs/lib -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/usr/lib/5281/el/hard-float -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5 -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib -L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/usr/lib -rpath-link /home/sarah/master/target/tmpfs/lib -ltestA testAB.o -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float/crtend.o /home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crtn.o"
pa = sdkld.split(" ")
for i in pa:
    print i

out='''
/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../libexec/gcc/mips-linux-uclibc/4.8.5/collect2
--sysroot=/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc
--build-id
--eh-frame-hdr
-EL
-dynamic-linker
/lib/ld-uClibc.so.0
-melf32ltsmip
-o
testAB
/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crt1.o
/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crti.o
/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float/crtbegin.o
-L/home/sarah/master/target/tmpfs/lib
-L/home/sarah/master/target/tmpfs/lib
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/5281/el/hard-float
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib/5281/el/hard-float
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/usr/lib/5281/el/hard-float
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/usr/lib
-rpath-link
/home/sarah/master/target/tmpfs/lib
-ltestA
testAB.o
-lgcc
--as-needed
-lgcc_s
--no-as-needed
-lc
-lgcc
--as-needed
-lgcc_s
--no-as-needed
/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float/crtend.o
/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/bin/../lib/gcc/mips-linux-uclibc/4.8.5/../../../../mips-linux-uclibc/lib/crtn.o
'''

simple='''
/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib
/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib/crt1.o
/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib/crti.o
/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float/crtbegin.o
-L/home/sarah/master/target/tmpfs/lib
-L/home/sarah/master/target/tmpfs/lib
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/lib/gcc/mips-linux-uclibc/4.8.5/5281/el/hard-float
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib/5281/el/hard-float
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib/5281/el/hard-float
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/usr/lib/5281/el/hard-float
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/lib/gcc/mips-linux-uclibc/4.8.5
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/lib/gcc
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/lib
-L/home/sarah/master/toolchain/rsdk-4.8.5-5281-EL-3.10-u0.9.33-m32fut-161202/mips-linux-uclibc/usr/lib

'''

cmakelink=
'''
/home/sarah/master/toolchain/rsdk/bin/rsdk-linux-gcc
-Os -fstrict-aliasing -fstrict-overflow
-Wall
-Werror
-L/home/sarah/master/target/tmpfs/lib
CMakeFiles/testAB.dir/testAB.o
-o testAB
-L/home/sarah/master/tmpfs/lib
-rdynamic
-ltestA
-Wl,-rpath,/home/sarah/master/tmpfs/lib:
'''

