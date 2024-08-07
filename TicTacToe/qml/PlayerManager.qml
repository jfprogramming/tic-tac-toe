import QtQuick
import QtQuick.Controls

Item {
    Header{
        id:homePageHeader
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
                text: "Enter Player Name"
            }
            TextField{
                id: playerNameTextInput
                width: 300
                height: 50
            }

            Label{
                id: playerColorLabel
                text: "Enter Player Color"
            }
            TextField{
                id: playerColorTextInput
                width: 300
                height: 50
            }
            Button{
                id: saveButton
                text: "Save"
                onClicked: {
                    // TODO implement save feature
                    console.log("save player information... "+playerNameTextInput.text+" "+playerColorTextInput.text)
                }
            }
        }
    }


    Footer{
        id: homePagefooter
        backBtn.visible: true
        backBtn.onClicked: {
            stackView.pop()
        }
    }
}
