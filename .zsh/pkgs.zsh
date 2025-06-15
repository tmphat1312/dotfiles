# ~/.zsh/pkgs.zsh

pkgs() {
  case "$1" in
    add)
      if [ -z "$2" ]; then
        echo "Usage: pkgs add <name>"
      else
        nix profile install "nixpkgs#$2"
      fi
      ;;
    remove)
      if [ -z "$2" ]; then
        echo "Usage: pkgs remove <name>"
      else
        nix profile remove "$2"
      fi
      ;;
    list)
      nix profile list | awk '
        /^Name:/ {name=$2}
        /^Store paths:/ {print name " -> " $3}
      '
      ;;
    *)
      echo "Usage:"
      echo "  pkgs add <name>     # Install a package"
      echo "  pkgs remove <name>  # Remove a package"
      echo "  pkgs list           # List installed packages"
      ;;
  esac
}

