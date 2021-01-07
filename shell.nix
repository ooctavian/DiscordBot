{ pkgs ? import <nixpkgs> {} }:
let 
    luvit-nix = pkgs.fetchFromGitHub {
    owner = "aiverson";
    repo = "luvit-nix";
    rev = "a7f19f4566a3cf133f537d35492fdb2467e69b92";
    sha256 = "1a7cr70qrcc3inr9y0gg47iqqvgi983aycnz81mv4mcy8r8d9zsy";
};
in
pkgs.stdenv.mkDerivation rec {
	name = "ChikaBot";
	version = "0.1";
	nativeBuildInputs = [
	(import luvit-nix {}).lit
        (import luvit-nix {}).luvi
        (import luvit-nix {}).luvit
	];
	shellHook = ''
	[ -d "./deps/discordia" ] || lit install SinisterRectus/discordia
	'';
}
