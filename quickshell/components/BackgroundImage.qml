import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtMultimedia
import QtQuick.Shapes

import "root:/"

Rectangle {
    height: Hyprland.focusedMonitor.height
    width: Hyprland.focusedMonitor.width

    color: Colors.surface ?? "black"

    Video {
        id: wallpaper
        source: Config.wallpaperImage
        muted: true

        autoPlay: true
        loops: MediaPlayer.Infinite

        fillMode : VideoOutput.Stretch

        property int sourceHeight : wallpaper.metaData.value(27).height
        property int sourceWidth : wallpaper.metaData.value(27).width

        property real height_scale: sourceHeight / Hyprland.focusedMonitor.height
        height: sourceHeight / height_scale
        width: sourceWidth / height_scale

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
}

