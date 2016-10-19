OmniaJIT
========

Fork of [Omnia](https://github.com/tongson/omnia), LuaJIT instead of PUC-Rio Lua.

Compile LuaJIT and MoonScript source code into standalone executables. This makes it easy to use them for general purpose scripting.

Ideally you would do development with LuaJIT and Luarocks then deploy to production using OmniaJIT.

Requires: GNU Make, a compiler and binutils (or equivalent). Installing development tools e.g. the package build-essential should have everything you need. Does not require autotools.<br/>
Note: Linux and OS X only. xBSD soon.

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
If you want to link statically run `make STATIC=1`<br/>
During developlement or debugging run `make DEBUG=1`

2. The executable will be located under the `bin/` directory

#### Adding plain Lua and MoonScript modules. (NOTE: VENDOR and SRC are interchangeable.)

Adding plain modules is trivial. $(NAME) is the name of the module passed to `VENDOR`.

1. Copy the module to `vendor/lua/$(NAME).{lua,moon}`<br/>
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

#### MoonScript support

Just treat MoonScript source the same as Lua source. The Make routines will handle the compilation of MoonScript sources and link the appropriate compiled Lua source to the final executable.

The MoonScript standard library is included but you have to add `moon` to the `VENDOR` line in the Makefile.

A copy of `mooni` is also included. To compile, run `make bin/mooni`.

#### Included projects

Project                                                     | Version             | License
------------------------------------------------------------|---------------------|---------
[LuaJIT](http://www.luajit.org)                             | LuaJIT-2.1-20160517 | MIT
[Lua](http://www.lua.org)                                   | 5.3.3               | MIT
[luastatic](https://github.com/ers35/luastatic)             | 0.0.4               | CC0
[MoonScript](http://moonscript.org)                         | 0.5.0               | MIT
[mooni](https://luarocks.org/modules/steved/mooni)          | 0.5                 | MIT

#### Available modules (Feel free to open a Github issue if you want help with adding a new Lua module.)

Module                                                          | Version         | License
----------------------------------------------------------------|-----------------|---------
[cwtest](https://github.com/catwell/cwtest)                     | b027449         | MIT
[LPegLJ](https://github.com/sacek/LPegLJ)[1]                    | 1.0.0           | MIT
[ljsyscall](https://github.com/justincormack/ljsyscall/)[2]     | 0.12            | MIT
[tapered](https://bitbucket.org/telemachus/tapered)             | 2.1.0           | BSD 3C

[1] Renamed to lpeg. `require"lpeg"` to require it.<br/>
[2] lfs moved to `vendor/lua` so `require"lfs"` works.<br/>
