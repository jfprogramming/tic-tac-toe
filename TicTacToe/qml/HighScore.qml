import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    focus: true  // Ensure the parent Item can receive focus

    Header {
        id: highScoreHeader
    }

    ScrollView {
        id: highScoreScrollView
        anchors.top: highScoreHeader.bottom
        anchors.bottom: highScoreFooter.top
        anchors.left: parent.left
        anchors.right: parent.right

        ListView {
            id: highScoreListView
            width: parent.width - 20
            height: parent.height - 20
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
                    width: 50
                }
                Text {
                    text: model.playerName
                    width: 200
                }
                Text {
                    text: model.highScore
                    width: 100

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
