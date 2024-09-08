import QtQuick
import QtQuick.Controls
import "qrc:/onePlayerMode.js" as JavaScript


Item {
    id: playArea

    property string player1: "player1"
    property string player2: "player2"

    property int currentPlayer: 0
    property bool playerWon: false

    property int p1Score: 0
    property int p2Score: 0

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

    function setWinVariables(player) {
        winText.visible    = true
        mainColumn.enabled = false
        playerWon          = true

        // Create an instance of the custom popup
        var popupComponent = Qt.createComponent("PopupMSg.qml")
        if (popupComponent.status === Component.Ready) {
            var popupInstance = popupComponent.createObject(root)
            //popupComponent.popupMsgText = player+" is The Winner"
            popupInstance.open()
        }
    }

    function checkForHorizontalWin(){
        console.log("check for a horizontal win")
        // Row 1 Horizontal win
        //
        if(row1rect1Img.source == "qrc:/x_img.png" &&
                row1rect2Img.source == "qrc:/x_img.png" &&
                row1rect3Img.source == "qrc:/x_img.png"){
            console.log("X Wins")
            winVisual.winStrike1 = true
            p1Score +=1
            setWinVariables("Player1")
            return true
        }
        else if(row1rect1Img.source == "qrc:/o_img.png" &&
                row1rect2Img.source == "qrc:/o_img.png" &&
                row1rect3Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            winVisual.winStrike1 = true
            setWinVariables("Player2")
            p2Score +=1
            return true
        }
        // Row 2 Horizontal win
        //
        else if(row2rect1Img.source == "qrc:/x_img.png" &&
                row2rect2Img.source == "qrc:/x_img.png" &&
                row2rect3Img.source == "qrc:/x_img.png"){
            console.log("Row 2 X Wins")
            winVisual.winStrike2 = true
            setWinVariables("Player1")
            p2Score +=1
            return true
        }
        else if(row2rect1Img.source == "qrc:/o_img.png" &&
                row2rect2Img.source == "qrc:/o_img.png" &&
                row2rect3Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            winVisual.winStrike2 = true
            setWinVariables("Player2")
            p2Score +=1
            return true
        }
        // Row 3 Horizontal win
        //
        else if(row3rect1Img.source == "qrc:/x_img.png" &&
                row3rect2Img.source == "qrc:/x_img.png" &&
                row3rect3Img.source == "qrc:/x_img.png"){
            console.log("X Wins")
            winVisual.winStrike3 = true
            setWinVariables("Player1")
            p1Score +=1
            return true
        }
        else if(row3rect1Img.source == "qrc:/o_img.png" &&
                row3rect2Img.source == "qrc:/o_img.png" &&
                row3rect3Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            winVisual.winStrike3 = true
            setWinVariables("Player2")
            p2Score +=1
            return true
        }
        else{
            console.log("no horizontal win...")
            return checkForCatsCradle()
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
            winVisual.winStrike4 = true
            setWinVariables("Player1")
            p1Score +=1
            return true
        }
        else if(row1rect1Img.source == "qrc:/o_img.png" &&
                row2rect1Img.source == "qrc:/o_img.png" &&
                row3rect1Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            winVisual.winStrike4.visible = true
            setWinVariables("Player2")
            p2Score +=1
            return true
        }
        // Colum 2 Vertical win
        //
        else if(row1rect2Img.source == "qrc:/x_img.png" &&
                row2rect2Img.source == "qrc:/x_img.png" &&
                row3rect2Img.source == "qrc:/x_img.png"){
            console.log("X Wins")
            winVisual.winStrike5 = true
            setWinVariables("Player1")
            p1Score +=1
            return true
        }
        else if(row1rect2Img.source == "qrc:/o_img.png" &&
                row2rect2Img.source == "qrc:/o_img.png" &&
                row3rect2Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            winVisual.winStrike5 = true
            setWinVariables("Player2")
            p2Score +=1
            return true
        }
        // Colum 3 Vertical win
        //
        else if(row1rect3Img.source == "qrc:/x_img.png" &&
                row2rect3Img.source == "qrc:/x_img.png" &&
                row3rect3Img.source == "qrc:/x_img.png"){
            console.log("X Wins")
            winVisual.winStrike6 = true
            setWinVariables("Player1")
            p1Score +=1
            return true
        }
        else if(row1rect3Img.source == "qrc:/o_img.png" &&
                row2rect3Img.source == "qrc:/o_img.png" &&
                row3rect3Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            winVisual.winStrike6 = true
            setWinVariables("Player1")
            p2Score +=1
            return true
        }
        else{
            console.log("no vertical win...")
            return checkForCatsCradle()
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
            winVisual.winStrike7 = true
            setWinVariables("Player1")
            p1Score +=1
            return true
        }
        else if(row1rect1Img.source == "qrc:/o_img.png" &&
                row2rect2Img.source == "qrc:/o_img.png" &&
                row3rect3Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            winVisual.winStrike7 = true
            setWinVariables("Player2")
            p2Score +=1
            return true
        }

        // Diagonal Win 2
        //
        else if(row1rect3Img.source == "qrc:/x_img.png" &&
                row2rect2Img.source == "qrc:/x_img.png" &&
                row3rect1Img.source == "qrc:/x_img.png"){
            console.log("X Wins")
            winVisual.winStrike8 = true
            setWinVariables("Player1")
            p1Score +=1
            return true
        }
        else if(row1rect3Img.source == "qrc:/o_img.png" &&
                row2rect2Img.source == "qrc:/o_img.png" &&
                row3rect1Img.source == "qrc:/o_img.png"){
            console.log("O Wins")
            winVisual.winStrike8 = true
            setWinVariables("Player2")
            p2Score +=1
            return true
        }
        else{
            console.log("no diagonal win...")
            return checkForCatsCradle()
        }
    }

    function checkForCatsCradle(){
        console.log("Checking for CatsCradle...");

        // Check if all cells are filled (assuming "X" and "O" images)
        if (row1rect1Img.source != "" &&
            row1rect2Img.source != "" &&
            row1rect3Img.source != "" &&
            row2rect1Img.source != "" &&
            row2rect2Img.source != "" &&
            row2rect3Img.source != "" &&
            row3rect1Img.source != "" &&
            row3rect2Img.source != "" &&
            row3rect3Img.source != "") {
            console.log("CatsCradle! All squares filled without a winner.");
            // Handle the CatsCradle scenario (e.g., display a message or end the game)
            return true
        } else {
            console.log("No CatsCradle yet...");
            return false
        }
    }

    // only used for 1Player games
    //
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
                if(!checkForHorizontalWin()
                   && !checkForVerticalWin()
                   && !checkFordiagonalWin()){
                    // if no winner check for a Tie Game
                    checkForCatsCradle()
                }
            }
            else {
                console.log("No empty squares available.")
            }
        }
        else{
            console.log("not your turn computer... wait your turn!")
        }
    }

    // only used for 1Player games
    //
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
        scoreAlias.visible: true
        player1Score: p1Score
        player2Score: p2Score
    }

    Rectangle {
        id: boarder
        color: "black"
        anchors.fill: parent
        anchors.top: playAreaHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: playAreaFooter.top
        anchors.bottomMargin: 50

        WinStrike{
            id: winVisual
            anchors.fill: parent
            z:100
        }

        // Win Text only shown if a player wins
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
                            // check for a winner
                            if(!checkForHorizontalWin()
                               && !checkForVerticalWin()
                               && !checkFordiagonalWin()
                               && gameType  == "1Player"){
                                delayTimer.start() // Start the timer after the click
                            }
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
                            // check for a winner
                            if(!checkForHorizontalWin()
                               && !checkForVerticalWin()
                               && !checkFordiagonalWin()
                               && gameType  == "1Player"){
                                delayTimer.start() // Start the timer after the click
                            }
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
                            // check for a winner
                            if(!checkForHorizontalWin()
                               && !checkForVerticalWin()
                               && !checkFordiagonalWin()
                               && gameType  == "1Player"){
                                delayTimer.start() // Start the timer after the click
                            }
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
                            // check for a winner
                            if(!checkForHorizontalWin()
                               && !checkForVerticalWin()
                               && !checkFordiagonalWin()
                               && gameType  == "1Player"){
                                delayTimer.start() // Start the timer after the click
                            }
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
                            // check for a winner
                            if(!checkForHorizontalWin()
                               && !checkForVerticalWin()
                               && !checkFordiagonalWin()
                               && gameType  == "1Player"){
                                delayTimer.start() // Start the timer after the click
                            }
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
                            // check for a winner
                            if(!checkForHorizontalWin()
                               && !checkForVerticalWin()
                               && !checkFordiagonalWin()
                               && gameType  == "1Player"){
                                delayTimer.start() // Start the timer after the click
                            }
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
                            // check for a winner
                            if(!checkForHorizontalWin()
                               && !checkForVerticalWin()
                               && !checkFordiagonalWin()
                               && gameType  == "1Player"){
                                delayTimer.start() // Start the timer after the click
                            }
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
                            // check for a winner
                            if(!checkForHorizontalWin()
                               && !checkForVerticalWin()
                               && !checkFordiagonalWin()
                               && gameType  == "1Player"){
                                delayTimer.start() // Start the timer after the click
                            }
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
                            // check for a winner
                            if(!checkForHorizontalWin()
                               && !checkForVerticalWin()
                               && !checkFordiagonalWin()
                               && gameType  == "1Player"){
                                delayTimer.start() // Start the timer after the click
                            }
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

        restBtnTxt: "Rest"
        restBtn.visible: true
        restBtn.onClicked: {
            /*** clear the board ***/

            // Row 1
            //
            row1rect1Img.source = ""
            row1rect2Img.source = ""
            row1rect3Img.source = ""
            // Row 2
            //
            row2rect1Img.source = ""
            row2rect2Img.source = ""
            row2rect3Img.source = ""
            // Row 3
            //
            row3rect1Img.source = ""
            row3rect2Img.source = ""
            row3rect3Img.source = ""

            // Enable the play area
            //
            mainColumn.enabled = true

            // Re-Enable and disabled squares
            //
            row1rect1.enabled = true
            row1rect2.enabled = true
            row1rect3.enabled = true

            row2rect1.enabled = true
            row2rect2.enabled = true
            row2rect3.enabled = true

            row3rect1.enabled = true
            row3rect2.enabled = true
            row3rect3.enabled = true

            // Reset Win Dispaly
            //
            winText.visible       = false
            winVisual.winStrike1  = false
            winVisual.winStrike2  = false
            winVisual.winStrike3  = false
            winVisual.winStrike4  = false
            winVisual.winStrike5  = false
            winVisual.winStrike6  = false
            winVisual.winStrike7  = false
            winVisual.winStrike8  = false

            // Reset the current player
            //
            currentPlayer = 0

        }
    }
}
