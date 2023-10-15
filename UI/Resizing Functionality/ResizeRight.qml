import QtQuick

Rectangle
{
    property string p_Color;

    color: p_Color

    width: 5

    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    MouseArea
    {
        id: resizeRight

        anchors.fill: parent

        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        cursorShape: Qt.SizeHorCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.RightEdge)}
        }
    }
}
