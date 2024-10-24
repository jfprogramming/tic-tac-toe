import QtQuick 2.15

// Used for PlayerSelection.qml
//
ListModel {
    id: playerListModel
    objectName: "playerListModel"

    Component.onCompleted: {
        console.log("playerListModel Component.onCompleted")
    }

    ListElement {
        name: "Player1"
        portrait: "qrc:///onePlayer.png"
    }
    ListElement {
        name: "Player2"
        portrait: "qrc:///onePlayer.png"
    }
    ListElement {
        name: "Player3"
        portrait: "qrc:///onePlayer.png"
    }
    ListElement {
        name: "Player4"
        portrait: "qrc:///onePlayer.png"
    }
    ListElement {
        name: "Player5"
        portrait: "qrc:///onePlayer.png"
    }
    ListElement {
        name: "Player6"
        portrait: "qrc:///onePlayer.png"
    }
    ListElement {
        name: "Player 7"
        portrait: "qrc:///onePlayer.png"
    }
    ListElement {
        name: "Player 8"
        portrait: "qrc:///onePlayer.png"
    }
    ListElement {
        name: "Player9"
        portrait: "qrc:///onePlayer.png"
    }
    ListElement {
        name: "Player10"
        portrait: "qrc:///onePlayer.png"
    }
}
