import QtQuick

Rectangle
{
    property string p_Color;

    color: p_Color

    height: 5

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top

    MouseArea
    {
        id: resizeTop

        anchors.fill: parent

        anchors.topMargin: 0
        anchors.rightMargin: 10
        anchors.leftMargin: 10

        cursorShape: Qt.SizeVerCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.TopEdge)}
        }
    }
}
