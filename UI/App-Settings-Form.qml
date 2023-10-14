import QtQuick
import QtQuick.Window
import QtQuick.Layouts

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

    Rectangle
    {
        id: rect
        anchors.fill: parent

        color: "#2c313d"

        CustomTitleBar{}
        SideBar{}
        CustomCenterWidget{}

        // #2c313d
        ResizeTop{p_Color: "red"}
        ResizeBottom{p_Color: "red"}
        ResizeRight{p_Color: "red"}
        ResizeLeft{p_Color: "red"}

        ResizeTopRight{p_Color: "blue"}
        ResizeTopLeft{p_Color: "blue"}
        ResizeBottomRight{p_Color: "blue"}
        ResizeBottomLeft{p_Color: "blue"}
    }
}
