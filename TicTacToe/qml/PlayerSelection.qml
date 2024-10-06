import QtQuick

Item {
    id:playerSelectionItem
    objectName: "playerSelectionPage"

    property string gameMode: ""
    property bool player1Selction: true
    property bool player2Selction: false

    function player1Selected(playerName) {
        console.log("player1Selected: "+playerName)
        playerModel.setPlayer1(playerName)
        showPlayer2Popup()
    }

    function player2Selected(playerName) {
        console.log("player2Selected: "+playerName)
        playerModel.setPlayer2(playerName)
    }

    Component.onCompleted: {
        gameMode = gameLogic.gameType
        console.log("gameMode: "+gameMode)
    }

    PopupMsg{
        id: player2Popup
        popupMsgtxt: "Player 2 select"
    }


    Header{
        id:playerSelectionHeader
    }

    //Highlighter
    //
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

    //Players list delegate
    //
    Component {
        id:playerListdelegate
        Column {
            Image {
                source: portrait
                anchors.horizontalCenter: parent.horizontalCenter
                width: 100
                height: 100
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        playerSelectionGridView.currentIndex = model.index;
                        console.log("item clicked... "+playerSelectionGridView.currentIndex)

                        // Set player id
                        //
                        if(player1Selction){
                            playerModel.setPlayer1(model.playerId);
                            player1Selction = false
                            player2Popup.open()
                        }
                        if(player2Selction){
                            playerModel.setPlayer2(model.playerId);
                            player2Selction = false
                        }
                        console.log(gameMode + " " + player1Selction + " " + player2Selction)
                        if(gameMode == "1Player" && !player1Selction){
                            stackView.push("PlayArea.qml")
                        }
                        if(gameMode == "2Player" && !player1Selction && !player2Selction){
                            stackView.push("PlayArea.qml")
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

    Rectangle{
        id: playerSlectionMainArea
        anchors.fill: parent
        color: "white"
        anchors.top: playerSelectionHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: playerSelectionHeader.top
        anchors.bottomMargin: 50
        GridView{
            id:playerSelectionGridView
            anchors.fill: parent
            model: PlayerListModel {id:model}
            highlight: highlight
            focus: true
            highlightFollowsCurrentItem: true
            cellWidth: 150
            cellHeight: 150
            delegate: playerListdelegate
            // Clear the highlight (set current item to null)
            //
            Component.onCompleted: {
                playerSelectionGridView.currentIndex = -1;
                console.log("1current index: "+playerSelectionGridView.currentIndex)
            }
        }
    }

    Footer{
        id: playerSelectionfooter
        homeBtn.onClicked: {
            stackView.pop()
        }
        homeBtnTxt: "Back"
    }
}
