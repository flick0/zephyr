import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland

import "root:/"

AnimatedImage {
    id: wallpaper

	asynchronous: true
    cache: true

    source: Config.wallpaperImage

    property real height_scale: Hyprland.focusedMonitor.height > sourceSize.height ? Hyprland.focusedMonitor.height / sourceSize.height : sourceSize.height / Hyprland.focusedMonitor.height
    height: Hyprland.focusedMonitor.height
    width: sourceSize.width * height_scale
  
    horizontalAlignment: Image.AlignLeft

    property int extraWidth: wallpaper.width - Hyprland.focusedMonitor.width
    property int wallpaper_x: - (Hyprland.focusedMonitor.activeWorkspace.id - 1) * extraWidth / 9

    x: wallpaper_x

    Behavior on x {
        NumberAnimation {
            duration: 570

            easing.bezierCurve: [0.23,1,0.61,1,1,1]
            easing.type: Easing.BezierSpline
        }
    }
}