import QtQuick

QtObject
{
    /*

        Resizing Bars Properties

    */

    readonly property int pResizeBarThickness: 5

    /*

        Title/Side Bars Colors

    */

    readonly property color pTitleBar_SideBar_DarkColor: "black"
    readonly property color pTitleBar_SideBar_LightColor: "white"

    // Buttons Dark Mode (Side & Title Bars)
    readonly property color pBtnSelected_DarkColor: "#2c313d"
    readonly property color pBtnHover_DarkColor: "#353b47"
    readonly property color pBtnDefault_DarkColor: "black"

    // Buttons Light Mode (Side & Title Bars)
    readonly property color pBtnSelected_LightColor: "#d3cec2"
    readonly property color pBtnHover_LightColor: "#cac4b8"
    readonly property color pBtnDefault_LightColor: "white"
}
