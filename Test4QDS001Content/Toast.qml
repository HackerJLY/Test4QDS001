pragma Singleton
import QtQuick

ToastForm {
    id: toast

    // 逻辑：寻找当前活动的窗口作为父节点
    parent: Window.window ? Window.window.contentItem : null
    anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined
    anchors.bottom: parent ? parent.bottom : undefined
    anchors.bottomMargin: 100
    z: 9999

    /**
     * @param container: 传入当前的父容器 (如 Window 的 contentItem 或 Page)
     * @param msg: 提示文本
     * @param duration: 持续时间
     */
    function show(container, msg, duration = 2000) {
        if (!container) {
            console.error("Toast Error: 必须传入有效的容器对象！")
            return
        }

        // 1. 强制绑定父节点
        toast.parent = container

        // 2. 动态重新绑定锚点为完全居中
        toast.anchors.centerIn = container // 替换之前的 horizontalCenter 和 bottom 逻辑 [cite: 5]

        // 3. 设置内容并立即显示
        toast.text = msg
        timer.stop()
        toast.opacity = 1

        // 4. 启动定时器
        timer.interval = duration
        timer.start()
    }

    Timer {
        id: timer
        onTriggered: {
            anim.to = 0
            anim.start()
        }
    }

    PropertyAnimation {
        id: anim
        target: toast
        property: "opacity"
        duration: 300
        easing.type: Easing.OutQuad
    }
}
