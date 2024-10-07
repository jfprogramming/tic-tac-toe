import QtQuick
import QtQuick.Controls

Item {
    id:playerManagerPageItem
    objectName: "playerManagerPage"

    Header{
        id:homePageHeader
    }

    Component.onCompleted: {
        // Clear text fields on entry
        //
        playerNameTextInput.text = ""
        playerColorTextInput.text = ""
    }

    Rectangle{
        id: mainArea
        anchors.fill: parent
        color: "white"
        anchors.top: homePageHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: homePagefooter.top
        anchors.bottomMargin: 50

        Column{
            id:inputColumn
            anchors.centerIn: parent
            spacing: 10

            Label{
                id: playerNameLabel
                text: qsTr("Enter Player Name")
            }
            TextField{
                id: playerNameTextInput
                width: 300
                height: 50
                text: playerModel.playerName
            }

            Label{
                id: playerColorLabel
                text: qsTr("Enter Player Color")
            }
            TextField{
                id: playerColorTextInput
                width: 300
                height: 50
                text: playerModel.playerColor
            }
            Button{
                id: saveButton
                text: qsTr("Save")
                onClicked: {
                    playerModel.savePlayerToDatabase(playerNameTextInput.text, playerColorTextInput.text)
                }
            }
            Button{
                id: lookupButton
                text: qsTr("Lookup")
                onClicked: {
                    playerModel.lookupPlayer(playerNameTextInput.text)
                    playerNameTextInput.text = playerModel.player1Name
                    playerColorTextInput.text = playerModel.player1Color
                }
            }
        }
    }

    Footer{
        id: homePagefooter
        backBtn.visible: true
        backBtn.onClicked: {
            stackView.pop(StackView.PushTransition)
        }
        homeBtn.onClicked: {
            stackView.push("Home.qml", StackView.PushTransition)
        }
    }
}
