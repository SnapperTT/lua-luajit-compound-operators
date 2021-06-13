## Lua & Luajit Compound Operators Patch ##
Adds the following operators to `lua5.2.4` and `luajit 2.1.0-beta3` (latest release):
* Compound assignment: `+=, -=, *=, /=, ..=, %=`
* Increment: `++`
* Continue keyword `continue`.

Lua5.2.4 and Luajit 2.1.0 are both supported so that you can use Lua when debugging and LuaJit on release 

This is distributed as a patch so that you can apply it to future versions (rather than this becoming yet another unmaintained lua/luajit fork)

### How to Use
Download relevent sources and then use `patch` and then build as usual.

Alternatively use `fetch_and_apply_lua*.sh` to automatically download and patch

### Contributing
Edit files `makediff_lua*.sh` to make a new `lua*.patch`. Set A to the unmodified source directory and B to the modified source and run the script.

### Hairy Bits
* Tupple assignements are not supported (no `a,b,c+=1337`)
* Increment `++` should be an isolated statement (no `t[a++]`)

### Implementation Credits, Etc
Luajit continue from [https://github.com/zewt/LuaJIT/commit/c0e38bacba15d0259c3b77]

Luajit compound operaters based on [https://github.com/mingodad/ljsjit]

Lua compound operators SvenOlsen's powerpatch [http://lua-users.org/wiki/LuaPowerPatches] (control-f: "Compound Assignment Operators (5.2)")

Lua continue from zewt's continue branch [https://github.com/zewt/lua/compare/master...zewt:continue?expand=1]

## To Be Done
Probably won't be done unless someone submits a PR
Support binops: `&,|,^,~`
* Luajit binops built upon [[https://github.com/LuaJIT/LuaJIT/pull/312.patch]]
* Lua5.2 binops from powerpatch [http://lua-users.org/wiki/LuaPowerPatches] (contorl-f: "Bitwise operators, integer division and != (5.1.4)")
* Support compound binops `&=, |=`. Look at `lua52.patch` and `luajit210.patch` for hints as to how to hook
* Support multiple assign (eg `a,b,c += 1,2,3`). Patched lua supports this, the bit stopping this is trying to match

## License
Public Domain
