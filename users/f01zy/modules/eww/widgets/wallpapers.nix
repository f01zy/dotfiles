{ ... }:
{
  xdg.configFile = {
    "eww/widgets/wallpapers.yuck".text = ''
      (defpoll wallpapers-list :interval "10m" :initial "[]" "wallpaper get-list")

      (defwidget wallpapers-widget []
        (box :class "window"
             :vexpand false
             :hexpand false
             :orientation "vertical"
          
          (box :class "scroll-container"
               :vexpand true
               :hexpand false
               :width 300
            (scroll :vscroll true
                    :vexpand true
              (box :orientation "vertical"
                (for item in wallpapers-list
                  (eventbox :class "image-container"
                            :onclick "wallpaper set \"''${item}\""
                    (box :class "image-list-preview"
                         :width 300
                         :height 200
                         :style "background-image: url(\"''${item}\");"))))))))

      (defwindow wallpapers
        :monitor 0
        :geometry (geometry :x "10px"
                            :y "12px"
                            :width "310px"
                            :height "94%"
                            :anchor "top right")
        :stacking "overlay"
        :exclusive false
        :focusable false
        (wallpapers-widget))
    '';

    "eww/styles/wallpapers.scss".text = ''
      .window {
        background-color: $background;
        padding: 8px;
        border-radius: 8px;
      }
      .wallpaper-header {
        margin-bottom: 10px;
        padding: 0 6px;
        label {
          color: $foreground;
          font-size: 16px;
          font-weight: bold;
        }
        .close-btn {
          color: $color3;
          font-size: 16px;
          padding: 2px 6px;
          border-radius: 6px;
          &:hover {
            color: $color2;
            background-color: rgba(255, 255, 255, 0.05);
          }
        }
      }
      .image-list-preview {
        padding: 4px;
        margin: 6px 4px;
        background-size: cover;
        background-position: center;
        border-radius: 6px;
      }
    '';
  };
}
