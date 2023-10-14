import QtQuick
import QtQuick.Layouts

Rectangle
{
    id: sideBar
    color: "#1c1d20"

    x: 5
    y: 5
    width: 50
    height: rect.height - 10

    MyRadioGroup
    {
        id: radioGroup1
    }

    ColumnLayout
    {
        anchors
        {
            left: parent.left
            bottom: parent.bottom
        }
        Rectangle
        {
            id: settingsButton
            Layout.alignment: Qt.AlignRight
            width: 50
            height: 50
            radius: 10

            color: radioGroup1.selected === settingsButton ? "#4b90da": settingsButtonMouseArea.containsMouse ? "#353b47": "#1c1d20"

            Image
            {
                anchors.centerIn: parent
                source: "images/settings36.png"
            }

            MouseArea
            {
                id: settingsButtonMouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked:
                {
                    radioGroup1.selected = settingsButton
                }
            }
        }
    }

    ColumnLayout
    {
        anchors
        {
            top: parent.top
            left: parent.left
        }

        Rectangle
        {
            id: menuBtn
            Layout.alignment: Qt.AlignRight
            width: 50
            height: 50
            radius: 10
            color: isSelected ? "#4b90da": menuBtnMouseArea.containsMouse ? "#353b47": "#1c1d20"

            property bool isSelected: false;

            Image
            {
                anchors.centerIn: parent
                source: "images/menu36.png"
            }

            PropertyAnimation
            {
                id: animate
                target: sideBar
                property: "width"
                to:
                {
                    if(sideBar.width === 50)
                        return 150;
                    else
                        return 50;
                }

                duration: 500
                easing.type: Easing.InOutQuint
            }

            MouseArea
            {
                id: menuBtnMouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked:
                {
                    animate.running = true;
                    menuBtn.isSelected = !menuBtn.isSelected;
                }
            }
        }

        Rectangle
        {
            id: homeBtn
            Layout.alignment: Qt.AlignRight
            width: 50
            height: 50
            radius: 10
            color: radioGroup1.selected === homeBtn ? "#4b90da": homeBtnMouseArea.containsMouse ? "#353b47": "#1c1d20"

            property bool isSelected: false;

            Image
            {
                anchors.centerIn: parent
                source: "images/home36.png"
            }

            MouseArea
            {
                id: homeBtnMouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked:
                {
                    radioGroup1.selected = homeBtn
                }
            }
        }

        Component.onCompleted: radioGroup1.selected = homeBtn;
    }
}
