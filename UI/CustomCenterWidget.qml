import QtQuick
import QtQuick.Layouts

ColumnLayout
{
    x: ((rect.width) / 2) - 285 / 2 + 25
    y: (rect.height / 2) - ((72 * 3) / 2) + 7

    Rectangle
    {
        radius: 5
        width: 285; height: 72
        Layout.alignment: Qt.AlignCenter
        color: "#4a5064"

        Text
        {
            anchors.centerIn: parent
            text: "1"
            color: "white"
            font.pointSize: 20
            font.bold: true
        }

        MouseArea
        {
            anchors.fill: parent

            cursorShape: "PointingHandCursor"

            onClicked:
            {
                console.log("It worked!");
            }
        }
    }

    Rectangle
    {
        property string text

        radius: 5
        width: 285; height: 72
        Layout.alignment: Qt.AlignCenter
        color: "#4a5064"

        Text
        {
            anchors.centerIn: parent
            text: "1"
            color: "white"
            font.pointSize: 20
            font.bold: true
        }

        MouseArea
        {
            anchors.fill: parent

            cursorShape: "PointingHandCursor"

            onClicked:
            {
                console.log("It worked!");
            }
        }
    }

    Rectangle
    {
        property string text

        radius: 5
        width: 285; height: 72
        Layout.alignment: Qt.AlignCenter
        color: "#4b90da"

        Text
        {
            anchors.centerIn: parent
            text: "1"
            color: "white"
            font.pointSize: 20
            font.bold: true
        }

        MouseArea
        {
            anchors.fill: parent

            cursorShape: "PointingHandCursor"

            onClicked:
            {
                console.log("It worked!");
            }
        }
    }
}
