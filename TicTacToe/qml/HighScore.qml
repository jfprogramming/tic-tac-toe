import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: highScorePageItem
    objectName: "highScorePage"
    focus: true

    Header {
        id: highScoreHeader
    }

    Row {
        width: parent.width
        height: 50
        spacing: 50
        Rectangle {
            width: parent.width / 3
            height: parent.height
            color: "lightgray"
            Text {
                anchors.centerIn: parent
                text: "Rank"
            }
        }
        Rectangle {
            width: parent.width / 3
            height: parent.height
            color: "lightgray"
            Text {
                anchors.centerIn: parent
                text: "Player Name"
            }
        }
        Rectangle {
            width: parent.width / 3
            height: parent.height
            color: "lightgray"
            Text {
                anchors.centerIn: parent
                text: "High Score"
            }
        }
    }
    Rectangle {
        id: mainArea
        anchors.fill: parent
        color: "white"
        anchors.top: highScoreHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: highScoreFooter.top
        anchors.bottomMargin: 50

        ScrollView {
            id: highScoreScrollView
            anchors.fill: parent

            ListView {
                id: highScoreListView
                width: parent.width
                height: parent.height
                model: highscoreModel
                highlight: Rectangle {
                    color: "lightblue"
                }
                highlightFollowsCurrentItem: true
                focus: true
                delegate: Row {
                    id: delegateRow
                    spacing: 50
                    Text {
                        text: (index + 1).toString()
                        width: parent.width / 3
                    }
                    Text {
                        text: model.playerName
                        width: parent.width / 3
                    }
                    Text {
                        text: model.highScore
                        width: parent.width / 3
                    }
                }
            }
        }
    }

    Footer {
        id: highScoreFooter
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
        }
    }
}
