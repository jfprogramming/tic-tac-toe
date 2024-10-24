import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.0

Item {
    id: dateTimeSettingItem
    objectName: "dateTimeSettingPage"
    property alias hour: setHourTextInput.text
    property alias minutes: setMinutesTextInput.text
    property alias seconds: setSecondsTextInput.text
    signal dataChanged(string data, string field)

    function clearTextFields() {
        setHourTextInput.text = ""
        setMinutesTextInput.text = ""
        setSecondsTextInput.text = ""
    }

    GameHeader {
        id: dateTimePageHeader
    }

    Rectangle {
        id: mainArea
        anchors.fill: parent
        color: "white"
        anchors.top: dateTimePageHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: dateTimePagefooter.top
        anchors.bottomMargin: 50

        Column {
            id: dateTimeEntryColumn
            anchors.centerIn: parent
            spacing: 10

            Row {
                spacing: 20
                Column {
                    spacing: 10
                    Label {
                        id: setHourLabel
                        text: "set hour"
                    }
                    TextField {
                        id: setHourTextInput
                        width: 100
                        height: 50
                        text: hour
                        onPressed: {
                            var editFieldForm = stackView.push("EditFieldForm.qml", { textField: setHourTextInput.text, textFieldLabel: setHourLabel.text })
                            editFieldForm.dataChanged.connect(function(data) {
                                setHourTextInput.text = data
                            })
                        }
                    }
                    Label {
                        id: setMinutesLabel
                        text: "set minutes"
                    }
                    TextField {
                        id: setMinutesTextInput
                        width: 100
                        height: 50
                        text: minutes
                        onPressed: {
                            var editFieldForm = stackView.push("EditFieldForm.qml", { textField: setMinutesTextInput.text, textFieldLabel: setMinutesLabel.text })
                            editFieldForm.dataChanged.connect(function(data) {
                                setMinutesTextInput.text = data
                            })
                        }
                    }
                    Label {
                        id: setSecondsLabel
                        text: "set seconds"
                    }
                    TextField {
                        id: setSecondsTextInput
                        width: 100
                        height: 50
                        text: seconds
                        onPressed: {
                            var editFieldForm = stackView.push("EditFieldForm.qml", { textField: setSecondsTextInput.text, textFieldLabel: setSecondsLabel.text })
                            editFieldForm.dataChanged.connect(function(data) {
                                setSecondsTextInput.text = data
                            })
                        }
                    }
                }
                Column {
                    spacing: 10
                    Label {
                        text: "Select Date Format"
                    }
                    Button {
                        id: yyyymmddBtn
                        text: "YYYY-MM-dd"
                        checked: settingsController.getDateFormat() === "YYYY-MM-dd" ? true : false
                        onClicked: {
                            console.log("Date format selected: YYYY-MM-dd")
                            settingsController.setDateFormat("YYYY-MM-dd")
                            if (!checked) {
                                checked = true
                                mmddyyyyBtn.checked = false
                                ddmmyyyyBtn.checked = false
                            }
                        }
                    }
                    Button {
                        id: mmddyyyyBtn
                        text: "MM-dd-YYYY"
                        checked: settingsController.getDateFormat() === "MM-dd-YYYY" ? true : false
                        onClicked: {
                            console.log("Date format selected: MM-dd-YYYY")
                            settingsController.setDateFormat("MM-dd-YYYY")
                            if (!checked) {
                                checked = true
                                yyyymmddBtn.checked = false
                                ddmmyyyyBtn.checked = false
                            }
                        }
                    }
                    Button {
                        id: ddmmyyyyBtn
                        text: "dd-MM-YYYY"
                        checked: settingsController.getDateFormat() === "dd-MM-YYYY" ? true : false
                        onClicked: {
                            console.log("Date format selected: dd-MM-YYYY")
                            settingsController.setDateFormat("dd-MM-YYYY")
                            if (!checked) {
                                checked = true
                                yyyymmddBtn.checked = false
                                mmddyyyyBtn.checked = false
                            }
                        }
                    }
                }
            }

            Button {
                text: "Save"
                onClicked: {
                    settingsController.setDateFormat(dateTimeInput.text)
                    console.log("save date and time... " + setHourTextInput.text + ":" + setMinutesTextInput.text + ":" + setSecondsTextInput.text)
                }
            }
        }
    }

    GameFooter {
        id: dateTimePagefooter
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
