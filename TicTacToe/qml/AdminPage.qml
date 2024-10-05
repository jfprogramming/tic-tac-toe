import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

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
                icon.source: "qrc:///settings.png" // Material icon source
                icon.color: "#0078D4"
                Text{
                    id: dateTimeSettingsBtnTxt
                    text: "Date Time"
                    anchors.centerIn: parent
                }
                onClicked: {
                    console.log("Date Time Setting Selected...")
                    // Display date time settings page
                    //
                    stackView.push("DateTimeSetting.qml")
                }
            }

            Button{
                id:managePlayersBtn
                icon.source: "qrc:///twoPlayer.png" // Material icon source
                icon.color: "#0078D4"
                Text{
                    id: managePlayersBtnTxt
                    text: "Manage Players"
                    anchors.centerIn: parent
                }
                onClicked: {
                    console.log("Manage Players Setting Selected...")
                    // Display Player Manager page
                    //
                    stackView.push("PlayerManager.qml")
                }
            }

            Button{
                id:aboutBtn
                icon.source: "qrc:///about.png" // Material icon source
                icon.color: "#0078D4"
                Text{
                    id: aboutBtnTxt
                    text: "About"
                    anchors.centerIn: parent
                }
                onClicked: {
                    console.log("About Setting Selected...")
                    // Display the About page
                    //
                    stackView.push("About.qml")
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
