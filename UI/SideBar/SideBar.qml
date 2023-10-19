import QtQuick

Rectangle
{
    property var pIcons
    property string pMode: sharedVars.pMode
    property color pColor

    id: self
    color: pColor
    anchors
    {
        top: parent.top
        left: parent.left
        bottom: parent.bottom
    }
    width: sharedVars.pSideBarWidth

    states:
    [
        State
        {
            name: "darkMode"
            when: self.pMode === "darkMode"
            PropertyChanges
            {
                target: self
                pIcons: constants.pSideBarDarkIcons
                pColor: constants.pTitleBar_SideBar_DarkColor
            }
        },

        State
        {
            name: "lightMode"
            when: self.pMode === "lightMode"
            PropertyChanges
            {
                target: self
                pIcons: constants.pSideBarLightIcons
                pColor: constants.pTitleBar_SideBar_LightColor
            }
        }
    ]

    Component.onCompleted: radioGroup1.selected = settingsBtn;

    SideBarButton
    {
        id: settingsBtn

        anchors
        {
            left: parent.left
        }

        y: parent.height - 50

        self: settingsBtn
        pRadioGroup: radioGroup1
        pImagePath: pIcons[2]
        pText: "Settings"
        pWindowPath: "../SettingsMenu/CustomCenterWidget.qml"
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

            anchors
            {
                left: parent.left
            }

            y: 50

            self: homeBtn
            pRadioGroup: radioGroup1
            pImagePath: pIcons[0]
            pText: "Home"
            pWindowPath: "../SettingsMenu/TestPage.qml"
        }
    }
}
