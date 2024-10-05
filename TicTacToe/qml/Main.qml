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

    GameLogic {
        id: gameLogic
        onPlayerChanged: {
            nextPlayerPopup.open();
        }
        onGameWon: {
            gameWonPopup.text = winner + " wins!";
            gameWonPopup.open();
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "Home.qml"
    }

    Popup {
        id: nextPlayerPopup
        modal: true
        Text {
            text: "Next turn: " + gameLogic.current_player
        }
    }

    Popup {
        id: gameWonPopup
        modal: true
        Text {
            id: gameWonText
            //text: gameLogic.current_player + " Won"
        }
    }

    // Add logic to handle button clicks and update the game state
}
