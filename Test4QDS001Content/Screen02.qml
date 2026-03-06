import QtQuick
import "Log.js" as Log

Screen02Form {

    labelCurrentValue.text: qsTr("当前值: ") + counter.value

    mouseAreaInTitleBar.onPressed: {
        // 这里的 rectangleRoot 是 UI 文件里的根节点 ID
        Window.window.startSystemMove();
    }

    btnTest.background: Item {
        implicitWidth: 30
        implicitHeight: 30
    }

    ShareCode {
        id: shareDialog
    }

    MessageBox {
        id: messageBox

        onFinished: function(code)
        {
            if(code === messageBox.resultOk)
            {
                console.log("用户点击 OK")
            }
            else if(code === messageBox.resultCancel)
            {
                console.log("用户点击 Cancel")
            }
            else if(code === messageBox.resultYes)
            {
                console.log("用户点击 Yes")
            }
            else if(code === messageBox.resultNo)
            {
                console.log("用户点击 No")
            }
        }
    }

    btnTest.onClicked: {
        Log.log(`btnTest Pressed`)

        counter.increment()

        Toast.show(parent, qsTr("你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？"), 1500);

        //shareDialog.openWithCode("DP2Sr8wR")

        //messageBox.show(qsTr("提示"), qsTr("操作完成"), messageBox.ok)

        messageBox.show(qsTr("提示"), qsTr("你还好吗？"), messageBox.yesNo)
    }

    imageBg_btnTest.source:
            !btnTest.enabled ? "images/btn_bg_disabled.png" :
            btnTest.pressed  ? "images/btn_bg_push.png"  :
            btnTest.hovered  ? "images/btn_bg_hover.png"    :
                               "images/btn_bg_normal.png"

    btnClose.background: Item {
        implicitWidth: 30
        implicitHeight: 30
    }

    btnClose.onClicked: {
        Log.log(`btnClose Pressed`)

        close();
    }

    imageBg_btnClose.source: "images/btnClose.png"

    imageBg_btnClose.sourceClipRect: !btnClose.enabled ? Qt.rect(81, 0, 27, 24) :
                                     btnClose.pressed  ? Qt.rect(54, 0, 27, 24) :
                                     btnClose.hovered  ? Qt.rect(27, 0, 27, 24) :
                                                         Qt.rect(0, 0, 27, 24)

}
