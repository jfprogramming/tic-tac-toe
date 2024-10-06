import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Rectangle {
    id: header
    objectName: "header"
    anchors.top: parent.top
    height: 50
    width: parent.width
    color: "#0078D4" // Matching icon color

    property int player1Score: 0
    property int player2Score: 0
    property alias scoreAlias: score

    function savePlayerHighScore(playerName, score) {
        if (playerName === "Player1") {
            playerModel.setPlayerHighScoreValue(1, score);
        } else if (playerName === "Player2") {
            playerModel.setPlayerHighScoreValue(2, score);
        }
    }


    Rectangle {
        id: title
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        Text {
            id: titleText
            text: qsTr("TicTacToe")
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pointSize: 20
            color: "white" // Consistent text color
        }
    }

    Rectangle {
        id: score
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: true
        color: "white"
        border.color: "#0078D4"
        radius: 10
        width: 300
        height: 40
        Text {
            id: scoreText
            text: qsTr("Score - Player 1: " + player1Score + "   Player 2: " + player2Score)
            anchors.centerIn: parent
            font.bold: true
            font.pointSize: 16
            color: "#0078D4" // Matching text color
        }
    }

    Rectangle {
        id: dateTimeLabel
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        Text {
            id: dateTimeText
            text: Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
            anchors.centerIn: parent
            font.pointSize: 14
            color: "white" // Consistent text color
        }
    }
}
