import QtQuick
import QtQuick.Controls

Item {
    id: playArea

    property string player1: "player1"
    property string player2: "player2"

    property int currentPlayer: 0
    property bool playerWon: false

    property alias rowWidth: row1.width
    property alias row1Id: row1
    property alias row1Rect1ImgAlias: row1rect1Img


    // *** JavaScript Function Section *** //
    function getCurrentPlayer(){
        // TODO call Q_INVOKABLE Function to get current player turn
    }


    function checkPlayerTurn(){
        if(currentPlayer == 1){
            //set the next play to player 2
            currentPlayer = 2;
        }
        else{
            currentPlayer = 1;
        }
    }

    function checkForHorizontalWin(){
        // Row 1 Horizontal win
        //
        if(row1rect1Img.source == "qrc:///x_img.png" &&
                row1rect2Img.source == "qrc:///x_img.png" &&
                row1rect3Img.source == "qrc:///x_img.png"){
            console.log("X Wins")
            win1.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        if(row1rect1Img.source == "qrc:///o_img.png" &&
                row1rect2Img.source == "qrc:///o_img.png" &&
                row1rect3Img.source == "qrc:///o_img.png"){
            console.log("O Wins")
            win1.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        // Row 2 Horizontal win
        //
        if(row2rect1Img.source == "qrc:///x_img.png" &&
                row2rect2Img.source == "qrc:///x_img.png" &&
                row2rect3Img.source == "qrc:///x_img.png"){
            console.log("Row 2 X Wins")
            win2.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        if(row2rect1Img.source == "qrc:///o_img.png" &&
                row2rect2Img.source == "qrc:///o_img.png" &&
                row2rect3Img.source == "qrc:///o_img.png"){
            console.log("O Wins")
            win2.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        // Row 3 Horizontal win
        //
        if(row3rect1Img.source == "qrc:///x_img.png" &&
                row3rect2Img.source == "qrc:///x_img.png" &&
                row3rect3Img.source == "qrc:///x_img.png"){
            console.log("X Wins")
            win3.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        if(row3rect1Img.source == "qrc:///o_img.png" &&
                row3rect2Img.source == "qrc:///o_img.png" &&
                row3rect3Img.source == "qrc:///o_img.png"){
            console.log("O Wins")
            win3.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
    }

    function checkForVerticalWin(){
        // Colum 1 Vertical win
        //
        if(row1rect1Img.source == "qrc:///x_img.png" &&
                row2rect1Img.source == "qrc:///x_img.png" &&
                row3rect1Img.source == "qrc:///x_img.png"){
            console.log("X Wins")
            win4.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        if(row1rect1Img.source == "qrc:///o_img.png" &&
                row2rect1Img.source == "qrc:///o_img.png" &&
                row3rect1Img.source == "qrc:///o_img.png"){
            console.log("O Wins")
            win4.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        // Colum 2 Vertical win
        //
        if(row1rect2Img.source == "qrc:///x_img.png" &&
                row2rect2Img.source == "qrc:///x_img.png" &&
                row3rect2Img.source == "qrc:///x_img.png"){
            console.log("Row 2 X Wins")
            win5.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        if(row1rect2Img.source == "qrc:///o_img.png" &&
                row2rect2Img.source == "qrc:///o_img.png" &&
                row3rect2Img.source == "qrc:///o_img.png"){
            console.log("O Wins")
            win5.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        // Colum 3 Vertical win
        //
        if(row1rect3Img.source == "qrc:///x_img.png" &&
                row2rect3Img.source == "qrc:///x_img.png" &&
                row3rect3Img.source == "qrc:///x_img.png"){
            console.log("X Wins")
            win6.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        if(row1rect3Img.source == "qrc:///o_img.png" &&
                row2rect3Img.source == "qrc:///o_img.png" &&
                row3rect3Img.source == "qrc:///o_img.png"){
            console.log("O Wins")
            win6.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
    }

    function checkFordiagonalWin(){
        // Diagonal Win 1
        //
        if(row1rect1Img.source == "qrc:///x_img.png" &&
                row2rect2Img.source == "qrc:///x_img.png" &&
                row3rect3Img.source == "qrc:///x_img.png"){
            console.log("X Wins")
            win7.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        if(row1rect1Img.source == "qrc:///o_img.png" &&
                row2rect2Img.source == "qrc:///o_img.png" &&
                row3rect3Img.source == "qrc:///o_img.png"){
            console.log("O Wins")
            win7.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }

        // Diagonal Win 2
        //
        if(row1rect3Img.source == "qrc:///x_img.png" &&
                row2rect2Img.source == "qrc:///x_img.png" &&
                row3rect1Img.source == "qrc:///x_img.png"){
            console.log("X Wins")
            win8.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
        if(row1rect3Img.source == "qrc:///o_img.png" &&
                row2rect2Img.source == "qrc:///o_img.png" &&
                row3rect1Img.source == "qrc:///o_img.png"){
            console.log("O Wins")
            win8.visible = true
            winText.visible = true
            mainColumn.enabled = false
        }
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

        Text {
            id: winText
            text: currentPlayer == 1 ? "Player 1 Wins!" : "Player 2 Wins"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 56
            color: "red"
            visible: false
            z:100
            onVisibleChanged: {
                console.log("winText visibility:", visible);
            }
            Component.onCompleted: {
                console.log("winText visibility:", visible);
            }
        }

        Rectangle{
            id: win1
            visible: false
            rotation: 0
            width: parent.width
            height: 20
            anchors.top: parent.top
            anchors.topMargin: 50
            color: "red"
            z:100
        }

        Rectangle{
            id: win2
            visible: false
            rotation: 0
            width: parent.width
            height: 20
            anchors.top: parent.top
            anchors.topMargin: 185
            color: "red"
            z:100
        }

        Rectangle{
            id: win3
            visible: false
            rotation: 0
            width: parent.width
            height: 20
            anchors.top: parent.top
            anchors.topMargin: 325
            color: "red"
            z:100
        }

        Rectangle{
            id: win4
            visible: false
            rotation: 0
            height: parent.height
            width: 20
            anchors.left: parent.left
            anchors.leftMargin: 100
            color: "red"
            z:100
        }

        Rectangle{
            id: win5
            visible: false
            rotation: 0
            height: parent.height
            width: 20
            anchors.left: parent.left
            anchors.leftMargin: 185
            color: "red"
            z:100
        }

        Rectangle{
            id: win6
            visible: false
            rotation: 0
            height: parent.height
            width: 20
            anchors.left: parent.left
            anchors.leftMargin: 325
            color: "red"
            z:100
        }


        Rectangle{
            id: win7
            visible: false
            rotation: 40
            width: parent.width
            height: 20
            anchors.centerIn: boarder
            color: "red"
            z:100
        }

        Rectangle{
            id: win8
            visible: false
            rotation: -40
            width: parent.width
            height: 20
            anchors.centerIn: boarder
            color: "red"
            z:100
        }

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
                    enabled: true
                    Image {
                        id: row1rect1Img
                        anchors.fill: parent
                        visible: false
                        source: ""
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            // set X or O based of player 1 or player 2
                            row1rect1Img.visible = true;
                            checkPlayerTurn();
                            row1rect1Img.source = currentPlayer == 1 ? "qrc:///x_img.png" : "qrc:///o_img.png"
                            console.log("source:"+row1rect1Img.source)
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row1rect1.enabled = false
                        }
                    }
                }
                Rectangle {
                    id: row1rect2
                    width: row1.width / 3
                    height: row1.height
                    color: "white"
                    enabled: true
                    Image {
                        id: row1rect2Img
                        visible: false
                        anchors.fill: parent
                        source: ""
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            //checkPlayerTurn();
                            // set X or O based of player 1 or player 2
                            row1rect2Img.visible = true;
                            checkPlayerTurn();
                            row1rect2Img.source = currentPlayer == 1 ? "qrc:///x_img.png" : "qrc:///o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row1rect2.enabled = false
                        }
                    }
                }
                Rectangle {
                    id: row1rect3
                    width: row1.width / 3
                    height: row1.height
                    color: "white"
                    enabled: true
                    Image {
                        id: row1rect3Img
                        visible: false
                        anchors.fill: parent
                        source: ""
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            //checkPlayerTurn();
                            // set X or O based of player 1 or player 2
                            row1rect3Img.visible = true;
                            checkPlayerTurn();
                            row1rect3Img.source = currentPlayer == 1 ? "qrc:///x_img.png" : "qrc:///o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row1rect3.enabled = false
                        }
                    }
                }
            }

            // Row 2
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
                    enabled: true
                    Image {
                        id: row2rect1Img
                        visible: false
                        anchors.fill: parent
                        source: ""
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            //checkPlayerTurn();
                            // set X or O based of player 1 or player 2
                            row2rect1Img.visible = true;
                            checkPlayerTurn();
                            row2rect1Img.source = currentPlayer == 1 ? "qrc:///x_img.png" : "qrc:///o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row2rect1.enabled = false
                        }
                    }
                }
                Rectangle {
                    id: row2rect2
                    width: row2.width / 3
                    height: row2.height
                    color: "white"
                    enabled: true
                    Image {
                        id: row2rect2Img
                        visible: false
                        anchors.fill: parent
                        source: ""
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            //checkPlayerTurn();
                            // set X or O based of player 1 or player 2
                            row2rect2Img.visible = true;
                            checkPlayerTurn();
                            row2rect2Img.source = currentPlayer == 1 ? "qrc:///x_img.png" : "qrc:///o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row2rect2.enabled = false
                        }
                    }
                }
                Rectangle {
                    id: row2rect3
                    width: row2.width / 3
                    height: row2.height
                    color: "white"
                    enabled: true
                    Image {
                        id: row2rect3Img
                        visible: false
                        anchors.fill: parent
                        source: ""
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            //checkPlayerTurn();
                            // set X or O based of player 1 or player 2
                            row2rect3Img.visible = true;
                            checkPlayerTurn();
                            row2rect3Img.source = currentPlayer == 1 ? "qrc:///x_img.png" : "qrc:///o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row2rect3.enabled = false
                        }
                    }
                }
            }

            // Row 3
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
                    enabled: true
                    Image {
                        id: row3rect1Img
                        visible: false
                        anchors.fill: parent
                        source: ""
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            //checkPlayerTurn();
                            // set X or O based of player 1 or player 2
                            row3rect1Img.visible = true;
                            checkPlayerTurn();
                            row3rect1Img.source = currentPlayer == 1 ? "qrc:///x_img.png" : "qrc:///o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row3rect1.enabled = false
                        }
                    }
                }
                Rectangle {
                    id: row3rect2
                    width: row3.width / 3
                    height: row3.height
                    color: "white"
                    enabled: true
                    Image {
                        id: row3rect2Img
                        visible: false
                        anchors.fill: parent
                        source: ""
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            //checkPlayerTurn();
                            // set X or O based of player 1 or player 2
                            row3rect2Img.visible = true;
                            checkPlayerTurn();
                            row3rect2Img.source = currentPlayer == 1 ? "qrc:///x_img.png" : "qrc:///o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row3rect2.enabled = false
                        }
                    }
                }
                Rectangle {
                    id: row3rect3
                    width: row3.width / 3
                    height: row3.height
                    color: "white"
                    enabled: true
                    Image {
                        id: row3rect3Img
                        visible: false
                        anchors.fill: parent
                        source: ""
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            //checkPlayerTurn();
                            // set X or O based of player 1 or player 2
                            row3rect3Img.visible = true;
                            checkPlayerTurn();
                            row3rect3Img.source = currentPlayer == 1 ? "qrc:///x_img.png" : "qrc:///o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row3rect3.enabled = false
                        }
                    }
                }
            }
        }
    }

    Footer{
        id:playAreaFooter
        homeBtn.onClicked: {
            stackView.pop()
        }
        homeBtnTxt: "Back"
    }
}
