import QtQuick

Item {
    id:playerSelectionItem

    Header{
        id:playerSelectionHeader
    }

    Rectangle{
        id: mainArea
        anchors.fill: parent
        color: "white"
        anchors.top: playerSelectionHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: playerSelectionHeader.top
        anchors.bottomMargin: 50

        GridView{
            id:playerSelectionArea
            anchors.fill: parent
            model: PlayerModel {}
            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            focus: true
            cellWidth: 150
            cellHeight: 150
            delegate:
                Column {
                Image {
                    source: portrait
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 100
                    height: 100
                }
                Text {
                    text: name
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    Footer{
        id: playerSelectionfooter
    }
}
