import QtQuick

Rectangle
{
    property string p_Color;

    color: p_Color

    width: 5
    height: 5
    anchors.left: rect.left
    anchors.bottom: rect.bottom

    MouseArea
    {
        id: bottomLeft

        anchors.fill: parent

        anchors.bottomMargin: 0
        anchors.leftMargin: 0

        cursorShape: Qt.SizeBDiagCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.BottomEdge | Qt.LeftEdge)}
        }
    }
}
