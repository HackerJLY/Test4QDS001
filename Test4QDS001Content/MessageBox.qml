import QtQuick
import QtQuick.Controls

Dialog {
    id: dialog
    width: 392
    height: 216

    modal: true
    focus: true

    property string messageTitle: "Prompt"
    property string messageText: ""

    // 返回结果
    signal finished(int code)

    // 按钮类型
    readonly property int ok: 0
    readonly property int okCancel: 1
    readonly property int yesNo: 2
    readonly property int yesNoCancel: 3

    // 返回值
    readonly property int resultOk: 1
    readonly property int resultCancel: 2
    readonly property int resultYes: 3
    readonly property int resultNo: 4

    // 临时保存回调
    property var _callback: null

    Overlay.modal: Rectangle {
        color: "#33000000"
    }

    background: Item {}
    anchors.centerIn: Overlay.overlay

    contentItem: MessageBoxForm {
        id: form
        anchors.fill: parent

        labelTitle.text: dialog.messageTitle
        labelContent.text: dialog.messageText

        btnCancel.onClicked: {
            dialog.close()
            finished(resultCancel)
            if(_callback) _callback(resultCancel)
        }

        btnOK.onClicked: {
            dialog.close()
            finished(resultOk)
            if(_callback) _callback(resultOk)
        }

        btnYes.onClicked: {
            dialog.close()
            finished(resultYes)
            if(_callback) _callback(resultYes)
        }

        btnNo.onClicked: {
            dialog.close()
            finished(resultNo)
            if(_callback) _callback(resultNo)
        }
    }

    // 设置按钮组合
    function setButtons(type)
    {
        form.btnOK.visible = false
        form.btnCancel.visible = false
        form.btnYes.visible = false
        form.btnNo.visible = false

        if (type === ok) {
            form.btnOK.visible = true
        } else if (type === okCancel) {
            form.btnOK.visible = true
            form.btnCancel.visible = true
        } else if (type === yesNo) {
            form.btnYes.visible = true
            form.btnNo.visible = true
        } else if (type === yesNoCancel) {
            form.btnYes.visible = true
            form.btnNo.visible = true
            form.btnCancel.visible = true
        }
    }

    // 打开 MessageBox，支持回调
    function show(title, text, buttons, callback) {
        dialog.messageTitle = title
        dialog.messageText = text
        setButtons(buttons)
        dialog._callback = callback || null
        dialog.open()
    }
}
