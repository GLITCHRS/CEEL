import QtQuick

import "SideBarButtonComponents"

Rectangle
{
    property alias pConstProperties: selfConstProperties
    property alias pSharedProperties: selfSharedProperties
    property var pIcons: selfSharedProperties.pSideBarIcons
    property color pColor: selfSharedProperties.pSideBarColor

    id: self
    color: pColor
    anchors
    {
        top: resizeTop.bottom
        left: resizeLeft.right
        bottom: resizeBottom.top
    }
    width: selfSharedProperties.pSideBarWidth

    Component.onCompleted:
    {
        radioGroup1.selectedBtn = settingsBtn;
        radioGroup1.attachedWindow = "../../../SettingsMenu/SettingsWindow.qml"
    }

    SCP{id: selfConstProperties}
    SSP{id: selfSharedProperties}
    SideBarButtonsGroup{id: radioGroup1}

    SideBarButton
    {
        id: settingsBtn

        y: parent.height - 55

        self: settingsBtn
        pRadioGroup: radioGroup1
        pImagePath: pIcons[2]
        pText: "Settings"
        pWindowPath: "../../../SettingsMenu/SettingsWindow.qml"
    }

    Rectangle
    {
        anchors
        {
            top: parent.top
            left: parent.left
        }

        width: 50

        SideBarMenuButton
        {
            pDefaultColor: pColor
            pIcon: pIcons[1]
        }

        SideBarButton
        {            
            id: homeBtn

            y: 55

            self: homeBtn
            pRadioGroup: radioGroup1
            pImagePath: pIcons[0]
            pText: "Home"
            pWindowPath: "../../../SettingsMenu/TestPage.qml"
        }
    }
}
