{
  lib,
  config,
  ...
}: {
  # Import all your configuration modules here
  imports = [
    ./plugins
    ./options
    # ./colors
  ];
  options = {
    theme = lib.mkOption {
      default = "paradise";
      type = lib.types.enum ["paradise" "decay" "mountain" "tokyonight" "everforest" "everblush" "jellybeans" "aquarium" "gruvbox"];
    };
    assistant = lib.mkOption {
      default = "none";
      type = lib.types.enum ["copilot" "none"];
    };
  };
  config = {
    # The base16 theme to use, if you want to use another theme, change it in colorscheme.nix
    theme = "paradise";
    extraConfigLua = ''
      _G.theme = "${config.theme}"
    '';

    clipboard.providers.wl-copy.enable = true;
    clipboard.register = "unnamedplus";
  };
}
