import QtQuick

Rectangle
{
    property string p_Color;

    color: p_Color
    height: 5
    anchors.bottom: rect.bottom
    anchors.right: rect.right
    anchors.left: rect.left

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
