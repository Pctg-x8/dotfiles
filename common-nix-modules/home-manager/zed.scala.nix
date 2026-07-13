{ ... }:
{
  programs.zed-editor = {
    extensions = [ "scala" ];
    userSettings.lsp.metals = {
      initialization_options = {
        isHttpEnabled = true;
      };
    };
  };
}
