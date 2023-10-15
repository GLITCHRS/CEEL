import QtQuick

Rectangle
{
    property string p_Color;

    color: p_Color
    height: 5
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.left: parent.left

    MouseArea
    {
        id: resizeBottom

        anchors.fill: parent

        anchors.bottomMargin: 0
        anchors.rightMargin: 10
        anchors.leftMargin: 10

        cursorShape: Qt.SizeVerCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.BottomEdge)}
        }
    }

}
