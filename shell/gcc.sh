#!/bin/sh
set -x
test="test"$$


CC="~/master/toolchain/rsdk/bin/rsdk-linux-gcc"
CFLAGS="-Os -fstrict-aliasing -fstrict-overflow -I/home/sarah/master/target/tmpfs/include -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN"
CPP = rsdk-linux-gcc -E
EXE =
LDCONFIG = ldconfig
LDFLAGS = -L/home/sarah/master/target/tmpfs/lib
LDSHARED = rsdk-linux-gcc -shared -Wl,-soname,libz.so.1,--version-script,zlib.map
LDSHAREDLIBC = -lc
OBJC = $(OBJZ) $(OBJG)
PIC_OBJC = $(PIC_OBJZ) $(PIC_OBJG)
RANLIB = rsdk-linux-ranlib
SFLAGS = -Os -fstrict-aliasing -fstrict-overflow -I/home/sarah/master/target/tmpfs/include -fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN
SHAREDLIB = libz.so
SHAREDLIBM = libz.so.1
SHAREDLIBV = libz.so.1.2.8
STATICLIB = libz.a
TEST = all teststatic testshared test64
VER = 1.2.8
Z_U4 =
exec_prefix = ${prefix}
includedir = ${prefix}/include
libdir = ${exec_prefix}/lib
mandir = ${prefix}/share/man
prefix = /home/sarah/master/users/libs/zlib/.formosa/build
sharedlibdir = ${libdir}
uname = Linux

# put arguments in log, also put test file in log if used in arguments
show()
{
  case "$*" in
    *$test.c*)
      echo === $test.c === >> configure.log
      cat $test.c >> configure.log
      echo === >> configure.log;;
  esac
  echo $* >> configure.log
}

cat > $test.c <<EOF
#error error
EOF
if ($CC -c $CFLAGS $test.c) 2>/dev/null; then
  try()
  {
    show $*
    test "`( $* ) 2>&1 | tee -a configure.log`" = ""
  }
  echo - using any output from compiler to indicate an error >> configure.log
else
try()
{
  show $*
  ( $* ) >> configure.log 2>&1
  ret=$?
  if test $ret -ne 0; then
    echo "(exit code "$ret")" >> configure.log
  fi
  return $ret
}
fi

# check for unistd.h and save result in zconf.h
cat > $test.c <<EOF
#include <unistd.h>
int main() { return 0; }
EOF
if try $CC -c $CFLAGS $test.c; then
  sed < zconf.h "/^#ifdef HAVE_UNISTD_H.* may be/s/def HAVE_UNISTD_H\(.*\) may be/ 1\1 was/" > zconf.temp.h
  mv zconf.temp.h zconf.h
  echo "Checking for unistd.h... Yes." | tee -a configure.log
else
  echo "Checking for unistd.h... No." | tee -a configure.log
fi

echo >> configure.log

# check for stdarg.h and save result in zconf.h
cat > $test.c <<EOF
#include <stdarg.h>
int main() { return 0; }
EOF
if try $CC -c $CFLAGS $test.c; then
  sed < zconf.h "/^#ifdef HAVE_STDARG_H.* may be/s/def HAVE_STDARG_H\(.*\) may be/ 1\1 was/" > zconf.temp.h
  mv zconf.temp.h zconf.h
  echo "Checking for stdarg.h... Yes." | tee -a configure.log
else
  echo "Checking for stdarg.h... No." | tee -a configure.log
fi

