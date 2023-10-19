import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../"

Rectangle
{
    property string pMode: sharedVars.pMode

    id: centerWidget
    color: constants.pCenteralForm_DarkColor
    clip: true

    states:
    [
        State
        {
            name: "darkMode"
            when: centerWidget.pMode === "darkMode"
            PropertyChanges
            {
                target: centerWidget
                color: constants.pCenteralForm_DarkColor
            }
        },

        State
        {
            name: "lightMode"
            when: centerWidget.pMode === "lightMode"
            PropertyChanges
            {
                target: centerWidget
                color: constants.pCenteralForm_LightColor
            }
        }
    ]

    Switch
    {
        anchors
        {
            left: parent.left
            bottom: parent.bottom
        }

        checked: sharedVars.pMode === "lightMode"
        onCheckedChanged:
        {
            if(checked){ sharedVars.pMode = "lightMode";}else{sharedVars.pMode = "darkMode";}
        }
    }
}
