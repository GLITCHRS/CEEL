import QtQuick

Rectangle
{
    property QtObject windowTarget
    property string p_Color;

    id: resizeBottomLeft
    color: p_Color
    width: 5
    height: 5
    anchors.left: parent.left
    anchors.bottom: parent.bottom

    MouseArea
    {
        anchors.fill: parent

        anchors.bottomMargin: 0
        anchors.leftMargin: 0

        cursorShape: Qt.SizeBDiagCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){resizeBottomLeft.windowTarget.startSystemResize(Qt.BottomEdge | Qt.LeftEdge)}
        }
    }
}
