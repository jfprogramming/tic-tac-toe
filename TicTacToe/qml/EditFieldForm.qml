import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.0

Item {
    id: editFormPageItem
    objectName: "editFieldFormPage"

    // Object properties
    //
    property alias textField: fieldTextInput.text
    property alias textFieldLabel: fieldTextLabel.text

    signal dataChanged(string data)

    // JavaScript functions
    //
    function clearTextField() {
        fieldTextInput.text = ""
    }

    Component.onCompleted: {
        console.log("Component.onCompleted Edit Field Form Page")
        fieldTextInput.focus = true
        console.log("fieldTextInput.focus: " + fieldTextInput.focus)
    }

    GameHeader {
        id: editFieldFormHeader
    }

    Rectangle {
        id: mainArea
        color: "white"
        anchors.top: editFieldFormHeader.bottom
        anchors.bottom: editFieldFormFooter.top
        width: parent.width
        Label {
            id: fieldTextLabel
            text: qsTr("Enter Player Name")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: inputPanel.visible ? 50 : 100
        }
        TextField {
            id: fieldTextInput
            anchors.top: fieldTextLabel.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 45
            onPressed: {
                focus = true
            }
        }
        Button {
            id: okButton
            anchors.top: fieldTextInput.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: "OK"
            onClicked: {
                dataChanged(fieldTextInput.text)
                clearTextField()
                stackView.pop()
            }
        }

        // Virtual Keyboard
        //
        InputPanel {
            id: inputPanel
            z: 99
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.bottom
            anchors.bottom: parent.bottom
            active: true
            visible: true
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
