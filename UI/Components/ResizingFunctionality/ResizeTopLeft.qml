import QtQuick

Rectangle
{
    property QtObject windowTarget
    property string p_Color;

    id: resizeTopLeft
    color: p_Color

    width: rootConstants.pResizeBarThickness
    height: rootConstants.pResizeBarThickness
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
            onActiveChanged: if(active){resizeTopLeft.windowTarget.startSystemResize(Qt.TopEdge | Qt.LeftEdge)}
        }
    }

}
