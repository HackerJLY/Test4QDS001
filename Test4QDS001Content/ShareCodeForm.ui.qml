

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    width: 392
    height: 216
    property alias textFieldShareCode: textFieldShareCode
    property alias btnCancel: btnCancel
    property alias labelTitle: labelTitle
    property alias btnCopy: btnCopy

    Image {
        id: bgImage
        anchors.fill: parent
        source: "images/bg.dialog.png"
        fillMode: Image.Stretch
    }

    ColumnLayout {
        id: columnLayout
        x: 8
        y: 13
        width: 376
        height: 195
        spacing: 20

        RowLayout {
            id: rowLayout
            Layout.fillWidth: true

            Label {
                id: labelTitle
                height: 25

                Layout.fillWidth: true

                color: "#131212"
                text: qsTr("Share Code")
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 14
            }
        }

        Item {
            Layout.fillHeight: true
        }

        RowLayout {
            id: rowLayout1

            y: 8
            width: parent.width
            height: 50

            TextField {
                id: textFieldShareCode

                Layout.fillWidth: true

                width: parent.width
                height: parent.height
                color: "#8c8c8c"
                text: "DP2Sr8wR"
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
                readOnly: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                placeholderText: qsTr("")

                // 设置背景
                background: Rectangle {
                    color: "#f0f0f0" // 背景色
                    radius: 8 // 圆角
                    border.color: "#c0c0c0" // 边框颜色
                    border.width: 1
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }

        RowLayout {
            id: rowLayout2
            x: 0
            y: 8
            width: parent.width
            height: 55
            spacing: 30

            Item {
                Layout.fillWidth: true
            }

            // Cancel 按钮
            Button {
                id: btnCancel
                text: qsTr("Cancel")
                flat: false
                font.pixelSize: 14
                Layout.preferredWidth: 100
                Layout.preferredHeight: 40

                // 背景自定义
                background: Rectangle {
                    color: "#e0e0e0" // 浅灰背景
                    radius: 8 // 圆角
                    border.color: "#c0c0c0"
                    border.width: 1
                }

                contentItem: Text {
                    text: btnCancel.text
                    color: "#4a4a4a" // 深灰文字
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            // Copy / OK 按钮
            Button {
                id: btnCopy
                text: qsTr("Copy")
                flat: false
                font.pixelSize: 14
                Layout.preferredWidth: 100
                Layout.preferredHeight: 40

                // 背景自定义
                background: Rectangle {
                    color: "#000000" // 黑色背景
                    radius: 8 // 圆角
                }

                contentItem: Text {
                    text: btnCopy.text
                    color: "#ffffff" // 白色文字
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Item {
                Layout.fillWidth: true
            }
        }
    }
}
