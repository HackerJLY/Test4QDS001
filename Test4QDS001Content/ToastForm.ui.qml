import QtQuick
import QtQuick.Controls 2.15

Rectangle {
    id: root

    // --- 关键修改：取消固定宽高，改为自适应内容 ---
    width: label.contentWidth + 40 // 左右留出 20px 的边距
    height: label.contentHeight + 40 // 上下留出 10px 的边距

    color: "#eb222222"
    radius: height / 2 // 让圆角随高度变化，始终保持半圆效果
    opacity: 0 // 修正：初始透明度应为 0
    visible: opacity > 0

    property alias text: label.text

    Label {
        id: label
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 14
        text: "Toast Message"

        // 如果文本极长，可以设置最大宽度并开启换行
        // 关键：限制 Label 本身的最大宽度
        //width: Math.min(contentWidth, 400)
        //wrapMode: Text.WordWrap
        //horizontalAlignment: Text.AlignHCenter
        //verticalAlignment: Text.AlignVCenter
    }
}
