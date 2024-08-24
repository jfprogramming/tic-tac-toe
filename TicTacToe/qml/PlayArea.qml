import QtQuick
import QtQuick.Controls
import "qrc:/onePlayerMode.js" as JavaScript


Item {
    id: playArea

    property string player1: "player1"
    property string player2: "player2"

    property int currentPlayer: 0
    property bool playerWon: false

    property string gameType: "1Player" //getGameType()

    // Create an array to store item IDs
    property var itemIds: []
    property var emptyImgs: []

    property alias rowWidth: row1.width
    property alias row1Id: row1
    property alias row1Rect1ImgAlias: row1rect1Img


    // *** JavaScript Function Section *** //
    function getCurrentPlayer(){
        // TODO call Q_INVOKABLE Function to get current player turn
    }

    function checkPlayerTurn(){
        if(currentPlayer == 1){
            currentPlayer = 2
        }
        else if(currentPlayer == 2){
            currentPlayer = 1
        }
        else{
            // set the first player at start of game
            currentPlayer = 1
        }

        console.log("set player turn to: " + currentPlayer)
    }

    function checkForHorizontalWin(){
        console.log("check for a horizontal win")
        // Row 1 Horizontal win
        //
        if(row1rect1Img.source == "qrc:/x_img.png" &&
                row1rect2Img.source == "qrc:/x_img.png" &&
                row1rect3Img.source == "qrc:/x_img.png"){
            console.log("X Wins")
            win1.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        else if(row1rect1Img.source == "qrc:/o_img.png" &&
                row1rect2Img.source == "qrc:/o_img.png" &&
                row1rect3Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            win1.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        // Row 2 Horizontal win
        //
        else if(row2rect1Img.source == "qrc:/x_img.png" &&
                row2rect2Img.source == "qrc:/x_img.png" &&
                row2rect3Img.source == "qrc:/x_img.png"){
            console.log("Row 2 X Wins")
            win2.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        else if(row2rect1Img.source == "qrc:/o_img.png" &&
                row2rect2Img.source == "qrc:/o_img.png" &&
                row2rect3Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            win2.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        // Row 3 Horizontal win
        //
        else if(row3rect1Img.source == "qrc:/x_img.png" &&
                row3rect2Img.source == "qrc:/x_img.png" &&
                row3rect3Img.source == "qrc:/x_img.png"){
            console.log("X Wins")
            win3.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        else if(row3rect1Img.source == "qrc:/o_img.png" &&
                row3rect2Img.source == "qrc:/o_img.png" &&
                row3rect3Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            win3.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        else{
            console.log("no horizontal win...")
        }
    }

    function checkForVerticalWin(){
        console.log("check for a vertical win")
        // Colum 1 Vertical win
        //
        if(row1rect1Img.source == "qrc:/x_img.png" &&
                row2rect1Img.source == "qrc:/x_img.png" &&
                row3rect1Img.source == "qrc:/x_img.png"){
            console.log("X Wins")
            win4.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        else if(row1rect1Img.source == "qrc:/o_img.png" &&
                row2rect1Img.source == "qrc:/o_img.png" &&
                row3rect1Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            win4.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        // Colum 2 Vertical win
        //
        else if(row1rect2Img.source == "qrc:/x_img.png" &&
                row2rect2Img.source == "qrc:/x_img.png" &&
                row3rect2Img.source == "qrc:/x_img.png"){
            console.log("Row 2 X Wins")
            win5.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        else if(row1rect2Img.source == "qrc:/o_img.png" &&
                row2rect2Img.source == "qrc:/o_img.png" &&
                row3rect2Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            win5.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        // Colum 3 Vertical win
        //
        else if(row1rect3Img.source == "qrc:/x_img.png" &&
                row2rect3Img.source == "qrc:/x_img.png" &&
                row3rect3Img.source == "qrc:/x_img.png"){
            console.log("X Wins")
            win6.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        else if(row1rect3Img.source == "qrc:/o_img.png" &&
                row2rect3Img.source == "qrc:/o_img.png" &&
                row3rect3Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            win6.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        else{
            console.log("no vertical win...")
        }
    }

    function checkFordiagonalWin(){
        console.log("check for a diagonal win")
        // Diagonal Win 1
        //
        if(row1rect1Img.source == "qrc:/x_img.png" &&
                row2rect2Img.source == "qrc:/x_img.png" &&
                row3rect3Img.source == "qrc:/x_img.png"){
            console.log("X Wins")
            win7.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        else if(row1rect1Img.source == "qrc:/o_img.png" &&
                row2rect2Img.source == "qrc:/o_img.png" &&
                row3rect3Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            win7.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }

        // Diagonal Win 2
        //
        else if(row1rect3Img.source == "qrc:/x_img.png" &&
                row2rect2Img.source == "qrc:/x_img.png" &&
                row3rect1Img.source == "qrc:/x_img.png"){
            console.log("X Wins")
            win8.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        else if(row1rect3Img.source == "qrc:/o_img.png" &&
                row2rect2Img.source == "qrc:/o_img.png" &&
                row3rect1Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            win8.visible = true
            winText.visible = true
            mainColumn.enabled = false
            playerWon = true
        }
        else{
            console.log("no diagonal win...")
        }
    }

    function playerTwoTurn() {
        checkPlayerTurn()
        var selectedSquare = null
        const emptySquares = []

        if (gameType == "1Player" && currentPlayer == 2) {
            // find the empty squars
            //
            for (const item of itemIds) {
                console.log("Item ID:", item.objectName, "Source:", item.source)
                if (item.source == "") {
                    console.log("add item")
                    emptySquares.push(item)
                }
            }

            if (emptySquares.length > 0) {
                var randomIndex = Math.floor(Math.random() * emptySquares.length)
                console.log("randomIndex: "+randomIndex)
                selectedSquare = emptySquares[randomIndex]
                console.log("Selected square ID:", selectedSquare.objectName)
                selectedSquare.source = "qrc:/o_img.png"
                selectedSquare.visible = true
                //selectedSquare.parent.endabled = false

                // check for a winner
                checkForHorizontalWin()
                checkForVerticalWin()
                checkFordiagonalWin()
            }
            else {
                console.log("No empty squares available.")
            }
        }
        else{
            console.log("not your turn computer... wait your turn!")
        }
    }

    // Timer object only used for 1Player games
    Timer {
        id: delayTimer
        interval: 1000 // 1 second
        onTriggered: {
            console.log("timer triggered...")
            playerTwoTurn() // Call playerTwoTurn after the delay
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
                console.log("winText visibility:", visible)
            }
            Component.onCompleted: {
                console.log("winText visibility:", visible)
            }
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
                        Component.onCompleted: {
                            itemIds.push(row1rect1Img)
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            // set X or O based of player 1 or player 2
                            row1rect1Img.visible = true
                            checkPlayerTurn()
                            console.log("current player turn: "+currentPlayer)
                            row1rect1Img.source = currentPlayer == 1 ? "qrc:/x_img.png" : "qrc:/o_img.png"
                            console.log("source:"+row1rect1Img.source)
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row1rect1.enabled = false
                            if(gameType  == "1Player" && playerWon == false){
                                delayTimer.start() // Start the timer after the click
                            }
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
                        Component.onCompleted: {
                            itemIds.push(row1rect2Img)
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            row1rect2Img.visible = true
                            checkPlayerTurn()
                            console.log("current player turn: "+currentPlayer)
                            row1rect2Img.source = currentPlayer == 1 ? "qrc:/x_img.png" : "qrc:/o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row1rect2.enabled = false
                            if(gameType  == "1Player" && playerWon == false){
                                delayTimer.start() // Start the timer after the click
                            }
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
                        Component.onCompleted: {
                            itemIds.push(row1rect3Img)
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            row1rect3Img.visible = true
                            checkPlayerTurn()
                            console.log("current player turn: "+currentPlayer)
                            row1rect3Img.source = currentPlayer == 1 ? "qrc:/x_img.png" : "qrc:/o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row1rect3.enabled = false
                            if(gameType  == "1Player" && playerWon == false){
                                delayTimer.start() // Start the timer after the click
                            }
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
                        Component.onCompleted: {
                            itemIds.push(row2rect1Img)
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            row2rect1Img.visible = true
                            checkPlayerTurn()
                            console.log("current player turn: "+currentPlayer)
                            row2rect1Img.source = currentPlayer == 1 ? "qrc:/x_img.png" : "qrc:/o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row2rect1.enabled = false
                            if(gameType  == "1Player" && playerWon == false){
                                delayTimer.start() // Start the timer after the click
                            }
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
                        Component.onCompleted: {
                            itemIds.push(row2rect2Img)
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            row2rect2Img.visible = true
                            checkPlayerTurn()
                            console.log("current player turn: "+currentPlayer)
                            row2rect2Img.source = currentPlayer == 1 ? "qrc:/x_img.png" : "qrc:/o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row2rect2.enabled = false
                            if(gameType  == "1Player" && playerWon == false){
                                delayTimer.start() // Start the timer after the click
                            }
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
                        Component.onCompleted: {
                            itemIds.push(row2rect3Img)
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            row2rect3Img.visible = true
                            checkPlayerTurn()
                            console.log("current player turn: "+currentPlayer)
                            row2rect3Img.source = currentPlayer == 1 ? "qrc:/x_img.png" : "qrc:/o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row2rect3.enabled = false
                            if(gameType  == "1Player" && playerWon == false){
                                delayTimer.start() // Start the timer after the click
                            }
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
                        Component.onCompleted: {
                            itemIds.push(row3rect1Img)
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            row3rect1Img.visible = true
                            checkPlayerTurn()
                            console.log("current player turn: "+currentPlayer)
                            row3rect1Img.source = currentPlayer == 1 ? "qrc:/x_img.png" : "qrc:/o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row3rect1.enabled = false
                            if(gameType  == "1Player" && playerWon == false){
                                delayTimer.start() // Start the timer after the click
                            }
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
                        Component.onCompleted: {
                            itemIds.push(row3rect2Img)
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            row3rect2Img.visible = true
                            checkPlayerTurn()
                            console.log("current player turn: "+currentPlayer)
                            row3rect2Img.source = currentPlayer == 1 ? "qrc:/x_img.png" : "qrc:/o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row3rect2.enabled = false
                            if(gameType  == "1Player" && playerWon == false){
                                delayTimer.start() // Start the timer after the click
                            }
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
                        Component.onCompleted: {
                            itemIds.push(row3rect3Img)
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            row3rect3Img.visible = true
                            checkPlayerTurn()
                            console.log("current player turn: "+currentPlayer)
                            row3rect3Img.source = currentPlayer == 1 ? "qrc:/x_img.png" : "qrc:/o_img.png"
                            checkForHorizontalWin()
                            checkForVerticalWin()
                            checkFordiagonalWin()
                            row3rect3.enabled = false
                            if(gameType  == "1Player" && playerWon == false){
                                delayTimer.start() // Start the timer after the click
                            }
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
