import QtQuick
import QtQuick.Layouts

Rectangle
{
    property alias pConstProperties: selfConstProperties
    property alias pSharedProperties: selfSharedProperties
    property QtObject windowTarget
    property var pIcons: selfSharedProperties.pTitleBarIcons
    property string pMode: rootShared.pMode
    property color pColor: selfSharedProperties.pTitleBarColor

    id: self
    anchors
    {
        top: resizeTop.bottom
        right: resizeRight.left
    }
    width: parent.width - sideBar.pSharedProperties.pSideBarWidth - rootConstants.pResizeBarThickness * 2
    height: 25
    color: pColor

    TCP{id: selfConstProperties}
    TSP{id: selfSharedProperties}

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
        pColor: rootShared.pBtnDefaultColor
        pHoverColor: rootShared.pBtnHoverColor
        pImagePath: windowTarget.maximized ? pIcons[2]: pIcons[1]
        onClicked:
        {
            if(windowTarget.maximized)
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
        pColor: rootShared.pBtnDefaultColor
        pHoverColor: rootShared.pBtnHoverColor
        pImagePath: pIcons[3]
        onClicked: windowTarget.showMinimized();
    }
}
