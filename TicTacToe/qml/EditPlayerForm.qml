import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id:editPlayerFormPageItem
    objectName: "editPlayerFormPage"

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

    Component.onCompleted: {
        console.log("Component.onCompleted Edit Player Form Page")
    }

    GameHeader{
        id:editPlayerFormHeader
    }

    Rectangle{
        id: mainArea
        color: "white"
        anchors.top: editPlayerFormHeader.bottom
        anchors.bottom: editPlayerFormFooter.top
        width: parent.width

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
                readOnly: true
                onPressed: {
                    stackView.push("EditFieldForm.qml", { textField: playerNameTextInput.text})
                }
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
                readOnly: true
                onPressed: {
                    stackView.push("EditFieldForm.qml", { textField: playerColorTextInput.text})
                }
            }
            Button{
                id: saveButton
                text: qsTr("Save")
                onClicked: {
                    adminPlayModel.savePlayerToDatabase(playerNameTextInput.text, playerColorTextInput.text)
                }
            }
        }
    }


    GameFooter{
        id: editPlayerFormFooter
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
