{ ... }: {
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir = "~/Music";
    settings = {
      # Directory
      ncmpcpp_directory = "~/.config/ncmpcpp";
      mpd_host = "~/.config/mpd/socket";
      mpd_port = 0;

      # General
      external_editor = "nvim";
      message_delay_time = 1;
      playlist_disable_highlight_delay = 2;
      autocenter_mode = "yes";
      centered_cursor = "yes";
      ignore_leading_the = "yes";
      allow_for_physical_item_deletion = "no";
      connected_message_on_startup = "no";
      cyclic_scrolling = "yes";
      mouse_support = "yes";
      mouse_list_scroll_whole_page = "yes";
      lines_scrolled = "1";
      playlist_shorten_total_times = "yes";
      playlist_display_mode = "columns";
      browser_display_mode = "columns";
      search_engine_display_mode = "columns";
      playlist_editor_display_mode = "columns";
      user_interface = "classic";
      follow_now_playing_lyrics = "yes";
      display_bitrate = "no";
      startup_screen = "playlist";

      # Progress Bar
      progressbar_look = "───";
      progressbar_color = "black";
      progressbar_elapsed_color = "blue";

      # Colours
      main_window_color = "blue";
      color1 = "white";
      color2 = "blue";

      # UI Visibility
      header_visibility = "no";
      statusbar_visibility = "no";
      titles_visibility = "no";

      # UI Appearance
      now_playing_prefix = "$b$6>$7 ";
      now_playing_suffix = "  $/b$7";
      current_item_prefix = "$b$5>$/b$7 ";
      current_item_suffix = "  $7";
      song_status_format = "$7%t";
      song_list_format = "$7%a - %t$R  %l";
      song_columns_list_format = "(53)[white]{tr} (45)[magenta]{a}";
      song_library_format = "{%a - %t} (%b)|{%f}";
      song_window_title_format = "Music";
    };
    bindings = [
      {
        key = "k";
        command = "scroll_up";
      }
      {
        key = "shift-k";
        command = [
          "select_item"
          "scroll_up"
        ];
      }
      {
        key = "j";
        command = "scroll_down";
      }
      {
        key = "shift-j";
        command = [
          "select_item"
          "scroll_down"
        ];
      }
      {
        key = "l";
        command = "show_lyrics";
      }
      {
        key = "e";
        command = "edit_lyrics";
      }
      {
        key = "r";
        command = "refetch_lyrics";
      }
      {
        key = "space";
        command = "toggle_lyrics_update_on_song_change";
      }
      {
        key = "enter";
        command = "play_item";
      }
      {
        key = "enter";
        command = "enter_directory";
      }
      {
        key = "enter";
        command = "toggle_output";
      }
      {
        key = "enter";
        command = "run_action";
      }
      {
        key = "space";
        command = "add_item_to_playlist";
      }
      {
        key = "space";
        command = "toggle_visualization_type";
      }
      {
        key = "delete";
        command = "delete_playlist_items";
      }
      {
        key = "delete";
        command = "delete_browser_items";
      }
      {
        key = "delete";
        command = "delete_stored_playlist";
      }
      {
        key = "right";
        command = "next_column";
      }
      {
        key = "right";
        command = "slave_screen";
      }
      {
        key = "right";
        command = "volume_up";
      }
      {
        key = "+";
        command = "volume_up";
      }
      {
        key = "left";
        command = "previous_column";
      }
      {
        key = "left";
        command = "master_screen";
      }
      {
        key = "left";
        command = "volume_down";
      }
      {
        key = "-";
        command = "volume_down";
      }
      {
        key = ":";
        command = "execute_command";
      }
      {
        key = "tab";
        command = "next_screen";
      }
      {
        key = "shift-tab";
        command = "previous_screen";
      }
      {
        key = "f1";
        command = "show_help";
      }
      {
        key = "1";
        command = "show_playlist";
      }
      {
        key = "2";
        command = "show_browser";
      }
      {
        key = "2";
        command = "change_browse_mode";
      }
      {
        key = "3";
        command = "show_search_engine";
      }
      {
        key = "3";
        command = "reset_search_engine";
      }
      {
        key = "4";
        command = "show_media_library";
      }
      {
        key = "4";
        command = "toggle_media_library_columns_mode";
      }
      {
        key = "5";
        command = "show_playlist_editor";
      }
      {
        key = "6";
        command = "show_tag_editor";
      }
      {
        key = "7";
        command = "show_outputs";
      }
      {
        key = "8";
        command = "show_visualizer";
      }
      {
        key = "=";
        command = "show_clock";
      }
      {
        key = "@";
        command = "show_server_info";
      }
      {
        key = "s";
        command = "stop";
      }
      {
        key = "p";
        command = "pause";
      }
      {
        key = ">";
        command = "next";
      }
      {
        key = "<";
        command = "previous";
      }
      {
        key = "ctrl-h";
        command = "jump_to_parent_directory";
      }
      {
        key = "ctrl-h";
        command = "replay_song";
      }
      {
        key = "backspace";
        command = "jump_to_parent_directory";
      }
      {
        key = "backspace";
        command = "replay_song";
      }
      {
        key = "backspace";
        command = "play";
      }
      {
        key = "f";
        command = "seek_forward";
      }
      {
        key = "b";
        command = "seek_backward";
      }
      {
        key = "z";
        command = "toggle_random";
      }
      {
        key = "y";
        command = "save_tag_changes";
      }
      {
        key = "y";
        command = "start_searching";
      }
      {
        key = "y";
        command = "toggle_single";
      }
      {
        key = "R";
        command = "toggle_consume";
      }
      {
        key = "Y";
        command = "toggle_replay_gain_mode";
      }
      {
        key = "T";
        command = "toggle_add_mode";
      }
      {
        key = "|";
        command = "toggle_mouse";
      }
      {
        key = "#";
        command = "toggle_bitrate_visibility";
      }
      {
        key = "Z";
        command = "shuffle";
      }
      {
        key = "x";
        command = "toggle_crossfade";
      }
      {
        key = "X";
        command = "set_crossfade";
      }
      {
        key = "u";
        command = "update_database";
      }
      {
        key = "ctrl-s";
        command = "sort_playlist";
      }
      {
        key = "ctrl-s";
        command = "toggle_browser_sort_mode";
      }
      {
        key = "ctrl-s";
        command = "toggle_media_library_sort_mode";
      }
      {
        key = "ctrl-r";
        command = "reverse_playlist";
      }
      {
        key = "ctrl-f";
        command = "apply_filter";
      }
      {
        key = "ctrl-_";
        command = "select_found_items";
      }
      {
        key = "/";
        command = "find";
      }
      {
        key = "/";
        command = "find_item_forward";
      }
      {
        key = "?";
        command = "find";
      }
      {
        key = "?";
        command = "find_item_backward";
      }
      {
        key = ".";
        command = "next_found_item";
      }
      {
        key = ",";
        command = "previous_found_item";
      }
      {
        key = "w";
        command = "toggle_find_mode";
      }
      {
        key = "e";
        command = "edit_song";
      }
      {
        key = "e";
        command = "edit_library_tag";
      }
      {
        key = "e";
        command = "edit_library_album";
      }
      {
        key = "e";
        command = "edit_directory_name";
      }
      {
        key = "e";
        command = "edit_playlist_name";
      }
      {
        key = "i";
        command = "show_song_info";
      }
      {
        key = "I";
        command = "show_artist_info";
      }
      {
        key = "g";
        command = "jump_to_position_in_song";
      }
      {
        key = "ctrl-v";
        command = "select_range";
      }
      {
        key = "v";
        command = "reverse_selection";
      }
      {
        key = "V";
        command = "remove_selection";
      }
      {
        key = "B";
        command = "select_album";
      }
      {
        key = "a";
        command = "add_selected_items";
      }
      {
        key = "c";
        command = "clear_playlist";
      }
      {
        key = "c";
        command = "clear_main_playlist";
      }
      {
        key = "C";
        command = "crop_playlist";
      }
      {
        key = "C";
        command = "crop_main_playlist";
      }
      {
        key = "m";
        command = "move_sort_order_up";
      }
      {
        key = "m";
        command = "move_selected_items_up";
      }
      {
        key = "n";
        command = "move_sort_order_down";
      }
      {
        key = "n";
        command = "move_selected_items_down";
      }
      {
        key = "M";
        command = "move_selected_items_to";
      }
      {
        key = "A";
        command = "add";
      }
      {
        key = "S";
        command = "save_playlist";
      }
      {
        key = "o";
        command = "jump_to_playing_song";
      }
      {
        key = "G";
        command = "jump_to_browser";
      }
      {
        key = "G";
        command = "jump_to_playlist_editor";
      }
      {
        key = "~";
        command = "jump_to_media_library";
      }
      {
        key = "E";
        command = "jump_to_tag_editor";
      }
      {
        key = "U";
        command = "toggle_playing_song_centering";
      }
      {
        key = "P";
        command = "toggle_display_mode";
      }
      {
        key = "!";
        command = "toggle_separators_between_albums";
      }
      {
        key = "L";
        command = "toggle_lyrics_fetcher";
      }
      {
        key = "F";
        command = "fetch_lyrics_in_background";
      }
      {
        key = "alt-l";
        command = "toggle_fetching_lyrics_in_background";
      }
      {
        key = "ctrl-l";
        command = "toggle_screen_lock";
      }
      {
        key = "`";
        command = "toggle_library_tag_type";
      }
      {
        key = "`";
        command = "add_random_items";
      }
      {
        key = "ctrl-p";
        command = "set_selected_items_priority";
      }
      {
        key = "q";
        command = "quit";
      }
    ];
  };
}
