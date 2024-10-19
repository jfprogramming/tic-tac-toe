import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.0  // Add virtual keyboard import

Item {
    id:editFormPageItem
    objectName: "editFormPage"

    // Property alias
    //
    property alias playerName: playerNameTextInput.text
    property alias playerColor: playerColorTextInput.text


    // JavaScript Functions
    //
    function clearTextFields() {
        playerNameTextInput.text = ""
        playerColorTextInput.text = ""
    }

    GameHeader{
        id:homePageHeader
    }

    Component.onCompleted: {
        console.log("Component.onCompleted Edit Player Form Page")
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
                text: stackView.currentItem.playerName
            }

            Label{
                id: playerColorLabel
                text: qsTr("Enter Player Color")
            }
            TextField{
                id: playerColorTextInput
                width: 300
                height: 50
                text: stackView.currentItem.playerColor
            }
            Button{
                id: saveButton
                text: qsTr("Save")
                onClicked: {
                    adminPlayModel.savePlayerToDatabase(playerNameTextInput.text, playerColorTextInput.text)
                }
            }
            // Button{
            //     id: lookupButton
            //     text: qsTr("Lookup")
            //     onClicked: {
            //         adminPlayModel.lookupPlayer(playerNameTextInput.text)
            //         playerNameTextInput.text = adminPlayModel.player1Name
            //         playerColorTextInput.text = adminPlayModel.player1Color
            //     }
            // }
        }
    }

    // VirtualKeyboard
    //
    InputPanel {
        id: inputPanel
        z: 99
        anchors.bottom: parent.bottom
        active: true
        visible: true
        enabled: true
    }


    GameFooter{
        id: homePagefooter
        backBtn.visible: true
        backBtn.onClicked: {
            clearTextFields()
            stackView.pop(StackView.PushTransition)
        }
        homeBtn.onClicked: {
            clearTextFields()
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
        }
    }
}
