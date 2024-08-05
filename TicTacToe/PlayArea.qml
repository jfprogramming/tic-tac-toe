import QtQuick
import QtQuick.Controls

Item {
    id: playArea
    anchors.fill: parent

    property string player1: "player1"
    property string player2: "player2"

    property string currentPlater: "player1"

    Rectangle{
        id: threeInARow
        visible: false
        rotation: 0
        width: 20
        height: parent.height
        color: "black"
        z:100
    }

    Header{
        id:playAreaHeader
    }

    Rectangle {
        id: boarder
        color: "black"
        anchors.fill: parent
        anchors.top: playAreaHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: playAreaFooter.top
        anchors.bottomMargin: 50

        Column{
            id: mainColumn
            spacing: 10
            anchors.fill: parent

            Row{
                id: row1
                spacing: 10
                width: mainColumn.width
                height: mainColumn.height / 3

                Rectangle {
                    id: row1rect1
                    width: row1.width / 3
                    height: row1.height
                    color: "white"
                    Image {
                        id: row1rect1Img
                        anchors.fill: parent
                        visible: false
                        source: currentPlater == "player1" ? "qrc:///x_img.png" : "qrc:///o_img.jpg"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            // set X or O based of player 1 or player 2
                            row1rect1Img.visible = true;
                            console.log("row 1 column 1 clicked, visible:"+row1rect1Img.visible)
                            console.log("image src: "+row1rect1Img.source)
                        }
                    }

                }
                Rectangle {
                    id: row1rect2
                    width: row1.width / 3
                    height: row1.height
                    color: "white"
                    Image {
                        id: row1rect2Img
                        visible: false
                        anchors.fill: parent
                        source: currentPlater == "player1" ? "qrc:///x_img.png" : "qrc:///o_img.jpg"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            // set X or O based of player 1 or player 2
                            row1rect2Img.visible = true;

                        }
                    }

                }
                Rectangle {
                    id: row1rect3
                    width: row1.width / 3
                    height: row1.height
                    color: "white"
                    Image {
                        id: row1rect3Img
                        visible: false
                        anchors.fill: parent
                        source: currentPlater == "player1" ? "qrc:///x_img.png" : "qrc:///o_img.jpg"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            // set X or O based of player 1 or player 2
                            row1rect3Img.visible = true;

                        }
                    }

                }
            }
            Row{
                id: row2
                spacing: 10
                width: mainColumn.width
                height: mainColumn.height / 3

                Rectangle {
                    id: row2rect1
                    width: row2.width / 3
                    height: row2.height
                    color: "white"
                    Image {
                        id: row2rect1Img
                        visible: false
                        anchors.fill: parent
                        source: currentPlater == "player1" ? "qrc:///x_img.png" : "qrc:///o_img.jpg"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            // set X or O based of player 1 or player 2
                            row2rect1Img.visible = true;

                        }
                    }

                }
                Rectangle {
                    id: row2rect2
                    width: row2.width / 3
                    height: row2.height
                    color: "white"
                    Image {
                        id: row2rect2Img
                        visible: false
                        anchors.fill: parent
                        source: currentPlater == "player1" ? "qrc:///x_img.png" : "qrc:///o_img.jpg"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            // set X or O based of player 1 or player 2
                            row2rect2Img.visible = true;

                        }
                    }

                }
                Rectangle {
                    id: row2rect3
                    width: row2.width / 3
                    height: row2.height
                    color: "white"
                    Image {
                        id: row2rect3Img
                        visible: false
                        anchors.fill: parent
                        source: currentPlater == "player1" ? "qrc:///x_img.png" : "qrc:///o_img.jpg"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            // set X or O based of player 1 or player 2
                            row2rect3Img.visible = true;

                        }
                    }

                }
            }
            Row{
                id: row3
                spacing: 10
                width: mainColumn.width
                height: mainColumn.height / 3

                Rectangle {
                    id: row3rect1
                    width: row3.width / 3
                    height: row3.height
                    color: "white"
                    Image {
                        id: row3rect1Img
                        visible: false
                        anchors.fill: parent
                        source: currentPlater == "player1" ? "qrc:///x_img.png" : "qrc:///o_img.jpg"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            // set X or O based of player 1 or player 2
                            row3rect1Img.visible = true;

                        }
                    }

                }
                Rectangle {
                    id: row3rect2
                    width: row3.width / 3
                    height: row3.height
                    color: "white"
                    Image {
                        id: row3rect2Img
                        visible: false
                        anchors.fill: parent
                        source: currentPlater == "player1" ? "qrc:///x_img.png" : "qrc:///o_img.jpg"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            // set X or O based of player 1 or player 2
                            row3rect2Img.visible = true;

                        }
                    }

                }
                Rectangle {
                    id: row3rect3
                    width: row3.width / 3
                    height: row3.height
                    color: "white"
                    Image {
                        id: row3rect3Img
                        visible: false
                        anchors.fill: parent
                        source: currentPlater == "player1" ? "qrc:///x_img.png" : "qrc:///o_img.jpg"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            // set X or O based of player 1 or player 2
                            row3rect3Img.visible = true;
                        }
                    }
                }
            }
        }
    }

    Footer{
        id:playAreaFooter
    }
}
