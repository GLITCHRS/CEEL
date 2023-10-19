import QtQuick

ParallelAnimation
{
    PropertyAnimation
    {
        target: sharedVars
        property: "pSideBarWidth"
        duration: 500
        to:
        {
            if(sharedVars.pSideBarWidth === 50)
                return sharedVars.pSideBarWidth + 100
            else
                return sharedVars.pSideBarWidth - 100
        }
    }
}
