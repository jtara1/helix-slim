# helix-slim

helix editor slimmed down packaged with nix

this doesn't reduce the compiled helix binary, it only removes additional files bundled with it with the exception of yaml

## Install

```shell
nix profile install github:jtara1/helix-slim
```

you can also `nix build` and `nix shell` as is applicable to you

## Verify

```
hx --health yaml
# or view all
hx --health
```

## TODO

- [ ] options for enabling: yaml, dockerfile, json
- [ ] reduce size further
- [ ] options for enabling completion for your shell
