import QtQuick

Item {
    id: ticTacToeBoard
    objectName: "ticTacToeBoard"

    PlayArea {
        id: playAreaInstance
        visible: false
    }

    PlayerSelection {
        playArea: playAreaInstance
    }
}
