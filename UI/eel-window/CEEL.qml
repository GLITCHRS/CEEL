import QtQuick
import QtQuick.Controls
import "../"

Window {
    id: root
    visible: true
    width: 800
    height: 450
    SideBar{id: sideBar}
    CustomTitleBar{}
    Constants{id:constant}

    Rectangle {
        id: toolBar

        y: constant.pToolBarY

        width: constant.pToolBarWidth
        height: parent.height - y

        anchors {
            right: parent.right
        }

        color: constant.pToolBarColor
        border.color: constant.pToolBarBorderColor
    }

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
        property int xmargin: 10
        id: searchBar

        anchors {
            left: filterButton.right
            leftMargin: xmargin
            right: toolBar.left
            rightMargin: xmargin
        }

        x: sideBar.x + sideBar.width + xmargin
        y: constant.pToolBarY

        width: toolBar.x - x - xmargin*2
        height: 50

        border.color: constant.pToolBarBorderColor
    }

    Rectangle {
        property int ymargin: 10
        property int xmargin: searchBar.xmargin
        id: resultBox

        x: searchBar.x
        y: searchBar.y + searchBar.height + ymargin

        width: searchBar.width
        height: parent.height - toolBar.height + ymargin

        anchors{
            bottom: parent.bottom
            bottomMargin: ymargin
            top: searchBar.bottom
            topMargin: ymargin

            right: toolBar.left
            rightMargin: xmargin
            left: sideBar.right
            leftMargin: xmargin
        }

        border.color: constant.pToolBarBorderColor
    }



    // Search bar
    // Filter Item
}
