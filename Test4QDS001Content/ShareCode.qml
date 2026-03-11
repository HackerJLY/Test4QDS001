import QtQuick
import QtQuick.Controls

Dialog {
    id: dialog
    width: 391
    height: 214


    modal: true
    focus: true

    // 设置遮罩层颜色
    Overlay.modal: Rectangle {
        color: "#33000000"
        //radius: 10
    }

    // 关键：取消 Dialog 自带背景
    background: Item { } // 空 Item 或者透明

    // 居中父窗口
    //anchors.centerIn: parent
    anchors.centerIn: Overlay.overlay

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
