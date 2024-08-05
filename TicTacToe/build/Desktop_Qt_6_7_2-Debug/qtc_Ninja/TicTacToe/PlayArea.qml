import QtQuick

Item {
    id: playArea
    anchors.fill: parent

    property string player1: "player1"
    property string player2: "player2"

    property string currentPlater: "player1"

    Image{
        id:img
        anchors.fill: parent
        source: 'qrc:/images/o_img.png'
        fillMode: Image.Stretch
        Component.onCompleted: {
            console.log("Image path:", img.source);
        }
    }

    /*
    Rectangle {
        id: border
        color: "black"
        anchors.fill: parent

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
                        //fillMode: Image.PreserveAspectFit
                        visible: false
                        source: currentPlater == "player1" ? "images/ximg.jpg" : "images/oimg.jpg"
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
                        source: currentPlater == "player1" ? "images/ximg.png" : "images/oimg.jpg"
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
                        source: currentPlater == "player1" ? "images/ximg.png" : "images/oimg.jpg"
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
                        source: currentPlater == "player1" ? "images/ximg.png" : "images/oimg.jpg"
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
                        source: currentPlater == "player1" ? "images/ximg.png" : "images/oimg.jpg"
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
                        source: currentPlater == "player1" ? "images/ximg.png" : "images/oimg.jpg"
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
                        source: currentPlater == "player1" ? "images/ximg.png" : "images/oimg.jpg"
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
                        source: currentPlater == "player1" ? "images/ximg.png" : "images/oimg.jpg"
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
                        source: currentPlater == "player1" ? "images/ximg.png" : "images/oimg.jpg"
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
    }*/
}
