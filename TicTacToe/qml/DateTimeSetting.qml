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
