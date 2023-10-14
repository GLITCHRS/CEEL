import QtQuick

Rectangle
{
    property string p_Color;

    color: p_Color

    width: 5
    height: 5
    anchors.right: rect.right
    anchors.top: rect.top

    MouseArea
    {
        id: topRight

        anchors.fill: parent

        anchors.topMargin: 0
        anchors.rightMargin: 0

        cursorShape: Qt.SizeBDiagCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.TopEdge | Qt.RightEdge)}
        }
    }
}
