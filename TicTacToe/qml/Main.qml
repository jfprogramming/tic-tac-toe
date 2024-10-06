import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import GameLogic 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("TicTacToe")
    Material.theme: Material.Light
    Material.accent: Material.Blue
    Material.primary: Material.BlueGrey

    // Create an instance of GameLogic
    //
    GameLogic {
        id: gameLogic
        onGameTypeChanged: {
            console.log("Game type changed to: "+gameLogic.gameType)
        }
        onPlayerChanged: {
            console.log("Player changed to: "+gameLogic.player)
        }
        onPlayerWonChanged: {
            console.log("Player won changed to: "+gameLogic.playerWon)
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "Home.qml"
    }
}
