import QtQuick

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
        model: HighscoreModel // Use the registered model

        delegate: Item {
            width: parent.width
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
            stackView.pop()
        }
    }

}
