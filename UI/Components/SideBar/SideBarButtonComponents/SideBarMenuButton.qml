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
    width: selfSharedProperties.pSideBarWidth - 10
    height: 50

    anchors
    {
        left: parent.left
        leftMargin: 5
    }

    background:Rectangle
    {
        radius: 5
        color: isSelected ? sideBar.pSharedProperties.pBtnSelectedColor : menuBtnMouseArea.containsMouse ? rootShared.pBtnHoverColor: pDefaultColor
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
            color: globalShared.pTextColor
            font.pointSize: 13
        }
    }

    onClicked:
    {
        if(sideBar.pConstProperties.pSideBarAnimation.running)
            return;

        menuBtn.isSelected = ! menuBtn.isSelected;
        sideBar.pConstProperties.pSideBarAnimation.running = true
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
