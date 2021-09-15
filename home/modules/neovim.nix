{ config, pkgs, inputs, ...  }:

let
  vim-horizon = pkgs.vimUtils.buildVimPlugin {
    pname = "vim-horizon";
    version = "vh";
    src = inputs.vim-horizon;
  };
in

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      onedark-vim
      lightline-vim
      vim-nix
      fzf-vim

      # vim-horizon
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

      let g:lightline = {'colorscheme' : 'horizon'}
    '';
    extraPackages = [
      pkgs.nixfmt 
    ];
  };
}
