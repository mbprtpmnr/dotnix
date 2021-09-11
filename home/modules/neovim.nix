{ config, pkgs, inputs, ...  }:

let
  vim-horizon = pkgs.vimUtils.buildVimPlugin {
    name = "vim-horizon";
    src = inputs.vim-horizon;
  };
in

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    # plugins = [
    #   pkgs.vimPlugins.onedark-vim
    #   pkgs.vimPlugins.lightline-vim
    #   pkgs.vimPlugins.vim-nix
    #   pkgs.vimPlugins.fzf-vim
    # ];
    plugins = with pkgs.vimPlugins; [
      onedark-vim
      lightline-vim
      vim-nix
      fzf-vim

      vim-horizon

      # Telescope
      telescope-nvim
      popup-nvim
      plenary-nvim
    ];
    extraConfig = ''
      colorscheme horizon
      highlight ColorColumn ctermbg=0 guibg=lightgrey
      set background=dark
      set clipboard=unnamedplus
      set colorcolumn=80
      set cursorline
      set expandtab
      set nowrap
      set nu rnu
      set shiftwidth=2
      set smartcase
      set smartindent
      set splitbelow
      set splitright
      set tabstop=2 softtabstop=2
      syntax on

      let mapleader=" "
      nnoremap <silent> <Leader>b :Buffers<CR>
      nnoremap <silent> <C-f> :Telescope find_files<CR>
    '';
    extraPackages = [
      pkgs.nixfmt 
    ];
  };
}
