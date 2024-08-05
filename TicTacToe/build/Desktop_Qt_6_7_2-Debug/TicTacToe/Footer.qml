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
        anchors.left: footer.left
        anchors.leftMargin: 10
        anchors.verticalCenter: footer.verticalCenter
        Text {
            id: copyRightText
            text: qsTr("(c) Jesse Finneman 2024")
            anchors.verticalCenter: copyRight.verticalCenter
        }
    }

    Button{
        id: homeButton
        anchors.right: footer.right
        anchors.rightMargin: 10
        anchors.verticalCenter: footer.verticalCenter
        Text {
            id: homeButtonText
            text: qsTr("Home")
            anchors.horizontalCenter: homeButton.horizontalCenter
            anchors.verticalCenter: homeButton.verticalCenter
        }
        onClicked: {
            console.log("button clicked...")
        }
    }
}

