.DEFAULT_GOAL= release
EXE:= moonc
SRC:= 
SRC_DIR:=
VENDOR:= argparse lfs lpcap lpcode lpeg lpprint lpvm
VENDOR_DIR:= moonscript moonscript/parse moonscript/compile moonscript/transform moonscript/cmd
MAKEFLAGS= --silent
CC= gcc
AR= gcc-ar
NM= gcc-nm
RANLIB= gcc-ranlib
CCOPT= -Os -mtune=generic -mmmx -msse -msse2 -fomit-frame-pointer -pipe
LDFLAGS= -Wl,--strip-all
TARGET_CCOPT= $(CCOPT)
TARGET_CFLAGS= $(CFLAGS)
TARGET_LDFLAGS= $(LDFLAGS)
include lib/tests.mk
include lib/std.mk
include lib/rules.mk
