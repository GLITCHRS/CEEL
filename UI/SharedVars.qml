import QtQuick

QtObject
{
    property string pMode: "darkMode"

    /*

        Text & Hover Colors Properties

    */

    // Default: DarkMode
    property color pBtnSelectedColor: constants.pBtnSelected_DarkColor
    property color pBtnHoverColor: constants.pBtnHover_DarkColor
    property color pBtnDefaultColor: constants.pBtnDefault_DarkColor
    property color pTextColor: constants.pText_DarkColor

    /*

        Swipe View Properties

    */

    // width
    property int pSwipeViewWidth: rect.width - pSideBarWidth

    /*

        Side Bar Properties

    */

    // width
    property int pSideBarWidth: 50
}
