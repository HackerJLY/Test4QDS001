import QtQuick
import QtQuick.Controls

Dialog {
    id: dialog
    width: 392
    height: 216

    modal: true
    focus: true

    property string title: "Prompt"
    property string text: ""

    // 返回结果
    signal result(int code)

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

    Overlay.modal: Rectangle {
        color: "#33000000"
    }

    background: Item {}

    anchors.centerIn: Overlay.overlay

    contentItem: MessageBoxForm {
        id: form
        anchors.fill: parent

        labelTitle.text: dialog.title
        labelContent.text: dialog.text

        btnCancel.onClicked: {
            dialog.close()
            dialog.result(dialog.resultCancel)
        }

        btnOK.onClicked: {
            dialog.close()
            dialog.result(dialog.resultOk)
        }

        btnYes.onClicked: {
            dialog.close()
            dialog.result(dialog.resultYes)
        }

        btnNo.onClicked: {
            dialog.close()
            dialog.result(dialog.resultNo)
        }
    }

    // 设置按钮组合
    function setButtons(type)
    {
        form.btnOK.visible = false
        form.btnCancel.visible = false
        form.btnYes.visible = false
        form.btnNo.visible = false

        if (type === ok)
        {
            form.btnOK.visible = true
        }
        else if (type === okCancel)
        {
            form.btnOK.visible = true
            form.btnCancel.visible = true
        }
        else if (type === yesNo)
        {
            form.btnYes.visible = true
            form.btnNo.visible = true
        }
        else if (type === yesNoCancel)
        {
            form.btnYes.visible = true
            form.btnNo.visible = true
            form.btnCancel.visible = true
        }
    }

    // 打开 MessageBox
    function show(title, text, buttons)
    {
        dialog.title = title
        dialog.text = text
        setButtons(buttons)
        dialog.open()
    }
}
