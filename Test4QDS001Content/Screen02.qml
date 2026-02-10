import QtQuick
import "Log.js" as Log

Screen02Form {

    mouseAreaInTitleBar.onPressed: {
        // 这里的 rectangleRoot 是 UI 文件里的根节点 ID
        Window.window.startSystemMove();
    }

    btnTest.background: Item {
        implicitWidth: 30
        implicitHeight: 30
    }

    btnTest.onClicked: {
        Log.log(`btnTest Pressed`)

        Toast.show(parent, tr("你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？你还好吗？"), 1500);
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
