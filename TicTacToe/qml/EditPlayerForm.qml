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
