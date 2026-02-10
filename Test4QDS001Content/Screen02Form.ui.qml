

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls 2.15
import Test4QDS001 1.0
import QtQuick.Studio.DesignEffects

Rectangle {
    id: rectangleRoot
    width: Constants.width
    height: Constants.height
    color: "#131212"
    property alias rectangleTitleBar: rectangleTitleBar
    property alias mouseAreaInTitleBar: mouseAreaInTitleBar
    property alias labelTitle: labelTitle
    property alias imageBg_btnTest: imageBg_btnTest

    property alias btnTest: btnTest

    property alias btnClose: btnClose

    property alias imageBg_btnClose: imageBg_btnClose

    Button {
        id: btnTest
        x: 592
        y: 313
        width: 108
        height: 39
        text: qsTr("btnTest")
        icon.height: 52
        icon.width: 108
        flat: true

        Image {
            id: imageBg_btnTest
            x: 0
            y: 0
            width: 108
            height: 39
            source: "images/btn_bg_normal.png"
            fillMode: Image.Stretch
        }
    }

    Rectangle {
        id: rectangleTitleBar
        x: 0
        y: 0
        width: 1280
        height: 40
        color: "#464a53"

        MouseArea {
            id: mouseAreaInTitleBar
            x: 311
            y: 20
            anchors.fill: parent
        }

        Label {
            id: labelTitle
            x: 0
            y: 0
            width: 299
            height: 40
            text: qsTr("Test4QDS001")
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 21
        }

        Button {
            id: btnClose
            x: 1241
            y: 6
            width: 30
            height: 30
            opacity: 1
            text: qsTr("")
            icon.color: "#00ffffff"
            highlighted: false
            flat: true

            Image {
                id: imageBg_btnClose
                x: 0
                y: 0
                width: 30
                height: 30

                autoTransform: false
                sourceSize.height: 24
                sourceSize.width: 108
                fillMode: Image.Stretch

                source: "images/btnClose.png"
            }
        }
    }
}
