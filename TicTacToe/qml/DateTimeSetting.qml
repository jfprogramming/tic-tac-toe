import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

    GameHeader{
        id:dateTimePageHeader
    }

    Rectangle{
        id: mainArea
        anchors.fill: parent
        color: "white"
        anchors.top: dateTimePageHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: dateTimePagefooter.top
        anchors.bottomMargin: 50

        Column {
            id:dateTimeEntryColumn
            anchors.centerIn: parent
            spacing: 10

            Row {
                spacing: 20
                Column {
                    spacing: 10

                    Label{
                        id: setHourLabel
                        text: "set hour"
                    }
                    TextField{
                        id: setHourTextInput
                        width: 100
                        height: 50
                    }

                    Label{
                        id: setMinutesLabel
                        text: "set minutes"
                    }
                    TextField{
                        id: setMinutesTextInput
                        width: 100
                        height: 50
                    }
                    Label{
                        id: setSecondsLabel
                        text: "set seconds"
                    }
                    TextField{
                        id: setSecondsTextInput
                        width: 100
                        height: 50
                    }
                }

                Column {
                    spacing: 10

                    Label {
                        text: "Select Date Format"
                    }
                    Button {
                        text: "YYYY-MM-dd"
                        onClicked: {
                            console.log("Date format selected: YYYY-MM-dd");
                            // TODO: Add logic to apply this date format
                        }
                    }
                    Button {
                        text: "MM-dd-YYYY"
                        onClicked: {
                            console.log("Date format selected: MM-dd-YYYY");
                            // TODO: Add logic to apply this date format
                        }
                    }
                    Button {
                        text: "dd-MM-YYYY"
                        onClicked: {
                            console.log("Date format selected: dd-MM-YYYY");
                            // TODO: Add logic to apply this date format
                        }
                    }
                }
            }

            Row {
                spacing: 20
                Button {
                    text: "Load"
                    onClicked: {
                        dateTimeInput.text = settingsController.getDateTimeSettings();
                    }
                }

                Button {
                    text: "Save"
                    onClicked: {
                        // TODO implement save feature - set application time / set OS date time
                        settingsController.setDateTimeSettings(dateTimeInput.text);

                        console.log("save date and time... "+setHourTextInput.text+":"+setMinutesTextInput.text+":"+setSecondsTextInput.text)
                    }
                }
            }
        }
    }

    GameFooter{
        id: dateTimePagefooter
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
