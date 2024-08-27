import QtQuick
import QtQuick.Controls

Item {
    id:adminPageItem
    objectName: "adminSettingsPage"

    Header{
        id:adminPageHeader
    }

    Rectangle{
        id: mainArea
        anchors.fill: parent
        color: "white"
        anchors.top: adminPageHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: adminPagefooter.top
        anchors.bottomMargin: 50


        Column{
            id:btnColumn
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20


            Button{
                id:dateTimeSettingsBtn
                flat: true
                highlighted: true
                height: 100
                width: 200
                Text{
                    id: dateTimeSettingsBtnTxt
                    text: "Date Time"
                    anchors.centerIn: parent
                }
                onClicked: {
                    console.log("Date Time Setting Selected...")
                    //display play area
                    stackView.push("DateTimeSetting.qml")
                }
            }

            Button{
                id:managePlayersBtn
                flat: true
                highlighted: true
                height: 100
                width: 200
                Text{
                    id: managePlayersBtnTxt
                    text: "Manage Players"
                    anchors.centerIn: parent
                }
                onClicked: {
                    console.log("Manage Players Setting Selected...")
                    //display play area
                    stackView.push("PlayerManager.qml")
                }
            }
        }
    }


    Footer{
        id: adminPagefooter
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
            console.log("stack view size: "+stackView.depth+" "+stackView.get(0))
        }
        backBtn.visible: true
        backBtn.onClicked: {
            stackView.pop()
        }
    }
}
