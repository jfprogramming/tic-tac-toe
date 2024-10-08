import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
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
                width: highScoreListView.width
                height: 50
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
                    id: name
                    text: qsTr("text")
                }
                Text {
                    text: model.display
                    width: 200
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
