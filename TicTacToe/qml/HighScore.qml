import QtQuick
import QtQuick.Controls

Item {
    Header{
        id:highScoreHeader
    }

    ListView {
        id: mainArea
        anchors.fill: parent
        anchors.top: highScoreHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: highScoreFooter.top
        anchors.bottomMargin: 50
        model: highscoreModel // Use the registered model

        delegate: Item {
            height: 40
            Row {
                spacing: 30

                Text {
                    text: (index + 1) + "."
                }

                Text {
                    text: display !== undefined ? display : "N/A"
                }
            }
        }
    }

    Footer{
        id:highScoreFooter
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
        }
    }
}
