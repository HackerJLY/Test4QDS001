

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
    width: 400
    height: 216
    property alias labelTips: labelTips
    property alias textFieldInput: textFieldInput
    property alias checkBoxPassword: checkBoxPassword
    property alias btnOK: btnOK
    property alias btnCancel: btnCancel
    property alias labelTitle: labelTitle

    Image {
        id: bgImage
        anchors.fill: parent
        source: "images/bg.dialog.png"
        fillMode: Image.Stretch
    }

    ColumnLayout {
        id: columnLayout
        x: 13
        y: 13
        width: 366
        height: 190
        spacing: 1

        RowLayout {
            id: rowLayout
            Layout.fillWidth: true

            Label {
                id: labelTitle
                height: 25

                Layout.fillWidth: true

                color: "#131212"
                text: qsTr("Prompt")
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 16
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
        }

        RowLayout {
            id: rowLayout1

            width: parent.width
            Layout.fillWidth: true
            Layout.fillHeight: true

            Label {
                id: labelTips
                height: 60
                color: "#464a53"
                text: "Input password"
                wrapMode: Text.WordWrap
                Layout.fillHeight: true
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
        }

        RowLayout {
            id: rowLayout2

            width: parent.width
            Layout.fillWidth: true
            Layout.fillHeight: true

            TextField {
                id: textFieldInput
                width: 136
                height: 56
                text: "123456"
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                placeholderText: qsTr("")
                color: "#464a53"

                // 设置背景
                background: Rectangle {
                    color: "#f0f0f0" // 背景色
                    radius: 8 // 圆角
                    border.color: "#c0c0c0" // 边框颜色
                    border.width: 1
                }
            }

            CheckBox {
                id: checkBoxPassword
                width: 30
                height: 30
                text: ""
                icon.height: 30
                icon.width: 30

                icon.source: "images/PasswordShow.Normal.png"
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
        }

        RowLayout {
            id: rowLayout3
            x: 0
            y: 8
            width: parent.width
            height: 55
            spacing: 30

            Item {
                Layout.fillWidth: true
            }

            // OK 按钮
            Button {
                id: btnOK
                text: qsTr("OK")
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
                    text: btnOK.text
                    color: "#ffffff" // 白色文字
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
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

            Item {
                Layout.fillWidth: true
            }
        }
    }
}
