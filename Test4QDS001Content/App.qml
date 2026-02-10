import QtQuick
import Test4QDS001

Window {
    id: mainWindow
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "Test4QDS001"

    flags: Qt.FramelessWindowHint | Qt.Window

    Screen02 {
        id: mainScreen

        anchors.centerIn: parent
    }

}

