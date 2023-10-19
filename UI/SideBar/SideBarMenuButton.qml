import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

import "../"

Button
{
    property bool isSelected: false;
    property color pDefaultColor;
    property string pIcon

    id: menuBtn
    width: sharedVars.pSideBarWidth
    height: 50

    background:Rectangle
    {
        radius: 5
        color: isSelected ? sharedVars.pBtnSelectedColor : menuBtnMouseArea.containsMouse ? sharedVars.pBtnHoverColor: pDefaultColor
    }

    contentItem: Item
    {
        anchors.fill: parent
        Image
        {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 7.5
            source: pIcon
        }
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 60

            text: "Menu"
            color: sharedVars.pTextColor
            font.pointSize: 13
        }
    }

    onClicked:
    {
        if(animate.running)
            return;

        menuBtn.isSelected = ! menuBtn.isSelected;
        animate.running = true
    }

    MouseArea
    {
        id: menuBtnMouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onPressed: parent.clicked()
    }
}
