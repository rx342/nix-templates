# C++ template (`clang`)

```bash
mkdir project
cd project
nix flake init -t github:rx342/nix-templates#clang
$EDITOR main.cpp

just build
./main
```

Using

- `just`
- `cmake`
- `clang-tools`
- Auto generate `compile_commands.json` compatible with `nix`
