import QtQuick 2.15

Item {
    id: ticTacToeBoard
    objectName: "ticTacToeBoard"

    property string gameType: gameLogic.gameType

    PlayArea {
        id: playAreaInstance
        visible: false
        enabled: false
    }

    PlayerSelection {
        id: playerSelectionInstance
        playArea: playAreaInstance
        visible: true
        enabled: true
        onPlayer1SelectionComplete: {
            if(gameType === "1Player") {
                console.log("player1 selected:"+playerName)
                playAreaInstance.visible = true
                playAreaInstance.enabled = true
                playerSelectionInstance.visible = false
                playerSelectionInstance.enabled = false
            }
        }
        onPlayer2SelectionComplete: {
            console.log("player2 selected:"+playerName)
            playAreaInstance.visible = true
            playerSelectionInstance.visible = false
            playerSelectionInstance.enabled = false
        }
    }
}
