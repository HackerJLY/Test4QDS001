import QtQuick
import QtQuick.Controls

Dialog {
    id: dialog
    width: 392
    height: 216


    modal: true
    focus: true

    // 设置遮罩层颜色
    Overlay.modal: Rectangle {
        color: "#33000000"
        radius: 10
    }

    // Dialog 背景 + 圆角
    background: Rectangle {
        color: "white"       // Dialog 背景色
        radius: 12           // 圆角半径
        border.color: "#c0c0c0"
        border.width: 1
    }

    // 居中父窗口
    anchors.centerIn: parent

    contentItem: ShareCodeForm {
        id: form
        anchors.fill: parent

        btnCancel.onClicked: {
            console.log("Cancel pressed")
            dialog.close()
        }

        btnCopy.onClicked: {
            console.log("Copy pressed:", textFieldShareCode.text)
            dialog.close()
        }
    }

    // 定义一个函数，用于设置值并打开 Dialog
    function openWithCode(code) {
        form.textFieldShareCode.text = code
        shareDialog.open()
    }

}
