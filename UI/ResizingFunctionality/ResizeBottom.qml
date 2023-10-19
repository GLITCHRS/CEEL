import QtQuick

Rectangle
{
    property QtObject windowTarget
    property string p_Color

    id: resizeBottom
    color: p_Color
    height: 5
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.left: parent.left

    MouseArea
    {
        anchors.fill: parent

        anchors.bottomMargin: 0
        anchors.rightMargin: 10
        anchors.leftMargin: 10

        cursorShape: Qt.SizeVerCursor

        DragHandler
        {
            target: null
            onActiveChanged: if(active){resizeBottom.windowTarget.startSystemResize(Qt.BottomEdge)}
        }
    }
}
