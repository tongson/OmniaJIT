.DEFAULT_GOAL= release
EXE:= omnia
SRC:= 
SRC_DIR:=
VENDOR:= lib ring argparse lfs
VENDOR_DIR:=
MAKEFLAGS= --silent
HOST_CC= cc
CROSS=
CROSS_CC=
CCOPT= -Os -mtune=generic -mmmx -msse -msse2 -fomit-frame-pointer -pipe
LDFLAGS= -Wl,--strip-all
TARGET_CCOPT= $(CCOPT)
TARGET_CFLAGS= $(CFLAGS)
TARGET_LDFLAGS= $(LDFLAGS)
include lib/tests.mk
include lib/std.mk
include lib/rules.mk
