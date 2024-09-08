import QtQuick

Item {
    id:playerSelectionItem

    property int gameMode: 1 // 1 for 1 Player mode | 2 for 2 Player mode

    // TODO setup logic to get game mode selected

    Header{
        id:playerSelectionHeader
    }

    //Highlighter
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

    //Player slist delegate
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

                        // TODO: Set the selected player ID
                        //
                        dbManager.setSelectedPlayerId(model.playerId);

                        stackView.push("PlayArea.qml")

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
