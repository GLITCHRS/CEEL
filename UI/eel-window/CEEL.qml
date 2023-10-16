import QtQuick


Window {
    id: root
    visible: true
    width: 800
    height: 450
    // Maybe side bar
    // Top bar
    Constants{id:constant}
    Rectangle {
        id: toolBar
        y: constant.pToolBarY
        width: constant.pToolBarWidth
        height: parent.height - y
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        color: constant.pToolBarColor
    }

    // Search bar
    // Filter Item
}
