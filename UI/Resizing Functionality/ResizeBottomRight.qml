import QtQuick

Rectangle
{
    property string p_Color;

    color: p_Color

    width: 5
    height: 5
    anchors.right: rect.right
    anchors.bottom: rect.bottom

    MouseArea
    {
        id: bottomRight

        anchors.fill: parent

        anchors.bottomMargin: 0
        anchors.rightMargin: 0

        cursorShape: Qt.SizeFDiagCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.BottomEdge | Qt.RightEdge)}
        }
    }

}
