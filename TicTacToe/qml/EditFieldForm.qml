import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.0
import QtQuick.Layouts

Item {
    id: editFormPageItem
    objectName: "editFieldFormPage"

    // Object Properties
    //
    property alias textField: fieldTextInput.text
    property alias textFieldLabel: fieldTextLabel.text
    property bool fromDateTimeSettings: false

    signal dataChanged(string data)

    // JavaScript functions
    //
    function clearTextField() {
        fieldTextInput.text = ""
    }

    Component.onCompleted: {
        console.log("Component.onCompleted editFieldFormPage")
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
                if (fromDateTimeSettings) {
                    keypad.visible = true
                } else {
                    inputPanel.visible = true
                }
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
            visible: false
        }

        // Custom Keypad
        //
        Rectangle {
            id: keypad
            color: "lightgrey"
            width: parent.width
            height: 200
            anchors.bottom: parent.bottom
            visible: false

            GridLayout {
                anchors.centerIn: parent
                columns: 3
                rowSpacing: 5

                Repeater {
                    model: ListModel {
                        ListElement { value: "1" }
                        ListElement { value: "2" }
                        ListElement { value: "3" }
                        ListElement { value: "4" }
                        ListElement { value: "5" }
                        ListElement { value: "6" }
                        ListElement { value: "7" }
                        ListElement { value: "8" }
                        ListElement { value: "9" }
                        ListElement { value: "0" }
                        ListElement { value: "C" }
                        ListElement { value: "OK" }
                    }
                    delegate: Button {
                        text: model.value
                        width: 80
                        height: 80
                        onClicked: {
                            if (text === "C") {
                                fieldTextInput.text = ""
                            } else if (text === "OK") {
                                dataChanged(fieldTextInput.text)
                                keypad.visible = false
                                stackView.pop()
                            } else {
                                fieldTextInput.text += text
                            }
                        }
                    }
                }
            }
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
            clearTextField()
            stackView.pop(StackView.PushTransition)
        }
        homeBtn.onClicked: {
            clearTextField()
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
        }
    }
}
