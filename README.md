# helix-slim

helix editor slimmed down, packaged with nix

this doesn't reduce the compiled helix binary, it only removes additional files bundled with it with the exception of yaml

## Install
Choose an option, depending on your system and package manager.

### Nix
```shell
nix profile install github:jtara1/helix-slim
```

you can also `nix build` and `nix shell` as is applicable to you

### Prebuilt Bundled Binary
Available for:
- RPM package manager
- Debian package manager
- Arx (distro-agnostic, requires tar and bzip2)

Download from https://github.com/jtara1/helix-slim/releases

#### Install on target system
Secure copy the binary over to target or download.

Choose one:
```shell
sudo dnf install ./helix-slim*.rpm
sudo apt install ./helix-slim*.deb
./helix-slim-arx
```

## Verify
Did it install successfully?

```
hx --health yaml
# or view all
hx --health
```
You should also see a dark theme instead of their default purple and syntax highlighting on yaml like
```shell
echo '
a: null
b: 123
c: hello
' > /tmp/a.yaml

hx /tmp/a.yaml
```
## TODO

- [ ] options for enabling: yaml, dockerfile, json
- [ ] reduce size further of helix
- [ ] reduce size of the LSP(s) if easy enough
- [ ] options for enabling completion for your shell
