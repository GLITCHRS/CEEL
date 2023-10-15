import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle
{
    id: sideBar
    color: "#1c1d20"

    anchors
    {
        top: parent.top
        left: parent.left
        bottom: parent.bottom
    }

    width: 50

    Behavior on width
    {
        NumberAnimation
        {
            id: animate
            duration: 500
        }
    }

    MyRadioGroup
    {
        id: radioGroup1
    }

    Rectangle
    {
        color: "red"
        anchors
        {
            left: parent.left
        }

        y: parent.height - 50

        width: 50

        Rectangle
        {
            id: settingsButton
            width: 50
            height: 50

            color: radioGroup1.selected === settingsButton ? "#2c313d": settingsButtonMouseArea.containsMouse ? "#353b47": "#1c1d20"

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
                    radioGroup1.selected = settingsButton;
                    stackView.push(Qt.resolvedUrl("CustomCenterWidget.qml"));
                }
            }
        }
    }

    Rectangle
    {
        anchors
        {
            top: parent.top
            left: parent.left
        }

        width: 50

        Rectangle
        {
            id: menuBtn
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

            MouseArea
            {
                id: menuBtnMouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked:
                {
                    if(sideBar.width === 50)
                    {
                        stackView.x += 100;
                        stackView.width -= 100;
                        sideBar.width += 100;
                    }
                    else
                    {
                        stackView.x -= 100;
                        stackView.width += 100;
                        sideBar.width -= 100;
                    }

                    menuBtn.isSelected = !menuBtn.isSelected;
                }
            }
        }

        Component.onCompleted: radioGroup1.selected = settingsButton;

        SideBarButton{id: homeBtn}
    }
}
