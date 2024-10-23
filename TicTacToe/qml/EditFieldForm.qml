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

    Component.onCompleted: {
        console.log("Component.onCompleted Edit Field Form Page")
    }

    GameHeader {
        id:editFieldFormHeader
    }

    Rectangle {
        id: mainArea
        color: "white"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: editFieldFormHeader.bottom
        anchors.bottom: editFieldFormFooter.top

        Label {
            id: fieldTextLabel
            text: qsTr("Enter Player Name")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: inputPanel.visible ? 50 : 200
        }
        TextField {
            id: fieldTextInput
            anchors.top: fieldTextLabel.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 50
            text: stackView.currentItem.playerName
            onPressed: {
                // Show the virtual keyboard
                //
                inputPanel.visible = true
            }
        }

        // VirtualKeyboard
        //
        InputPanel {
            id: inputPanel
            z: 99
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.bottom
            anchors.bottom: parent.bottom
            active: true
            visible: false
            enabled: true
        }
    }


    SpringAnimation {
        id: inputPanelAnimation
        target: inputPanel
        property: "y"
        from: inputPanel.height
        to: 0
        duration: 300
        easing.type: Easing.InOutQuad
    }


    GameFooter {
        id: editFieldFormFooter
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
