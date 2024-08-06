import QtQuick
import QtQuick.Controls

Rectangle{
    id: footer
    anchors.bottom: parent.bottom
    height: 50
    width: parent.width
    color: "lightBlue"

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
        id: homeButton
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: homeButtonText
            text: qsTr("Home")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        onClicked: {
            console.log("button clicked...")
        }
    }
}

