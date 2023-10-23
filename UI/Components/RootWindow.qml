import QtQuick
import QtQuick.Controls

import "ResizingFunctionality"
import "SideBar"
import "TitleBar"
import "../"

Window
{
    property alias centralStackView: stackView
    property bool maximized: false

    id: mainWindow
    visible: true
    width: 860; height: 491

    minimumWidth: 355
    minimumHeight: 279

    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowMinimizeButtonHint | Qt.Window

    // #2c313d
    ResizeTop{id: resizeTop;windowTarget: mainWindow; p_Color: "red"}
    ResizeBottom{id: resizeBottom;windowTarget: mainWindow;p_Color: "red"}
    ResizeRight{id: resizeRight;windowTarget: mainWindow;p_Color: "red"}
    ResizeLeft{id: resizeLeft;windowTarget: mainWindow;p_Color: "red"}

    ResizeTopRight{windowTarget: mainWindow;p_Color: "blue"}
    ResizeTopLeft{windowTarget: mainWindow;p_Color: "blue"}
    ResizeBottomRight{windowTarget: mainWindow;p_Color: "blue"}
    ResizeBottomLeft{windowTarget: mainWindow;p_Color: "blue"}

    SideBar{id: sideBar}
    CustomTitleBar{id: titleBar;windowTarget: mainWindow}

    Rectangle
    {
        id: mainForm
        anchors
        {
            top: titleBar.bottom
            right: resizeRight.left
            left: sideBar.right
            bottom: resizeBottom.top
        }

        RCP{id: rootConstants}
        RSP{id: rootShared}
        GCP{id: globalConstants}
        GSP{id: globalShared}

        Rectangle
        {
            anchors.fill: parent
            color: globalShared.pBackgroundColor

            states:
            [
                State
                {
                    name: "darkMode"
                    when: rootShared.pMode === "darkMode"

                    PropertyChanges
                    {
                        target: rootShared

                        pBtnDefaultColor: rootConstants.pBtnDefault_DarkColor
                        pBtnHoverColor: rootConstants.pBtnHover_DarkColor
                    }

                    PropertyChanges
                    {
                        target: globalShared

                        pTextColor: globalConstants.pText_DarkColor
                        pBackgroundColor: globalConstants.pBackground_DarkColor
                    }

                    PropertyChanges
                    {
                        target: titleBar.pSharedProperties

                        pTitleBarColor: rootConstants.pTitleBar_SideBar_DarkColor
                        pTitleBarIcons: titleBar.pConstProperties.pTitleBarDarkIcons
                    }

                    PropertyChanges
                    {
                        target: sideBar.pSharedProperties

                        pSideBarColor: rootConstants.pTitleBar_SideBar_DarkColor
                        pSideBarIcons: sideBar.pConstProperties.pSideBarDarkIcons
                        pBtnSelectedColor: rootConstants.pBtnSelected_DarkColor
                    }
                },

                State
                {
                    name: "lightMode"
                    when: rootShared.pMode === "lightMode"

                    PropertyChanges
                    {
                        target: rootShared

                        pBtnDefaultColor: rootConstants.pBtnDefault_LightColor
                        pBtnHoverColor: rootConstants.pBtnHover_LightColor
                    }

                    PropertyChanges
                    {
                        target: globalShared

                        pTextColor: globalConstants.pText_LightColor
                        pBackgroundColor: globalConstants.pBackground_LightColor
                    }

                    PropertyChanges
                    {
                        target: titleBar.pSharedProperties

                        pTitleBarColor: rootConstants.pTitleBar_SideBar_LightColor
                        pTitleBarIcons: titleBar.pConstProperties.pTitleBarLightIcons
                    }

                    PropertyChanges
                    {
                        target: sideBar.pSharedProperties

                        pSideBarColor: rootConstants.pTitleBar_SideBar_LightColor
                        pSideBarIcons: sideBar.pConstProperties.pSideBarLightIcons
                        pBtnSelectedColor: rootConstants.pBtnSelected_LightColor
                    }
                }
            ]

            StackView
            {
                id: stackView
                anchors.fill: parent
                clip: true
                initialItem: "../SettingsMenu/SettingsWindow.qml"
                pushEnter:
                    Transition
                    {
                        PropertyAnimation
                        {
                            property: "scale"
                            from: 0
                            to:1
                            duration: 250

                            easing.type: Easing.OutQuart
                        }
                    }
            }
        }

        PropertyAnimation
        {
            id: sideBarAnimation
            target: sideBar.pSharedProperties
            property: "pSideBarWidth"
            duration: 500
            to:
            {
                if(sideBar.pSharedProperties.pSideBarWidth === 60)
                    return sideBar.pSharedProperties.pSideBarWidth + 100;
                else
                    return sideBar.pSharedProperties.pSideBarWidth - 100;
            }
        }
    }
}
