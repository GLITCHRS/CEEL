import QtQuick

Rectangle
{
    property QtObject windowTarget
    property string p_Color;

    id: resizeBottomRight
    color: p_Color

    width: rootConstants.pResizeBarThickness
    height: rootConstants.pResizeBarThickness
    anchors.right: parent.right
    anchors.bottom: parent.bottom

    MouseArea
    {
        anchors.fill: parent

        anchors.bottomMargin: 0
        anchors.rightMargin: 0

        cursorShape: Qt.SizeFDiagCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){resizeBottomRight.windowTarget.startSystemResize(Qt.BottomEdge | Qt.RightEdge)}
        }
    }

}
