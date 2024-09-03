# TODO: move options to somewhere more visible?
{
  inputs = {
    nixpkgs.url = "nixpkgs";
    nixpkgs-python = {
      url = "github:cachix/nixpkgs-python";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {self, nixpkgs, nixpkgs-python, ...}: 
    let
      system = "x86_64-linux";
      pythonVersion = "3.12"; # set python version
      pkgs = import nixpkgs {inherit system;};
    in
    {
      # nix develop sparrow#python-shell
      devShells.x86_64-linux.default = 
        let
          pythonPackages = pkgs.python312Packages;
          pyPkgs = with pythonPackages; [
            # put pip packages here
          ];
        in
        pkgs.mkShell {
          packages = [
            nixpkgs-python.packages.x86_64-linux.${pythonVersion}
            pyPkgs
            pkgs.zsh
            pkgs.pyright # change ?
          ];
          shellHook = ''
            python --version
          '';
        };
    };
}
