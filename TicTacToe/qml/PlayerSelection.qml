import QtQuick
import QtQuick.Controls
import GamePlayModel 1.0

Item {
    id: playerSelectionItem
    objectName: "playerSelectionPage"

    property string gameMode: ""
    property bool   player1Selection: true
    property bool   player2Selection: false


    // JavaScript Functions
    //
    function player1Selected(playerName) {
        console.log("player1Selected: " + playerName)
        gamePlayModel.setPlayer1(playerName)
    }

    function player2Selected(playerName) {
        console.log("player2Selected: " + playerName)
        gamePlayModel.setPlayer2(playerName)
    }

    function checkGameType() {
        gameMode = gameLogic.gameType
    }

    Component.onCompleted: {
        checkGameType()
        console.log("gameMode: " + gameLogic.gameType)
    }

    // Player selection notification
    //
    PopupDialog {
        id: player2Popup
        popupMsgtxt: "Player 2 select"
    }

    Header {
        id: playerSelectionHeader
    }

    Component {
        id: highlight
        Rectangle {
            width: playerSelectionGridView.cellWidth
            height: playerSelectionGridView.cellHeight
            color: "lightsteelblue"
            radius: 5
            x: playerSelectionGridView.currentIndex === -1 ? 0 : playerSelectionGridView.currentItem.x
            y: playerSelectionGridView.currentIndex === -1 ? 0 : playerSelectionGridView.currentItem.y
            Behavior on x { SpringAnimation { spring: 3; damping: 0.2 } }
            Behavior on y { SpringAnimation { spring: 3; damping: 0.2 } }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(playerSelectionGridView.currentItem.x)
                    console.log(playerSelectionGridView.currentItem.y)
                    console.log("highlighter clicked...")
                }
                onEntered: {
                    console.log("highlighter Entered...")
                }
            }
        }
    }

    Component {
        id: playerListdelegate
        Column {
            Image {
                source: portrait
                anchors.horizontalCenter: parent.horizontalCenter
                width: 100
                height: 100
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        playerSelectionGridView.currentIndex = model.index
                        console.log("item clicked... " + playerSelectionGridView.currentIndex)

                        checkGameType()

                        if (player1Selection) {
                            player1Selected(model.name)
                            if (gameMode === "2Player") {
                                player1Selection = false
                                player2Selection = true
                                player2Popup.open()
                            }
                            player1Selection = false
                        } else if (player2Selection) {
                            player2Selected(model.name)
                            player2Selection = false
                        }

                        console.log(gameMode + " " + player1Selection + " " + player2Selection)
                        if (gameMode === "1Player" && !player1Selection) {
                            stackView.push("PlayArea.qml" , StackView.PushTransition)
                        }
                        if (gameMode === "2Player" && !player1Selection && !player2Selection) {
                            stackView.push("PlayArea.qml" , StackView.PushTransition)
                        }
                    }
                }
            }
            Text {
                text: name
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    Rectangle {
        id: playerSelectionMainArea
        anchors.fill: parent
        color: "white"
        anchors.top: playerSelectionHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: playerSelectionfooter.top
        anchors.bottomMargin: 50
        GridView {
            id: playerSelectionGridView
            anchors.fill: parent
            model: PlayerListModel { id: model }
            highlight: highlight
            focus: true
            highlightFollowsCurrentItem: true
            cellWidth: 150
            cellHeight: 150
            delegate: playerListdelegate
            Component.onCompleted: {
                playerSelectionGridView.currentIndex = -1
                console.log("current index: " + playerSelectionGridView.currentIndex)
            }
        }
    }

    Footer {
        id: playerSelectionfooter
        homeIcon: "qrc:///backArrow.png"
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
        }
        homeBtnTxt: "Back"
    }
}
