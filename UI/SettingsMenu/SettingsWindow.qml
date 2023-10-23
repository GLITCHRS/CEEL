import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../"

Rectangle
{
    id: settingsWindow
    color: globalShared.pBackgroundColor

    Rectangle
    {
        color: "transparent"

        x: parent.width / 6
        width: parent.width - 100
        height: parent.height

        GridLayout
        {
            anchors
            {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            height: parent.height - 50

            rows: 3
            columns: 2

            columnSpacing: 15

            Text
            {
                Layout.row: 0
                Layout.column: 0
                text: "Username"
                color: globalShared.pTextColor
                font.pointSize: 14
            }

            Rectangle
            {
                Layout.row: 0
                Layout.column: 1
                Layout.preferredWidth: 400
                Layout.preferredHeight: 50
                radius: 20

                color: "#DA0C81"

                TextInput
                {
                    anchors.fill: parent

                    verticalAlignment: TextInput.AlignVCenter
                    horizontalAlignment: TextInput.AlignHCenter

                    font.pointSize: 14
                    font.bold: true
                }
            }

            Text
            {
                Layout.row: 1
                Layout.column: 0
                text: "Email"
                color: globalShared.pTextColor
                font.pointSize: 14
            }

            Rectangle
            {
                Layout.row: 1
                Layout.column: 1
                Layout.preferredWidth: 400
                Layout.preferredHeight: 50
                radius: 20

                color: "#DA0C81"

                TextInput
                {
                    anchors.fill: parent

                    verticalAlignment: TextInput.AlignVCenter
                    horizontalAlignment: TextInput.AlignHCenter

                    font.pointSize: 14
                    font.bold: true
                }
            }

            Text
            {
                Layout.row: 2
                Layout.column: 0
                text: "Password"
                color: globalShared.pTextColor
                font.pointSize: 14
            }

            Rectangle
            {
                Layout.row: 2
                Layout.column: 1
                Layout.preferredWidth: 400
                Layout.preferredHeight: 50
                radius: 20

                color: "#DA0C81"

                TextInput
                {
                    anchors.fill: parent

                    verticalAlignment: TextInput.AlignVCenter
                    horizontalAlignment: TextInput.AlignHCenter

                    font.pointSize: 14
                    font.bold: true
                }
            }
        }

        Rectangle
        {
            Layout.row: 2
            Layout.column: 1
            Layout.preferredWidth: 400
            Layout.preferredHeight: 50
            radius: 20

            color: "#DA0C81"

            TextInput
            {
                anchors.fill: parent

                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter

                font.pointSize: 14
                font.bold: true
            }
        }
    }

    Switch
    {
        anchors
        {
            left: parent.left
            bottom: parent.bottom
        }

        checked: rootShared.pMode === "lightMode"
        onCheckedChanged:
        {
            if(checked){ rootShared.pMode = "lightMode"; } else{ rootShared.pMode = "darkMode"; }
        }
    }
}
