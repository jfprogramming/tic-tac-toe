import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: editPlayerFormPageItem
    objectName: "editPlayerFormPage"

    // Object Properties
    //
    property alias playerName:  playerNameTextInput.text
    property alias playerColor: playerColorTextInput.text
    property int playerIndex:   -1

    // JavaScript functions
    //
    function clearTextFields() {
        playerNameTextInput.text  = ""
        playerColorTextInput.text = ""
    }

    Component.onCompleted: {
        console.log("Component.onCompleted editPlayerFormPage" +
                    " playerName: " + playerName + ", playerColor: " + playerColor)
    }

    GameHeader {
        id: editPlayerFormHeader
    }

    Rectangle {
        id: mainArea
        color: "white"
        anchors.top: editPlayerFormHeader.bottom
        anchors.bottom: editPlayerFormFooter.top
        width: parent.width

        Column {
            id: inputColumn
            anchors.centerIn: parent
            spacing: 10
            Label {
                id: playerNameLabel
                text: qsTr("Enter Player Name")
            }
            TextField {
                id: playerNameTextInput
                width: 300
                height: 45
                text: playerName
                readOnly: true
                onPressed: {
                    var editFieldForm = stackView.push("EditFieldForm.qml", { fromDateTimeSettings: false, textField: playerNameTextInput.text, textFieldLabel: playerNameLabel.text })
                    editFieldForm.dataChanged.connect(function(data) {
                        playerNameTextInput.text = data
                    })
                }
            }
            Label {
                id: playerColorLabel
                text: qsTr("Enter Player Color")
            }
            TextField {
                id: playerColorTextInput
                width: 300
                height: 45
                text: playerColor
                readOnly: true
                onPressed: {
                    var editFieldForm = stackView.push("EditFieldForm.qml", { fromDateTimeSettings: false, textField: playerColorTextInput.text, textFieldLabel: playerColorLabel.text })
                    editFieldForm.dataChanged.connect(function(data) {
                        playerColorTextInput.text = data
                    })
                }
            }
            Button {
                id: saveButton
                text: qsTr("Save")
                onClicked: {
                    // Add one to the passed index to account for 0 playerIndex
                    //
                    adminPlayModel.updatePlayer(playerIndex+1, playerNameTextInput.text, playerColorTextInput.text)
                }
            }
        }
    }

    GameFooter {
        id: editPlayerFormFooter
        backBtn.visible: true
        backBtn.onClicked: {
            clearTextFields()
            stackView.push("PlayerManager.qml", StackView.PushTransition)
            console.log("stack view size: " + stackView.depth + " " + stackView.get(0))
        }
        homeBtn.onClicked: {
            clearTextFields()
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
        }
    }
}
