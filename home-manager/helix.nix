{...}:
{

# Helix editor configuration
  programs.helix = {
    enable = true;
    settings =
    {
      editor = {
        line-number = "relative";
        lsp = {
          display-messages = true;
        };
      };
      keys = {
        normal = {
          esc = [
            "collapse_selection"
            "keep_primary_selection"
          ];
          space = {
            q = ":q";
            space = "file_picker";
            w = ":w";
          };
        };
      };
      theme = "nord";
    };
  };
}
