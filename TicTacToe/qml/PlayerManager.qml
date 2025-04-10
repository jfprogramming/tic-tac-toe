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

    GameHeader {
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
                model: adminPlayerModel
                clip: true
                header:
                    Row {
                    width: parent.width
                    height: 50
                    spacing: 10
                    Rectangle {
                        width: parent.width / 4
                        height: parent.height
                        color: "lightgray"
                        Text {
                            anchors.centerIn: parent
                            text: "ID"
                            color: "black"
                            font.bold: true
                            font.pointSize: 12
                            font.capitalization: Font.AllUppercase
                        }
                    }
                    Rectangle {
                        width: parent.width / 4
                        height: parent.height
                        color: "lightgray"
                        Text {
                            anchors.centerIn: parent
                            text: "Name"
                            color: "black"
                            font.bold: true
                            font.pointSize: 12
                            font.capitalization: Font.AllUppercase
                        }
                    }
                    Rectangle {
                        width: parent.width / 4
                        height: parent.height
                        color: "lightgray"
                        Text {
                            anchors.centerIn: parent
                            text: "Color"
                            color: "black"
                            font.bold: true
                            font.pointSize: 12
                            font.capitalization: Font.AllUppercase
                        }
                    }
                    Rectangle {
                        width: parent.width / 4
                        height: parent.height
                        color: "lightgray"
                        Text {
                            anchors.centerIn: parent
                            text: "High Score"
                            color: "black"
                            font.bold: true
                            font.pointSize: 12
                            font.capitalization: Font.AllUppercase
                        }
                    }
                }
                delegate: Item {
                    width: parent.width
                    height: 50
                    Row {
                        anchors.fill: parent
                        spacing: 10
                        Rectangle {
                            width: parent.width / 4
                            height: parent.height
                            Text {
                                anchors.centerIn: parent
                                text: model.id
                                width: parent.width / 4
                            }
                        }
                        Rectangle {
                            width: parent.width / 4
                            height: parent.height
                            Text {
                                anchors.centerIn: parent
                                text: model.name
                                width: parent.width / 4
                            }
                        }
                        Rectangle {
                            width: parent.width / 4
                            height: parent.height
                            Text {
                                anchors.centerIn: parent
                                text: model.color
                                width: parent.width / 4
                            }
                        }
                        Rectangle {
                            width: parent.width / 4
                            height: parent.height
                            Text {
                                anchors.centerIn: parent
                                text: model.highScore
                                width: parent.width / 4
                            }
                        }

                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            stackView.push("EditPlayerForm.qml", { playerIndex: model.index, playerName: model.name, playerColor: model.color })
                        }
                    }
                }
            }
        }
    }

    GameFooter {
        id: playerManagerPagefooter
        backBtn.visible: true
        backBtn.onClicked: {
            stackView.push("AdminPage.qml", StackView.PushTransition)
            console.log("stack view size: "+stackView.depth+" "+stackView.get(0))
        }
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
        }
    }
}
