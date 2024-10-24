import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.0

Item {
    id:adminLoginItem
    objectName: "adminLoginPage"

    Component.onCompleted: {
        console.log("Component.onCompleted Admin Login Page")
    }

    GameHeader{
        id:adminLoginPageHeader
    }

    Rectangle{
        id: mainArea
        color: "white"
        anchors.top: adminLoginPageHeader.bottom
        anchors.bottom: adminLoginPagefooter.top
        width: parent.width

        Label{
            id: userNameLabel
            anchors.left: userNameTextInput.left
            anchors.top: parent.top
            anchors.topMargin: inputPanel.visible ? 10 : 100
            text: "Admin User Name"
        }
        TextField{
            id: userNameTextInput
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: userNameLabel.bottom
            anchors.topMargin: 10
            width: 300
            height: 45
            onPressed: {
                //inputPanel.visible = true
                //inputPanel.active  = true
                //inputPanel.enabled = true
                focus = true
            }
        }

        Label{
            id: passwordLabel
            anchors.left: passwordTextInput.left
            anchors.top: userNameTextInput.bottom
            anchors.topMargin: 20
            text: "Admin Password"
        }
        TextField{
            id: passwordTextInput
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: passwordLabel.bottom
            anchors.topMargin: 10
            width: 300
            height: 45
            echoMode: TextInput.Password
            passwordCharacter: '*'
            onPressed: {
                //inputPanel.visible = true
                //inputPanel.active  = true
                //inputPanel.enabled = true
                focus = true
            }
        }

        // VirtualKeyboard
        //
        InputPanel {
            id: inputPanel
            z: 99
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.bottom
            anchors.bottom: parent.bottom
            active: true
            visible: true
            enabled: true
        }
    }



    Connections {
        target: adminLoginPagefooter
        function onLoginBtnClicked(username, password) {
            console.log("admin login slot")
            if(adminPlayModel.onAdminLogin(username, password)){
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

    GameFooter{
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
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
            console.log("stack view size: "+stackView.depth+" "+stackView.get(0))
        }
    }
}
