import QtQuick
import QtQuick.Controls

Rectangle{
    id: footer
    anchors.bottom: parent.bottom
    height: 50
    width: parent.width
    color: "lightBlue"

    property alias homeBtn: homeButton
    property alias homeBtnTxt: homeButtonText.text

    property alias restBtn: restButton
    property alias restBtnTxt: restButtonText.text

    property alias backBtn: backButton
    property alias backBtnTxt: backButtonText.text

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
        Text {
            id: backButtonText
            text: qsTr("Back")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        onClicked: {
            console.log("back button clicked...")
        }
    }

    Button{
        id: restButton
        anchors.right: parent.right
        anchors.rightMargin: homeButton.width+20
        anchors.verticalCenter: parent.verticalCenter
        icon.source: "qrc:///reset.png" // Material icon name
        icon.color: "#0078D4"
        visible: false
        Text {
            id: restButtonText
            text: qsTr("Rest")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
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
        Text {
            id: homeButtonText
            text: qsTr("Home")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        onClicked: {
            console.log("home button clicked...")
        }
    }
}

