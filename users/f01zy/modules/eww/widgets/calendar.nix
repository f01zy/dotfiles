{ ... }:
{
  xdg.configFile = {
    "eww/widgets/calendar.yuck".text = ''
      (defpoll calendar-data :interval "1h" "calendar-generate")

      (defwidget calendar-widget []
        (box :orientation "vertical"
          (literal :content calendar-data)
        ))

      (defwindow calendar
        :monitor 0
        :geometry (geometry :x "0px" :y "12px" :anchor "top center")
        :stacking "bg"
        :focusable false
        (calendar-widget))
    '';

    "eww/styles/calendar.scss".text = ''
      .calendar-container {
        padding: 12px;
        border-radius: 8px;
        background-color: $background;
        color: $foreground;
        min-width: 260px;
      }
      .calendar-title {
        font-size: 18px;
        font-weight: bold;
        color: $color1;
        margin-bottom: 12px;
      }
      .weekdays label {
        color: $color3;
      }
      .calendar-grid .day {
        min-width: 26px;
        min-height: 26px;
        margin: 2px;
      }
      .calendar-grid .today {
        color: $background;
        background-color: $color2;
        border-radius: 6px;
        font-weight: bold;
      }
    '';
  };
}
