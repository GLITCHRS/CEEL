import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Button
{
    // to-be-provided properties
    property Button self;
    property string pImagePath;
    property color pColor
    property color pHoverColor

    background:Rectangle
    {
        id: rec
        radius: 5
        color: self.hovered ? pHoverColor: pColor
    }

    contentItem: Item
    {
        anchors.fill: parent
        Image
        {
            anchors.centerIn: parent
            source: pImagePath
            fillMode: Image.PreserveAspectFit
        }
    }

    MouseArea
    {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onPressed: parent.clicked()
    }
}
