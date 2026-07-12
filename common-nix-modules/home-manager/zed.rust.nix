{ ... }:
{
  programs.zed-editor = {
    extensions = [ "rust" "toml" ];
    userSettings.lsp.rust-analyzer.initialization_options = {
      cargo.targetDir = true;
    };
  };
}

