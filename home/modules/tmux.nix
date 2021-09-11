{ config, pkgs, ...  }:

{
  programs.tmux = {
  	enable = true;
  	clock24 = true;
  	plugins = with pkgs.tmuxPlugins; [
  		sensible
  		yank
  		{
  			plugin = onedark-theme;
  			extraConfig = ''
          set -g @onedark_time_format "%I:%M %p"
  			'';
  		}
  	];
  
  	extraConfig = ''
  	'';
  };
}
