import QtQuick
import QtQuick.Controls

Dialog {
    id: dialog

    width: 400
    height: 216

    implicitWidth: 400
    implicitHeight: 216

    modal: true
    focus: true

    // ========= 对外属性 =========
    property string inputTitle: ""
    property string inputTips: ""
    property string inputText: ""
    property bool passwordMode: false

    // ========= 回调 =========
    property var _callback: null

    Overlay.modal: Rectangle {
        color: "#33000000"
    }

    background: Item {}
    anchors.centerIn: Overlay.overlay

    contentItem: InputBoxForm {
        id: form

        // ===== UI绑定 =====
        labelTitle.text: dialog.inputTitle
        labelTips.text: dialog.inputTips
        textFieldInput.text: dialog.inputText

        checkBoxPassword.visible: dialog.passwordMode

        textFieldInput.echoMode:
            dialog.passwordMode && !checkBoxPassword.checked
            ? TextInput.Password
            : TextInput.Normal

        // ===== OK =====
        btnOK.onClicked: {
            dialog.close()

            if (dialog._callback) {
                dialog._callback(true, textFieldInput.text)
            }
        }

        // ===== Cancel =====
        btnCancel.onClicked: {
            dialog.close()

            if (dialog._callback) {
                dialog._callback(false, textFieldInput.text)
            }
        }

        // ===== 密码图标 =====
        checkBoxPassword.indicator: Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit

            source: {
                if (!form.checkBoxPassword.enabled)
                    return form.checkBoxPassword.checked ?
                           "images/PasswordShow.Disabled.png" :
                           "images/PasswordHide.Disabled.png"

                if (form.checkBoxPassword.pressed)
                    return form.checkBoxPassword.checked ?
                           "images/PasswordShow.Click.png" :
                           "images/PasswordHide.Click.png"

                if (form.checkBoxPassword.hovered)
                    return form.checkBoxPassword.checked ?
                           "images/PasswordShow.Hover.png" :
                           "images/PasswordHide.Hover.png"

                return form.checkBoxPassword.checked ?
                       "images/PasswordShow.Normal.png" :
                       "images/PasswordHide.Normal.png"
            }
        }
    }

    // =====================================================
    // 对外 API
    // =====================================================

    function show(title, tips, defaultText, password, callback)
    {
        inputTitle = title || ""
        inputTips = tips || ""
        inputText = defaultText || ""
        passwordMode = password || false

        _callback = callback || null

        // ✅ 重置 UI
        form.labelTitle.text = inputTitle
        form.labelTips.text  = inputTips
        form.textFieldInput.text = inputText

        // 重置密码框状态
        if (passwordMode)
            form.checkBoxPassword.checked = false

        open()
    }
}
