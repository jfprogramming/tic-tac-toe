import QtQuick
import QtQuick.Controls

Item {

    Header{
        id:adminLoginPageHeader
    }

    Rectangle{
        id: mainArea
        anchors.fill: parent
        color: "white"
        anchors.top: adminLoginPageHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: adminLoginPagefooter.top
        anchors.bottomMargin: 50

        Column {
            id:textEntryColumn
            anchors.centerIn: parent
            spacing: 10

            Label{
                id: userNameLabel
                text: "Admin User Name"
            }
            TextField{
                id: userNameTextInput
                width: 300
                height: 50
            }

            Label{
                id: passwordLabel
                text: "Admin Password"
            }
            TextField{
                id: passwordTextInput
                width: 300
                height: 50
                passwordCharacter: '*'
            }
        }
    }


    Footer{
        id: adminLoginPagefooter
        homeBtnTxt: "Login"
        homeBtn.onClicked: {
            stackView.push("AdminPage.qml")
        }
        backBtn.visible: true
        backBtn.onClicked: {
            stackView.pop()
        }
    }
}
