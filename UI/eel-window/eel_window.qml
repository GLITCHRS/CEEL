import QtQuick
import QtQuick.Controls
import "../"
import "../Resizing Functionality"

Window {
    id: root

    visible: true
//    flags: Qt.FramelessWindowHint | Qt.WindowMinimizeButtonHint | Qt.Window

    width: 800
    height: 450

    color: "#000000"

    SideBar{id: sideBar}
    CustomTitleBar{}

    Constants{id:constant}

//    Rectangle {
//        id: toolBar

//        y: constant.pToolBarY

//        width: constant.pToolBarWidth
//        height: parent.height - y

//        anchors {
//            right: parent.right
//        }

//        color: constant.pToolBarColor
//        border.color: constant.pToolBarBorderColor
//    }

    Button {
        id: filterButton
        text: "Filter"

        y: searchBar.y

        width: height * 16/9
        height: searchBar.height

        anchors {
            left: sideBar.right
            leftMargin: 10
        }
    }

    Rectangle {
        id: searchBar
        property int xmargin: 10

        anchors {
            left: filterButton.right
            leftMargin: xmargin
            right: parent.right
            rightMargin: xmargin
        }

        x: sideBar.x + sideBar.width + xmargin
        y: constant.pToolBarY

        width: parent.x - x - xmargin*2
        height: 50

        border.color: constant.pToolBarBorderColor

        TextInput {
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter

            font {
                pointSize: 24
            }
        }
    }

    Rectangle {
        id: resultBox
        property int ymargin: 10
        property int xmargin: searchBar.xmargin

        x: searchBar.x
        y: searchBar.y + searchBar.height + ymargin

        width: searchBar.width
        height: constant.pToolBarY + ymargin

        anchors{
            bottom: parent.bottom
            bottomMargin: ymargin
            top: searchBar.bottom
            topMargin: ymargin

            right: parent.right
            rightMargin: xmargin
            left: sideBar.right
            leftMargin: xmargin
        }

        border.color: constant.pToolBarBorderColor
    }
}
