import QtQuick

Item {
    Header{
        id:highScoreHeader
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
            id: highScoreColumn
            spacing: 10
            Text{
                id: highScore_1
                text: "1) "
            }
            Text{
                id: highScore_2
                text: "2) "
            }
            Text{
                id: highScore_3
                text: "3) "
            }
            Text{
                id: highScore_4
                text: "4) "
            }
            Text{
                id: highScore_5
                text: "5) "
            }
            Text{
                id: highScore_6
                text: "6) "
            }
            Text{
                id: highScore_7
                text: "7) "
            }
            Text{
                id: highScore_8
                text: "8) "
            }
            Text{
                id: highScore_9
                text: "9) "
            }
            Text{
                id: highScore_10
                text: "10) "
            }

        }
    }

    Footer{
        id:highScoreFooter
        //homeBtn.onClicked: {
            //stackView.pop(homePage)
        //}
    }

}
