{
  description = "A slim version of Helix editor with reduced file size.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        helix-slim = pkgs.helix.overrideAttrs (oldAttrs: {
          pname = "helix-slim";

          nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.makeWrapper ];
          postInstall = (oldAttrs.postInstall or "") + ''
            # Remove grammar files (tree-sitter grammars)
            find $out/lib/runtime/grammars -type f ! -name yaml.so -delete
            wrapProgram $out/bin/hx --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.yaml-language-server ]}
          '';
        });
      in
      {
        packages = {
          default = helix-slim;
          helix-slim = helix-slim;
        };

        apps.default = {
          type = "app";
          program = "${helix-slim}/bin/hx";
        };
      }
    );
}
