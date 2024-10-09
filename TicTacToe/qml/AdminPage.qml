import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item {
    id:adminPageItem
    objectName: "adminSettingsPage"

    GameHeader{
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
                text: qsTr("Date and Time")
                width: 200
                onClicked: {
                    console.log("Date Time Setting Selected...")
                    // Display date time settings page
                    //
                    stackView.push("DateTimeSetting.qml", StackView.PushTransition)
                }
            }

            Button{
                id:managePlayersBtn
                icon.source: "qrc:///twoPlayer.png" // Material icon source
                icon.color: "#0078D4"
                text: qsTr("Manage Players")
                width: 200
                onClicked: {
                    console.log("Manage Players Setting Selected...")
                    // Display Player Manager page
                    //
                    stackView.push("PlayerManager.qml", StackView.PushTransition)
                }
            }

            Button{
                id:aboutBtn
                icon.source: "qrc:///about.png" // Material icon source
                icon.color: "#0078D4"
                text: qsTr("About")
                width: 200
                onClicked: {
                    console.log("About Setting Selected...")
                    // Display the About page
                    //
                    stackView.push("About.qml", StackView.PushTransition)
                }
            }
        }
    }


    GameFooter{
        id: adminPagefooter
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
            console.log("stack view size: "+stackView.depth+" "+stackView.get(0))
        }
        backBtn.visible: true
        backBtn.onClicked: {
            stackView.pop(StackView.PushTransition)
        }
    }
}
