import QtQuick

Rectangle
{
    property string p_Color;

    color: p_Color

    width: 5

    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    MouseArea
    {
        id: resizeLeft

        anchors.fill: parent

        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        cursorShape: Qt.SizeHorCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.LeftEdge)}
        }
    }
}
