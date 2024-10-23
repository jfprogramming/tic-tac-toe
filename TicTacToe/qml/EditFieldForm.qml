import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.0  // Add virtual keyboard import

Item {
    id:editFormPageItem
    objectName: "editFieldFormPage"

    // Property alias
    //
    property alias textField: fieldTextInput.text

    // JavaScript Functions
    //
    function clearTextFields() {
        fieldTextInput.text = ""
    }

    GameHeader {
        id:homePageHeader
    }

    Component.onCompleted: {
        console.log("Component.onCompleted Edit Field Form Page")
    }

    Rectangle {
        id: mainArea
        anchors.fill: parent
        color: "white"
        anchors.top: homePageHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: homePagefooter.top
        anchors.bottomMargin: 50

        Column {
            id:inputColumn
            anchors.centerIn: parent
            spacing: 10

            Label {
                id: fieldTextLabel
                text: qsTr("Enter Player Name")
            }
            TextField {
                id: fieldTextInput
                width: 300
                height: 50
                text: stackView.currentItem.playerName
                onPressed: {
                    // Show the virtual keyboard
                    //
                    inputPanel.visible = true
                }
            }
        }
    }

    GameFooter {
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
