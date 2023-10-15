import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Button
{
    id: homeBtn
    y: 50

    width: sideBar.width
    height: 50

    background:Rectangle
    {
        id: rec
        opacity: 1
        color: radioGroup1.selected === homeBtn ? "#2c313d": homeBtn.hovered ? "#353b47": "#1c1d20"
    }

    property bool isSelected: false;

    contentItem: Item
    {
        anchors.fill: parent
        Image
        {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 7.5
            source: "images/home36.png"
            fillMode: Image.PreserveAspectFit
        }
        Text{
            id: txt1

            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75

            text: "Home"
            color: "white"
            font.pointSize: 13
        }
    }

    onClicked:
    {
        radioGroup1.selected = homeBtn;
        stackView.push(Qt.resolvedUrl("TestPage.qml"));
    }

    MouseArea
    {
        id: homeBtnMouseArea
        anchors
        {
            top: rec.top
            bottom: rec.bottom
        }

        width: 50

        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onPressed: homeBtn.clicked()
    }
}
