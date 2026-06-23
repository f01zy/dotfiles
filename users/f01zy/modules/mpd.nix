{ config, ... }: {
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    playlistDirectory = "${config.home.homeDirectory}/.config/mpd/playlists";
    dbFile = "${config.home.homeDirectory}/.config/mpd/database";
    dataDir = "${config.home.homeDirectory}/.config/mpd";
    network.listenAddress = "${config.home.homeDirectory}/.config/mpd/socket";

    extraConfig = ''
      log_file           "${config.home.homeDirectory}/.config/mpd/log"
      pid_file           "${config.home.homeDirectory}/.config/mpd/pid"
      state_file         "${config.home.homeDirectory}/.config/mpd/state"
      sticker_file       "${config.home.homeDirectory}/.config/mpd/sticker.sql"
      auto_update        "yes"

      audio_output {
        type             "pulse"
        name             "PulseAudio"
      }

      audio_output {
        type             "fifo"
        name             "Visualizer feed"
        path             "/tmp/mpd.fifo"
        format           "44100:16:2"
      }
    '';
  };
}
