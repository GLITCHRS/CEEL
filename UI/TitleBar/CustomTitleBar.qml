import QtQuick
import QtQuick.Layouts

Rectangle
{
    property QtObject windowTarget
    property var pIcons
    property string pMode: sharedVars.pMode
    property color pColor

    id: self
    anchors
    {
        top: parent.top
        right: parent.right
    }
    width: parent.width - sharedVars.pSideBarWidth
    height: 25
    color: pColor

    states:
    [
        State
        {
            name: "darkMode"
            when: self.pMode === "darkMode"
            PropertyChanges
            {
                target: self
                pIcons: constants.pTitleBarDarkIcons
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
                pIcons: constants.pTitleBarLightIcons
                pColor: constants.pTitleBar_SideBar_LightColor
            }
        }
    ]

    // Moving Functionality
    MouseArea
    {
        property real lastMouseX: 0
        property real lastMouseY: 0

        anchors.fill: parent
        onPressed:
        {
            lastMouseX = mouseX
            lastMouseY = mouseY
        }
        onMouseXChanged: windowTarget.x += (mouseX - lastMouseX)
        onMouseYChanged: windowTarget.y += (mouseY - lastMouseY)
    }

    TitleBarButton
    {
        id: closeBtn
        anchors
        {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }
        width: 50

        self: closeBtn
        pColor: self.pColor
        pHoverColor: "red"
        pImagePath: self.pIcons[0]
        onClicked: Qt.quit();
    }

    TitleBarButton
    {
        id: maximizeBtn
        x: parent.width - 100
        anchors
        {
            top: parent.top
            bottom: parent.bottom
        }

        width: 50

        self: maximizeBtn
        pColor: sharedVars.pBtnDefaultColor
        pHoverColor: sharedVars.pBtnHoverColor
        pImagePath: windowTarget.maximized ? pIcons[2]: pIcons[1]
        onClicked:
        {
            if(mainWindow.maximized)
            {
                windowTarget.maximized = false;
                windowTarget.showNormal();
            }
            else
            {
                windowTarget.maximized = true;
                windowTarget.showMaximized();
            }
        }
    }

    TitleBarButton
    {
        id: minimizeBtn
        x: parent.width - 150
        anchors
        {
            top: parent.top
            bottom: parent.bottom
        }
        width: 50

        self: minimizeBtn
        pColor: sharedVars.pBtnDefaultColor
        pHoverColor: sharedVars.pBtnHoverColor
        pImagePath: pIcons[3]
        onClicked: windowTarget.showMinimized();
    }
}
