import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Item {
    id: homePage
    objectName: "homePage"

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

        Button{
            id:onePlayerBtn
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            icon.name: "onePlayer" // Material icon name
            Material.icon.color: "#0078D4"
            Text{
                id: onePlayerBtnTxt
                text: "1 Player Game"
                anchors.centerIn: parent
            }
            onClicked: {
                console.log("One Player Game Selected...")
                //display play area
                //
                stackView.push("PlayerSelection.qml")
            }
        }

        Button{
            id:twoPlayerBtn
            anchors.top: onePlayerBtn.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            icon.name: "twoPlayer" // Material icon name
            Material.icon.color: "#0078D4"
            Text{
                id: twoPlayerBtnTxt
                text: "2 Player Game"
                anchors.centerIn: parent
            }
            onClicked: {
                console.log("Two Player Game Selected...")
                //display play area
                //
                stackView.push("PlayerSelection.qml")
            }
        }
        Button{
            id:highScoreBtn
            anchors.top: twoPlayerBtn.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            icon.name: "highScore" // Material icon name
            Material.icon.color: "#0078D4"
            Text{
                id: highScoreBtnTxt
                text: "High Score"
                anchors.centerIn: parent
            }
            onClicked: {
                stackView.push("HighScore.qml")
            }
        }
    }

    Footer{
        id: homePagefooter
        homeBtn.width: 200
        homeBtn.onClicked: {
            stackView.push("AdminLogin.qml")
        }
        homeBtnTxt: "Admin Login"
    }
}
