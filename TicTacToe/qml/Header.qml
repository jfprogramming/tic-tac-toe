import QtQuick
import QtQuick.Controls

Rectangle {
    id: header
    anchors.top: parent.top
    height: 50
    width: parent.width
    color: "lightBlue"

    property int player1Score: 0
    property int player2Score: 0
    property alias scoreAlias: score

    // TODO: save players score to database
    //
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
        Text {
            id: titleText
            text: qsTr("TicTacToe")
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pointSize: 16
            color: "darkBlue"
        }
    }

    Rectangle {
        id: score
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: true
        color: "white"
        border.color: "black"
        radius: 5
        width: 300
        height: 40
        Text {
            id: scoreText
            text: qsTr("Score - Player 1: " + player1Score + "   Player 2: " + player2Score)
            anchors.centerIn: parent
            font.bold: true
            font.pointSize: 14
            color: "red"
        }
    }

    Rectangle {
        id: dateTimeLabel
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: dateTimeText
            text: Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
            anchors.centerIn: parent
            font.pointSize: 12
            color: "darkGreen"
        }
    }
}
