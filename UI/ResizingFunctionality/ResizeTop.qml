import QtQuick

Rectangle
{
    property QtObject windowTarget
    property string p_Color;

    id: resizeTop
    color: p_Color

    height: 5

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top

    MouseArea
    {
        anchors.fill: parent

        anchors.topMargin: 0
        anchors.rightMargin: 10
        anchors.leftMargin: 10

        cursorShape: Qt.SizeVerCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){resizeTop.windowTarget.startSystemResize(Qt.TopEdge)}
        }
    }
}
