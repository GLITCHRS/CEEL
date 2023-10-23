import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Button
{
    property Button self
    property SideBarButtonsGroup pRadioGroup
    property string pImagePath
    property string pText
    property string pWindowPath

    // internal
    property bool isSelected: false;

    width: selfSharedProperties.pSideBarWidth - 10
    height: 50

    onHoveredChanged: if(self.hovered) self.scale = 1.05; else self.scale = 1.0;

    anchors
    {
        left: parent.left
        leftMargin: 5
    }

    background:Rectangle
    {
        radius: 50
        color: pRadioGroup.selectedBtn == self ? sideBar.pSharedProperties.pBtnSelectedColor: self.hovered ? rootShared.pBtnHoverColor: rootShared.pBtnDefaultColor
    }

    contentItem: Item
    {
        anchors.fill: parent
        Image
        {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 7.5
            source: pImagePath
            fillMode: Image.PreserveAspectFit
        }
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 60

            text: pText
            color: globalShared.pTextColor
            font.pointSize: 13
        }
    }

    onClicked:
    {
        if(pRadioGroup.selectedBtn == self)
            return;

        pRadioGroup.selectedBtn = self;
        pRadioGroup.attachedWindow = pWindowPath;
        stackView.push(pRadioGroup.attachedWindow);
    }

    Behavior on scale
    {
        NumberAnimation
        {
            duration: 200
        }
    }

    MouseArea
    {
        anchors.fill: parent

        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onPressed: parent.clicked()
    }
}
