import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: eel_window

    visible: true
    flags: Qt.FramelessWindowHint

    width: 800
    height: 450

    color: eel_constants.pColor1

    EELWindowConstants{id: eel_constants}

    ColumnLayout{
        anchors {
            fill: parent
            margins: 10
        }


        RowLayout {
            spacing: eel_constants.pXMargin

            height: eel_constants.pSearchBarHeight

            Rectangle {
                id: searchBar

                Layout.fillWidth: true
                Layout.preferredHeight: eel_constants.pSearchBarHeight

                color: eel_constants.pColor5
                border.color: eel_constants.pColor1

                radius: eel_constants.pSearchBarRadius

                TextInput {
                    anchors {
                        left: filterButton.right
                        right: searchButton.left
                        topMargin: 10
                    }

                    verticalAlignment: Text.AlignVCenter

                    font {
                        pointSize: 16
                    }
                }

                Button {
                    id: filterButton
                    text: "Filter"

                    width: height * 16/9
                    height: parent.height

                    anchors {
                        left: parent.left
                    }
                }

                Button {
                    id: searchButton
                    text: "Search"

                    width: height * 16/9
                    height: parent.height

                    anchors {
                        right: parent.right
                    }
                }
            }
        }

        Rectangle {
            id: resultBox

            Layout.fillWidth: true
            Layout.fillHeight: true

            color: eel_constants.pColor1
            border.color: eel_constants.pColor5

            radius: eel_constants.pResultBoxRadius
        }

    }
}
