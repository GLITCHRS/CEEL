import QtQuick

Rectangle
{
    property string p_Color;

    color: p_Color

    width: 5

    anchors.right: rect.right
    anchors.top: rect.top
    anchors.bottom: rect.bottom

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
