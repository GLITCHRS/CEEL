import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Rectangle
{
    color: globalShared.pBackgroundColor;
    Button
    {
        //
        id: self
        width: 100
        height: 50
        onHoveredChanged:
        {
            if(self.hovered) stackView.push("TestRect.qml");
            else stackView.push("TestRect2.qml");
        }

        background:StackView
        {
            id: stackView
            anchors.fill: parent
            clip: true
            initialItem: "TestRect2.qml"
            pushEnter:
                Transition
                {
                    PropertyAnimation
                    {
                        property: "scale"
                        from: 0
                        to:1
                        duration: 1000

                        easing.type: Easing.OutQuart
                    }
                }
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }
    }
}
