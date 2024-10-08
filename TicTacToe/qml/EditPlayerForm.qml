import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.0  // Add virtual keyboard import

Item {
    id:editFormPageItem
    objectName: "editFormPage"

    // Property alias
    //
    property alias playerName: playerNameLabel.text
    property alias playerColor: playerColorLabel.text

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
                text: adminPlayModel.playerName
            }

            Label{
                id: playerColorLabel
                text: qsTr("Enter Player Color")
            }
            TextField{
                id: playerColorTextInput
                width: 300
                height: 50
                text: adminPlayModel.playerColor
            }
            Button{
                id: saveButton
                text: qsTr("Save")
                onClicked: {
                    adminPlayModel.savePlayerToDatabase(playerNameTextInput.text, playerColorTextInput.text)
                }
            }
            Button{
                id: lookupButton
                text: qsTr("Lookup")
                onClicked: {
                    adminPlayModel.lookupPlayer(playerNameTextInput.text)
                    playerNameTextInput.text = adminPlayModel.player1Name
                    playerColorTextInput.text = adminPlayModel.player1Color
                }
            }
        }
    }

    // VirtualKeyboard
    //
    InputPanel {
        id: inputPanel
        z: 99
        anchors.bottom: parent.bottom
        active: true
    }


    Footer{
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
