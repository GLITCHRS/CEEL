import QtQuick

Rectangle
{
    property QtObject windowTarget
    property string p_Color;

    id: resizeLeft
    color: p_Color
    width: rootConstants.pResizeBarThickness

    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    MouseArea
    {
        anchors.fill: parent

        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        cursorShape: Qt.SizeHorCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){resizeLeft.windowTarget.startSystemResize(Qt.LeftEdge)}
        }
    }
}
