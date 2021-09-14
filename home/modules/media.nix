{ pkgs, config, ... }:

let
  home = config.home.homeDirectory;
in

{
  home.packages = with pkgs; [
    playerctl
    pulsemixer
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
      scripts = [ pkgs.mpvScripts.mpris ];
    };

    ncmpcpp = {
      enable = false;
      package = pkgs.ncmpcpp.override { visualizerSupport = true; };
      settings = { ncmpcpp_directory = "${home}/.local/share/ncmpcpp"; };
    };
  };

  services = {
    easyeffects.enable = true;

    mpd = {
      enable = false;
      musicDirectory = "${home}/Music";
      extraConfig = ''
        zeroconf_enabled "yes"
        zeroconf_name "MPD @ %h"
        input {
          plugin "curl"
        }
        audio_output {
          type "fifo"
          name "Visualizer"
          path "/tmp/mpd.fifo"
          format    "48000:16:2"
        }
        audio_output {
          type "pulse"
          name "PulseAudio"
        }
      '';
      network.listenAddress = "any";
      network.startWhenNeeded = true;
    };

    playerctld.enable = true;

    mpdris2.enable = false;
  };
}
