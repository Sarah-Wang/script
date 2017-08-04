#!/bin/sh

# set command prefix for cross-compilation
CHOST="QOJIJIOJ"
if [ -n "${CHOST}" ]; then
    uname="`echo "${CHOST}" | \
	    sed -e 's/^[^-]*-\([^-]*\)$/\1/' \
	    -e 's/^[^-]*-[^-]*-\([^-]*\)$/\1/' \
	    -e 's/^[^-]*-[^-]*-\([^-]*\)-.*$/\1/'`"
    CROSS_PREFIX="${CHOST}-"
fi

echo $uname
echo $CROSS_PREFIX

# establish commands for library building
if "${CROSS_PREFIX}ar" --version >/dev/null 2>/dev/null || test $? -lt 126; then
    AR=${AR-"${CROSS_PREFIX}ar"}
    test -n "${CROSS_PREFIX}" && echo Using ${AR} | tee -a configure.log
else
    AR=${AR-"ar"}
    test -n "${CROSS_PREFIX}" && echo Using ${AR} | tee -a configure.log
fi

# process command line options
while test $# -ge 1
do
case "$1" in
    -h* | --help)
      echo 'usage:' | tee -a configure.log
      echo '  configure [--const] [--zprefix] [--prefix=PREFIX]  [--eprefix=EXPREFIX]' | tee -a configure.log
      echo '    [--static] [--64] [--libdir=LIBDIR] [--sharedlibdir=LIBDIR]' | tee -a configure.log
      echo '    [--includedir=INCLUDEDIR] [--archs="-arch i386 -arch x86_64"]' | tee -a configure.log
        exit 0 ;;
    -p*=* | --prefix=*) prefix=`echo $1 | sed 's/.*=//'`; shift ;;
    -e*=* | --eprefix=*) exec_prefix=`echo $1 | sed 's/.*=//'`; shift ;;
    -l*=* | --libdir=*) libdir=`echo $1 | sed 's/.*=//'`; shift ;;
    --sharedlibdir=*) sharedlibdir=`echo $1 | sed 's/.*=//'`; shift ;;
    -i*=* | --includedir=*) includedir=`echo $1 | sed 's/.*=//'`;shift ;;
    -u*=* | --uname=*) uname=`echo $1 | sed 's/.*=//'`;shift ;;
    -p* | --prefix) prefix="$2"; shift; shift ;;
    -e* | --eprefix) exec_prefix="$2"; shift; shift ;;
    -l* | --libdir) libdir="$2"; shift; shift ;;
    -i* | --includedir) includedir="$2"; shift; shift ;;
    -s* | --shared | --enable-shared) shared=1; shift ;;
    -t | --static) shared=0; shift ;;
    --solo) solo=1; shift ;;
    --cover) cover=1; shift ;;
    -z* | --zprefix) zprefix=1; shift ;;
    -6* | --64) build64=1; shift ;;
    -a*=* | --archs=*) ARCHS=`echo $1 | sed 's/.*=//'`; shift ;;
    --sysconfdir=*) echo "ignored option: --sysconfdir" | tee -a configure.log; shift ;;
    --localstatedir=*) echo "ignored option: --localstatedir" | tee -a configure.log; shift ;;
    -c* | --const) zconst=1; shift ;;
    *)
      echo "unknown option: $1" | tee -a configure.log
      echo "$0 --help for help" | tee -a configure.log
      leave 1;;
    esac
done

if try $CC -c $CFLAGS $test.c; then
  :   ## only a :
else
  echo "Compiler error reporting is too harsh for $0 (perhaps remove -Werror)." | tee -a configure.log
  leave 1
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

