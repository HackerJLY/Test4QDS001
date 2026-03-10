import QtQuick
import QtQuick.Controls

InputBoxForm {

    // OK 按钮
    btnOK.onClicked: console.log("btnOK Pressed")

    // TextField 密码显示控制
    textFieldInput.echoMode: checkBoxPassword.checked ?
                             TextInput.Normal :
                             TextInput.Password

    // CheckBox 图片
    checkBoxPassword.indicator: Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit

        source: {
            if (!checkBoxPassword.enabled) {
                return checkBoxPassword.checked ?
                    "images/PasswordShow.Disabled.png" :
                    "images/PasswordHide.Disabled.png"
            }

            if (checkBoxPassword.pressed) {
                return checkBoxPassword.checked ?
                    "images/PasswordShow.Click.png" :
                    "images/PasswordHide.Click.png"
            }

            if (checkBoxPassword.hovered) {
                return checkBoxPassword.checked ?
                    "images/PasswordShow.Hover.png" :
                    "images/PasswordHide.Hover.png"
            }

            return checkBoxPassword.checked ?
                "images/PasswordShow.Normal.png" :
                "images/PasswordHide.Normal.png"
        }
    }
}
