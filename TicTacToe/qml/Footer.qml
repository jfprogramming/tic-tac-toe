import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import GameLogic 1.0

Rectangle{
    id: footer
    objectName: "footer"
    anchors.bottom: parent.bottom
    height: 50
    width: parent.width
    color: "#0078D4"

    property alias homeBtn: homeButton
    property alias homeBtnTxt: homeButton.text
    property alias homeIcon: homeButton.icon.source

    property alias resetBtn: resetButton
    property alias resetBtnTxt: resetButton.text
    property alias resetIcon: resetButton.icon.source

    property alias backBtn: backButton
    property alias backBtnTxt: backButton.text
    property alias backIcon: backButton.icon.source

    Rectangle{
        id: copyRight
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: copyRightText
            text: qsTr("(c) Jesse Finneman 2024")
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Button{
        id: backButton
        anchors.right: parent.right
        anchors.rightMargin: homeButton.width+20
        anchors.verticalCenter: parent.verticalCenter
        icon.source: "qrc:///backArrow.png" // Material icon name
        icon.color: "#0078D4"
        visible: false
        text: qsTr("Back")
        onClicked: {
            console.log("back button clicked...")
        }
    }

    Button{
        id: resetButton
        anchors.right: parent.right
        anchors.rightMargin: homeButton.width+20
        anchors.verticalCenter: parent.verticalCenter
        icon.source: "qrc:///reset.png" // Material icon name
        icon.color: "#0078D4"
        visible: false
        text: qsTr("Reset")
        onClicked: {
            console.log("reset button clicked...")
        }
    }

    Button{
        id: homeButton
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        icon.source: "qrc:///home.png" // Material icon name
        icon.color: "#0078D4"
        text: qsTr("Home")
        onClicked: {
            console.log("home button clicked...")
            //gameLogic.gameType = ""
        }
    }
}

