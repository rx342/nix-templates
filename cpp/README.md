# C++ template (`gcc`)

```bash
mkdir project
cd project
nix flake init -t github:rx342/nix-templates#cpp
$EDITOR main.cpp

just build
./main
```

Using

- `just`
- `cmake`
- Auto generate `compile_commands.json` compatible with `nix`
