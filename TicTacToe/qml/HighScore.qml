import QtQuick
import QtQuick.Controls 2.15

Item {
    Header{
        id: highScoreHeader
    }

    ScrollView{
        id: highScoreScrollView
        anchors.fill: parent

        TableView {
            id: mainArea
            anchors.fill: parent
            anchors.top: highScoreHeader.bottom
            anchors.topMargin: 50
            anchors.bottom: highScoreFooter.top
            anchors.bottomMargin: 50
            model: highscoreModel // Use the registered model
            alternatingRowColors: true // Enable striped rows

            TableViewColumn {
                role: "index"
                title: "#"
                width: 50
            }

            TableViewColumn {
                role: "display"
                title: "Name"
                width: 200
            }
        }
    }

    Footer{
        id: highScoreFooter
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
        }
    }
}
