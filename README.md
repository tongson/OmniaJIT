# ARCHIVED: Checkout LadyLua for your standalone Lua programs.

omniajit
========

Compile Lua 5.1 and LuaJIT source code into standalone executables. This makes it easy to use them for general purpose scripting.

Requires: GNU Make, a compiler and binutils (or equivalent). Installing development tools e.g. the package build-essential should have everything you need. Does not require autotools.<br/>
Note: Linux 3.17+ (5 Oct 2014) and glibc 2.25+ only for getrandom().

#### Getting started

1. Edit the following space delimited variables in the top-level Makefile<br/>
     MAIN: The "main" script in the `bin/` directory<br/>
     SRC: Modules that are specific to your application. Copy these to `src/lua`. <br/>
     SRC_DIR: Directories containing modules that are specific to your application. Copy these to `src/lua`.</br>
     VENDOR: 3rd party modules<br/>
     VENDOR_DIR: directories containing 3rd party modules<br/>

2. Copy the main source file into the `bin/` directory.

3. Copy modules into `src/lua/` or `vendor/lua/`.

The SRC, VENDOR split is just for organization. Underneath they are using the same Make routines.

1. Run `make`<br/>
2. The executable will be located under the `bin/` directory

#### Adding plain Lua modules. (NOTE: VENDOR and SRC are interchangeable.)

Adding plain modules is trivial. $(NAME) is the name of the module passed to `VENDOR`.

1. Copy the module to `vendor/lua/$(NAME).lua`<br/>
  example: `cp ~/Downloads/dkjson.lua vendor/lua`
1. Add `$(NAME)` to `VENDOR`<br/>
  example: `VENDOR= re dkjson`

For modules that are split into multile files, such as Penlight:

1. Copy the directory of the Lua to `vendor/lua/$(NAME)`<br/>
  example: `cp -R ~/Download/Penlight-1.3.1/lua/pl vendor/lua`
1. Add `$(NAME)` to `VENDOR_DIR`<br/>
  example: `VENDOR_DIR= pl`

For modules with multiple levels of directories you will have to pass each directory. Example:<br/>
  `VENDOR_DIR= ldoc ldoc/builtin ldoc/html`

Lua does not have facilities to traverse directories and I'd like to avoid shell out functions.

#### Included projects

Project                                                     | Version             | License
------------------------------------------------------------|---------------------|---------
[LuaJIT](https://github.com/openresty/luajit2)              | v2.1-20201012-2     | MIT
[luastatic](https://github.com/ers35/luastatic)             | 0.0.12              | CC0

#### Available modules (Feel free to open a Github issue if you want help with adding a new Lua module.)

Module                                                            | Version         | License
------------------------------------------------------------------|-----------------|---------
[LPegLJ](https://github.com/sacek/LPegLJ)[1]                      | 1.0.0           | MIT
[luafilesystem](https://github.com/spacewander/luafilesystem)     | 0.3             | MIT
[u-test](https://github.com/IUdalov/u-test)                       | 113259f         | MIT
[argparse](https://github.com/luarocks/argparse)                  | 20c1445         | MIT
[moonscript](https://moonscript.org)                              | 29d8ccc         | MIT
[lunajson](https://github.com/grafi-tt/lunajson)                  | 1dcf3fa         | MIT
[base64](https://github.com/jsolman/luajit-mime-base64/)          | 769e16d         | APL2
[sqlite3](https://github.com/stepelu/lua-ljsqlite3)[3]            | d742002         | MIT
[luassert](https://github.com/Olivine-Labs/luassert)[2]           | 36fc3af         | MIT
[list](https://github.com/lalawue/ffi_list.lua)                   | 7f8ee88         | MIT
[yaml](https://github.com/peposso/lua-tinyyaml)                   | d280b04         | MIT

[1] Renamed to lpeg. `require"lpeg"` to require it.<br/>
[2] Incomplete import. Some files, utility type code only.<br/>
[3] Patched.<br/>
