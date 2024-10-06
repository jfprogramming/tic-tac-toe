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
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "Home.qml"
    }

    Home {
        id: homePage
        visible: false
        enabled: false
        gameLogic: gameLogic
    }

    PlayArea {
        id: playArea
        visible: false
        enabled: false
        gameLogic: gameLogic
    }

    Footer {
        id: footer
        visible: false
        enabled: false
        gameLogic: gameLogic
    }
}
