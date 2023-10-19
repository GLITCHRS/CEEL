import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Button
{
    property Button self
    property MyRadioGroup pRadioGroup
    property string pImagePath
    property string pText
    property string pWindowPath

    // internal
    property bool isSelected: false;

    width: sharedVars.pSideBarWidth
    height: 50

    background:Rectangle
    {
        color: pRadioGroup.selected == self ? sharedVars.pBtnSelectedColor: self.hovered ? sharedVars.pBtnHoverColor: sharedVars.pBtnDefaultColor
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
            color: sharedVars.pTextColor
            font.pointSize: 13
        }
    }

    onClicked:
    {
        if(pRadioGroup.selected === self)
            return;
        pRadioGroup.selected = self;
        stackView.push(pWindowPath);
    }

    MouseArea
    {
        anchors.fill: parent

        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onPressed: parent.clicked()
    }
}
