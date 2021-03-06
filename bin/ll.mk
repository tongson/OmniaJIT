.DEFAULT_GOAL= release
EXE:= ll
SRC:=
SRC_DIR:=
VENDOR:= std exec ffi_ext
VENDOR+= uuid lautil u-test sqlite3 json yaml
VENDOR+= list base64 blake3
VENDOR+= argparse lfs lpcap lpcode lpeg lpprint lpvm re
VENDOR_DIR:= lunajson
MAKEFLAGS= --silent
CC= gcc
AR= gcc-ar
NM= gcc-nm
RANLIB= gcc-ranlib
CFLAGS= -pipe -ffunction-sections -fdata-sections -fomit-frame-pointer -fgnu89-inline -flto -fuse-linker-plugin -fno-semantic-interposition -mno-avx2
CCOPT= -Ofast -march=nehalem -mtune=haswell -msse4.2
LDFLAGS= -Wl,--gc-sections,--as-needed,--sort-common,--strip-all,-flto
include lib/tests.mk
include lib/std.mk
include lib/rules.mk
