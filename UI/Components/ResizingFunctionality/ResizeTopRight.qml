import QtQuick

Rectangle
{
    property QtObject windowTarget
    property string p_Color;

    id: resizeTopRight
    color: p_Color

    width: rootConstants.pResizeBarThickness
    height: rootConstants.pResizeBarThickness
    anchors.right: parent.right
    anchors.top: parent.top

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
            onActiveChanged: if(active){resizeTopRight.windowTarget.startSystemResize(Qt.TopEdge | Qt.RightEdge)}
        }
    }
}
