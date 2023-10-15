import QtQuick
import QtQuick.Layouts

Rectangle
{
    id: titleBar
    anchors
    {
        top: parent.top
        right: parent.right
    }

    width: parent.width - mySideBar.width
    height: 25

    color: "#1c1d20"

    MouseArea
    {
        anchors.fill: parent

        property real lastMouseX: 0
        property real lastMouseY: 0

        onPressed:
        {
            lastMouseX = mouseX
            lastMouseY = mouseY
        }
        onMouseXChanged: mainWindow.x += (mouseX - lastMouseX)
        onMouseYChanged: mainWindow.y += (mouseY - lastMouseY)
    }

    RowLayout
    {
        anchors
        {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }

        layoutDirection: Qt.RightToLeft

        Rectangle
        {
            id: closeBtn
            Layout.alignment: Qt.AlignRight
            width: 50
            height: 20
            radius: 40

            color: btn1MA.containsMouse ? "red": "#1c1d20"

            Image
            {
                anchors.centerIn: parent
                source: "images/close17.png"
            }

            MouseArea
            {
                id: btn1MA
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: Qt.quit()
            }
        }

        Rectangle
        {
            id: maximizeBtn
            Layout.alignment: Qt.AlignRight
            width: 50
            height: 20
            radius: 40

            color: btn2MA.containsMouse ? "#808080": "#1c1d20"

            Image
            {
                anchors.centerIn: parent
                source: mainWindow.maximized ? "images/notMaximize17.png": "images/maximize17.png"
            }

            MouseArea
            {
                id: btn2MA
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked:
                {
                    if(mainWindow.maximized)
                    {
                        mainWindow.maximized = false;
                        mainWindow.showNormal();
                    }
                    else
                    {
                        mainWindow.maximized = true;
                        mainWindow.showMaximized();
                    }
                }

            }
        }

        Rectangle
        {
            id: minimizeBtn
            Layout.alignment: Qt.AlignRight
            width: 50
            height: 20
            radius: 40

            color: btn3MA.containsMouse ? "#808080": "#1c1d20"

            Image
            {
                anchors.centerIn: parent
                source: "images/minimize17.png"
            }

            MouseArea
            {
                id: btn3MA
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked:
                {
                    mainWindow.showMinimized();
                }

            }
        }
    }
}
