import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: highScorePageItem
    objectName: "highScorePage"

    Component.onCompleted: {
        console.log("High Score Page Loaded...")
    }

    GameHeader {
        id: highScoreHeader
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
                clip: true
                highlight: Rectangle {
                    color: "lightblue"
                }
                highlightFollowsCurrentItem: true
                focus: true
                header: Item {
                    id: tableHeader
                    width: parent.width
                    height: 50
                    Row {
                        id: tableHeaderRow
                        anchors.fill: parent
                        spacing: 10
                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            Text {
                                text: "Rank"
                                width: parent.width / 3
                                color: "black"
                                font.bold: true
                                font.pointSize: 12
                                font.capitalization: Font.AllUppercase
                            }
                        }
                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            Text {
                                text: "Player Name"
                                width: parent.width / 3
                                color: "black"
                                font.bold: true
                                font.pointSize: 12
                                font.capitalization: Font.AllUppercase
                            }
                        }
                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            Text {
                                text: "High Score"
                                width: parent.width / 3
                                color: "black"
                                font.bold: true
                                font.pointSize: 12
                                font.capitalization: Font.AllUppercase
                            }
                        }
                    }
                }
                delegate: Item {
                    id: delegateItem
                    width: parent.width
                    height: 50
                    Row {
                        id: delegateRow
                        anchors.fill: parent
                        spacing: 10
                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            color: "transparent"
                            Text {
                                text: (index + 1).toString()
                                width: parent.width / 3
                            }
                        }
                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            color: "transparent"
                            Text {
                                text: model.playerName
                                width: parent.width / 3
                            }
                        }
                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            color: "transparent"
                            Text {
                                text: model.highScore
                                width: parent.width / 3
                            }
                        }
                    }
                }
            }
        }
    }

    GameFooter {
        id: highScoreFooter
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
        }
    }
}
