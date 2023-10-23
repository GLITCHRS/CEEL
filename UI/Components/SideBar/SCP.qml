/*

  SCP (SideBar Constant Properties)

*/

import QtQuick

QtObject
{
    /*

        Animations

    */

    // PropertyAnimations
    readonly property QtObject pSideBarAnimation: sideBarAnimation

    /*

        Side Bar Properties

    */

    // Icons Dark Mode
    readonly property list<string> pSideBarDarkIcons: [
        "../Icons/DarkIcons/home36.png",
        "../Icons/DarkIcons/menu36.png",
        "../Icons/DarkIcons/settings36.png"
    ]

    // Icons Light Mode
    readonly property list<string> pSideBarLightIcons: [
        "../Icons/LightIcons/home36.png",
        "../Icons/LightIcons/menu36.png",
        "../Icons/LightIcons/settings36.png"
    ]
}
