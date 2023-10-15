import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Dialogs
import QtQuick.Controls

import "Resizing Functionality"

Window
{
    id: mainWindow
    visible: true
    width: 860; height: 491

    minimumWidth: 355
    minimumHeight: 279

    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowMinimizeButtonHint | Qt.Window

    property bool maximized: false

    // #2c313d
    ResizeTop{id: resizeTop;p_Color: "red"}
    ResizeBottom{p_Color: "red"}
    ResizeRight{p_Color: "red"}
    ResizeLeft{id: resizeLeft;p_Color: "red"}

    ResizeTopRight{p_Color: "blue"}
    ResizeTopLeft{p_Color: "blue"}
    ResizeBottomRight{p_Color: "blue"}
    ResizeBottomLeft{p_Color: "blue"}

    Rectangle
    {
        id: rect
        x: resizeLeft.width
        y: resizeTop.height

        width: parent.width - resizeLeft.width * 2
        height: parent.height - resizeTop.height * 2

        color: "#2c313d"

        CustomTitleBar{id: centerWidget}
        SideBar{id: mySideBar}
        StackView
        {
            id: stackView
            x: 50
            y: 25
            clip: true

            width: parent.width - 50
            height: parent.height - 25

            Behavior on x
            {
                NumberAnimation
                {
                    duration: 500
                }
            }

            Behavior on width
            {
                NumberAnimation
                {
                    duration: 500
                }
            }

            Component.onCompleted: stackView.push(Qt.resolvedUrl("CustomCenterWidget.qml"));
        }
    }
}
