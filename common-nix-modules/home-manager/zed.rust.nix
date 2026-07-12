{ ... }:
{
  programs.zed-editor = {
    extensions = [ "toml" ];
    userSettings.lsp.rust-analyzer.initialization_options = {
      cargo.targetDir = true;
    };
  };
}
