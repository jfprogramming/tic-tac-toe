import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Item {
    id: homePage
    objectName: "homePage"

    onVisibleChanged: {
        if(visible){
            gameLogic.gameType = ""
        }
    }

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
            id:btnColumn
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 30

            Button{
                id:onePlayerBtn
                icon.source: "qrc:///onePlayer.png" // Material icon source
                icon.color: "#0078D4"
                text: qsTr("1 Player Game")
                width: 200
                onClicked: {
                    console.log("One Player Game Selected...")
                    //display play area
                    //
                    stackView.push("PlayerSelection.qml", StackView.PushTransition)
                    gameLogic.gameType = "1Player"
                }
            }

            Button{
                id:twoPlayerBtn
                icon.source: "qrc:///twoPlayer.png" // Material icon source
                icon.color: "#0078D4"
                text: qsTr("2 Player Game")
                width: 200
                onClicked: {
                    console.log("Two Player Game Selected...")
                    //display play area
                    //
                    stackView.push("PlayerSelection.qml", StackView.PushTransition)
                    gameLogic.gameType = "2Player"
                }
            }
            Button{
                id:highScoreBtn
                icon.source: "qrc:///highScore.png" // Material icon source
                icon.color: "#0078D4"
                text: qsTr("High Score")
                width: 200
                onClicked: {
                    stackView.push("HighScore.qml", StackView.PushTransition)
                }
            }
        }
    }

    Footer{
        id: homePagefooter
        homeBtn.width: 200
        homeBtn.onClicked: {
            stackView.push("AdminLogin.qml", StackView.PushTransition)
        }
        homeBtnTxt: "Admin Login"
        homeIcon: "qrc:///adminAccount.png"
    }
}
