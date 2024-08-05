import QtQuick
import QtQuick.Controls

Rectangle{
    id: header
    anchors.top: parent.top
    height: 50
    width: parent.width
    color: "lightBlue"

    Rectangle{
        id: title
        anchors.left: header.left
        anchors.leftMargin: 10
        anchors.verticalCenter: header.verticalCenter
        Text {
            id: titleText
            text: qsTr("TicTacToe")
            anchors.verticalCenter: title.verticalCenter
        }
    }

    Rectangle{
        id: dateTimeLabel
        anchors.right: header.right
        anchors.rightMargin: 10
        anchors.verticalCenter: header.verticalCenter
        Text {
            id: dateTimeText
            text: Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
            anchors.centerIn: dateTimeLabel
        }
    }
}
