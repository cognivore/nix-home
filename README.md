# An insanely opinionated way to semi-automatically install home-manager

It's very ad-hoc and installs my personal script collection, shipping it with home-mangaer. It is designed to only work on x86. You heard me right, it is *designed* to only work on x86.

If you want to use this script, first install a single-user modern Nix with this community script: https://github.com/numtide/nix-unstable-installer
You can use the official script and then do `nix-env -iA nixpkgs.nixFlakes` or something, but it's cringe.

I encourage you to read my script before running it. It's easy and non-destructive, but you'll have to patch a couple of configs manually, so yea.

# ON MY SYSTEM THESE DIRECTORIES ARE HARD-LINKED!

NOTE TO SELF: DON'T NUKE THIS DIRECTORY, BECAUSE FUCK KNOWS WHAT HAPPENS TO THE SOURCE FILE WHEN YOU DELETE A HARD LINK.
