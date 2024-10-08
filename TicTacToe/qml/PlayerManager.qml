import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: playerManagerPageItem
    objectName: "playerManagerPage"

    Component.onCompleted: {
        // Populate the ListModel with data from the PlayerModel
        //
        var players = adminPlayerModel.getAllPlayers()
        for (var i = 0; i < players.length; i++) {
            playerListModel.append({ playerName: players[i].name, playerColor: players[i].color })
        }
    }

    Header {
        id: playerManagerPageHeader
    }

    Rectangle {
        id: mainArea
        anchors.fill: parent
        color: "white"
        anchors.top: playerManagerPageHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: playerManagerPagefooter.top
        anchors.bottomMargin: 50

        ScrollView {
            id: playerManagerScrollView
            anchors.fill: parent
            ListView {
                id: playerListView
                width: parent.width
                height: parent.height
                model: adminPlayerModel.playerList
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

                }
            }
        }
    }

    Footer {
        id: playerManagerPagefooter
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
