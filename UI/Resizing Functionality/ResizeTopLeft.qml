import QtQuick

Rectangle
{
    property string p_Color;

    color: p_Color

    width: 5
    height: 5
    anchors.top: parent.top
    anchors.left: parent.left

    MouseArea
    {
        id: topLeft

        anchors.fill: parent

        anchors.topMargin: 0
        anchors.leftMargin: 0

        cursorShape: Qt.SizeFDiagCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.TopEdge | Qt.LeftEdge)}
        }
    }

}
