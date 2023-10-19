import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Dialogs
import QtQuick.Controls

import "../ResizingFunctionality"
import "../SideBar"
import "../TitleBar"
import "../"

Window
{
    property bool maximized: false

    id: mainWindow
    visible: true
    width: 860; height: 491

    minimumWidth: 355
    minimumHeight: 279

    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowMinimizeButtonHint | Qt.Window

    ConstantVars{id: constants}
    SharedVars
    {
        id: sharedVars
    }

    // #2c313d
    ResizeTop{id: resizeTop;windowTarget: mainWindow; p_Color: "red"}
    ResizeBottom{windowTarget: mainWindow;p_Color: "red"}
    ResizeRight{windowTarget: mainWindow;p_Color: "red"}
    ResizeLeft{id: resizeLeft;windowTarget: mainWindow;p_Color: "red"}

    ResizeTopRight{windowTarget: mainWindow;p_Color: "blue"}
    ResizeTopLeft{windowTarget: mainWindow;p_Color: "blue"}
    ResizeBottomRight{windowTarget: mainWindow;p_Color: "blue"}
    ResizeBottomLeft{windowTarget: mainWindow;p_Color: "blue"}

    MyRadioGroup
    {
        id: radioGroup1
    }

    Animations{id: animate}

    Rectangle
    {
        id: rect
        x: resizeLeft.width
        y: resizeTop.height

        width: parent.width - resizeLeft.width * 2
        height: parent.height - resizeTop.height * 2

        color: "#2c313d"

        states:
        [
            State
            {
                name: "darkMode"
                when: sharedVars.pMode === "darkMode"
                PropertyChanges
                {
                    target: sharedVars
                    pBtnDefaultColor: constants.pBtnDefault_DarkColor
                    pBtnHoverColor: constants.pBtnHover_DarkColor
                    pBtnSelectedColor: constants.pBtnSelected_DarkColor

                    pTextColor: constants.pText_DarkColor
                }
            },

            State
            {
                name: "lightMode"
                when: sharedVars.pMode === "lightMode"
                PropertyChanges
                {
                    target: sharedVars
                    pBtnDefaultColor: constants.pBtnDefault_LightColor
                    pBtnHoverColor: constants.pBtnHover_LightColor
                    pBtnSelectedColor: constants.pBtnSelected_LightColor

                    pTextColor: constants.pText_LightColor
                }
            }
        ]

        SideBar{}
        CustomTitleBar{windowTarget: mainWindow}
        StackView
        {
            id: stackView

            x: sharedVars.pSideBarWidth
            y: 25
            clip: true

            initialItem: "CustomCenterWidget.qml"

            width: sharedVars.pSwipeViewWidth
            height: parent.height - 25
        }
    }
}
