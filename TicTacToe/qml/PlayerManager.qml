import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: playerManagerPageItem
    objectName: "playerManagerPage"

    Component.onCompleted: {
        // Populate the ListModel with data from the PlayerModel
        //
        var players = playerModel.getAllPlayers()
        for (var i = 0; i < players.length; i++) {
            playerListModel.append({ playerName: players[i].name, playerColor: players[i].color })
        }
    }

    Header {
        id: homePageHeader
    }

    Rectangle {
        id: mainArea
        anchors.fill: parent
        color: "white"
        anchors.top: homePageHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: homePagefooter.top
        anchors.bottomMargin: 50

        ListView {
            id: playerListView
            width: parent.width
            height: parent.height
            model: playerModel.playerList
            clip: true

            delegate: Item {
                width: parent.width
                height: 50
                Row {
                    spacing: 10
                    Text {
                        text: model.playerName
                        width: parent.width / 2
                    }
                    Text {
                        text: model.playerColor
                        width: parent.width / 2
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        stackView.push("EditForm.qml", { playerName: model.playerName, playerColor: model.playerColor })
                    }
                }
            }
        }
    }

    Footer {
        id: homePagefooter
        backBtn.visible: true
        backBtn.onClicked: {
            stackView.pop(StackView.PushTransition)
        }
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
        }
    }
}
