import QtQuick
// import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland

import "root:/"
import "./components" as Components
import "./components/bar" as Bar
import "./windows" as Windows


Rectangle {
    anchors.fill: parent

    Windows.Background {}
    Windows.Bar {
		leftItems: [
            Bar.Workspace {},
            // Components.MusicLine {},
            Components.FastMusicLine {}
        ]

		

		// centerItems: [
		// ]

		rightItems: [
			Bar.Clock {}
		]
	}
}
