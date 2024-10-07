import QtQuick

Item {
    id: ticTacToeBoard
    objectName: "ticTacToeBoard"

    PlayArea {
        id: playAreaInstance
        visible: false
    }

    PlayerSelection {
        id: playerSelectionInstance
        playArea: playAreaInstance
        onPlayer1Selected: {
            playAreaInstance.visible = true
            playerSelectionInstance.visible = false
        }
        onPlayer2Selected: {
            playAreaInstance.visible = true
            playerSelectionInstance.visible = false
        }
    }
}
