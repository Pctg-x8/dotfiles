{ ... }:
{
  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;

    extraConfig = ''
      set autoindent showmatch number incsearch ignorecase hidden matchtime=1
      set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
      set nocompatible
      set laststatus=2 showtabline=2 noshowmode cursorline

      syntax enable
      
      filetype plugin indent on

      " use 2sp indents for nix files
      autocmd FileType nix setlocal shiftwidth=2 softtabstop=2
    '';
  };
}
