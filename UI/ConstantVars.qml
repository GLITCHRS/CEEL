import QtQuick

QtObject
{
    // Global Dark Mode
    readonly property color pTitleBar_SideBar_DarkColor: "black"
    readonly property color pCenteralForm_DarkColor: "#2c313d"
    readonly property color pBtnSelected_DarkColor: "#2c313d"
    readonly property color pBtnHover_DarkColor: "#353b47"
    readonly property color pBtnDefault_DarkColor: "black"
    readonly property color pText_DarkColor: "white"

    // Global Light Mode
    readonly property color pTitleBar_SideBar_LightColor: "white"
    readonly property color pCenteralForm_LightColor: "#d3cec2"
    readonly property color pBtnSelected_LightColor: "#d3cec2"
    readonly property color pBtnHover_LightColor: "#cac4b8"
    readonly property color pBtnDefault_LightColor: "white"
    readonly property color pText_LightColor: "black"

    /*

        Title Bar Properties

    */

    // Icons
    readonly property list<string> pTitleBarDarkIcons: [
        "../images/TitleBar/DarkIcons/close17.png",
        "../images/TitleBar/DarkIcons/maximize17.png", "../images/TitleBar/DarkIcons/notMaximize17.png",
        "../images/TitleBar/DarkIcons/minimize17.png"
    ]

    readonly property list<string> pTitleBarLightIcons: [
        "../images/TitleBar/LightIcons/close17.png",
        "../images/TitleBar/LightIcons/maximize17.png", "../images/TitleBar/LightIcons/notMaximize17.png",
        "../images/TitleBar/LightIcons/minimize17.png"
    ]

    /*

        Side Bar Properties

    */

    // Icons
    readonly property list<string> pSideBarDarkIcons: [
        "../images/SideBar/DarkIcons/home36.png",
        "../images/SideBar/DarkIcons/menu36.png",
        "../images/SideBar/DarkIcons/settings36.png"
    ]

    readonly property list<string> pSideBarLightIcons: [
        "../images/SideBar/LightIcons/home36.png",
        "../images/SideBar/LightIcons/menu36.png",
        "../images/SideBar/LightIcons/settings36.png"
    ]
}
