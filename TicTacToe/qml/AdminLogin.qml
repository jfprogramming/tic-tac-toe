import QtQuick
import QtQuick.Controls

Item {
    id:adminLoginItem
    objectName: "adminLoginPage"

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
        //signal loginBtnClicked(string username, string password)

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
                echoMode: TextInput.Password
                passwordCharacter: '*'
            }
        }

        Connections {
            target: adminLoginPagefooter
            function onLoginBtnClicked(username, password) {
                console.log("admin login slot")
                if(playerModel.onAdminLogin(username, password)){
                    stackView.push("AdminPage.qml", StackView.PushTransition)
                    // Clear the text fields on succesful login
                    //
                    userNameTextInput.text = ""
                    passwordTextInput.text = ""
                }else{
                    // TODO display popup message
                    //
                    console.log("error authenticating....");
                }
            }
        }
    }

    Footer{
        id: adminLoginPagefooter
        homeBtnTxt: "Login"
        homeIcon: "qrc:///login.png"
        signal loginBtnClicked(string username, string password)
        homeBtn.onClicked: {
            console.log("admin login signal")
            loginBtnClicked(userNameTextInput.text, passwordTextInput.text)
        }

        backBtn.visible: true
        backBtn.onClicked: {
            stackView.pop(StackView.PushTransition)
        }
    }
}
