import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:///onePlayerMode.js" as JavaScript

Item {
    id: playArea
    objectName: "playArea"

    // Defualt player colors for the game | Player 1 is blue and Player 2 is red
    //
    property string player1Color: "#0078D7" //playerModel.getPlayerColor(currentP1)
    property string player2Color: "#FF0000" //playerModel.getPlayerColor(currentP2)

    property int currentPlayer: gameLogic.currentPlayer
    property bool playerWon: false

    property int p1Score: 0
    property int p2Score: 0

    // Icon colors holders - defualt is Grey ("#808080")
    //
    property string r1b1IconColor: "#808080"
    property string r1b2IconColor: "#808080"
    property string r1b3IconColor: "#808080"
    property string r2b1IconColor: "#808080"
    property string r2b2IconColor: "#808080"
    property string r2b3IconColor: "#808080"
    property string r3b1IconColor: "#808080"
    property string r3b2IconColor: "#808080"
    property string r3b3IconColor: "#808080"

    // Set the game type to 1Player or 2Player
    //
    property string gameMode: ""

    // Create an array to store item IDs
    //
    property var itemIds: []
    property var emptyIcons: []

    property alias rowWidth: row1.width
    property alias row1Id: row1
    property alias row1Rect1ImgAlias: row1rect1Btn



    Component.onCompleted: {
        console.log("gameMode:" + gameMode + ", enabled:" + mainColumn.enabled)
        checkPlayerTurn()
        gameMode = gameLogic.gameType
    }


    function getCurrentPlayer() {
        console.log("getCurrentPlayer currentPlayer" + gameLogic.currentPlayer)
        return gameLogic.currentPlayer
    }

    function checkPlayerTurn() {
        console.log("checkPlayerTurn currentPlayer" + gameLogic.currentPlayer)

        gameLogic.checkPlayerTurn()
        currentPlayer = gameLogic.currentPlayer
        console.log("set player turn to: " + currentPlayer)

        if(gameMode == "2Player"){
            nextPlayerPopup.open()
        }
    }

    // Reset logic
    //
    function resetWinStrikes() {
        console.log("resetWinStrikes")
        winVisual.resetWinStrikes()
    }

    function resetBoard() {
        console.log("resetting the game board...")

        // Re-Enable Board Items
        //
        for (const item of itemIds) {
            item.icon.source = ""
            item.parent.enabled = true
        }
        mainColumn.enabled = true

        // Reset the win variable
        //
        playerWon = false

        // Reset C++ objects
        //
        gameLogic.resetCatsCradle()
        gameLogic.resetPlayerWon()
        gameLogic.resetTicTacToeBoard()

        // Reset the current player
        //
        currentPlayer = gameLogic.currentPlayer

        // Reset Win resetWinStrikes
        //
        resetWinStrikes()

        // reset all icon colors back to default grey
        //
        r1b1IconColor = "#808080"
        r1b2IconColor = "#808080"
        r1b3IconColor = "#808080"
        r2b1IconColor = "#808080"
        r2b2IconColor = "#808080"
        r2b3IconColor = "#808080"
        r3b1IconColor = "#808080"
        r3b2IconColor = "#808080"
        r3b3IconColor = "#808080"

        // Reset the icons interacted with by Computer in 1Player mode
        //
        for (const item of itemIds) {
            // Clear the icon source and reset to defualt color grey #808080
            //
            item.icon.source = ""
            item.icon.color  = "#808080"
        }
    }

    function setWinVariables(player) {
        console.log("setWinVariables player: " + player)

        mainColumn.enabled = false
        gameLogic.playerWon = true
        playerWon = true

        var playerColor = currentPlayer == 1 ? player1Color : player2Color
        console.log("playerColor: " + playerColor)

        if (currentPlayer == 1) {
            p1Score++
            playAreaHeader.savePlayerHighScore("Player1", p1Score)
        } else if (currentPlayer == 2) {
            p2Score++
            playAreaHeader.savePlayerHighScore("Player2", p2Score)
        }

        // Show the winning pop up message and reset the game board
        //
        gameWonPopup.open()
    }

    function playerSelectSquare(squareKey) {
        console.log("playerSelectSquare squareKey: " + squareKey)
        gameLogic.setSquareSelected(squareKey)
    }

    function checkForHorizontalWin() {
        console.log("checkForHorizontalWin")

        gameLogic.checkForHorizontalWin()
        if (gameLogic.playerWon) {
            setWinVariables(currentPlayer)
            return true
        }
        return false
    }

    function checkForVerticalWin() {
        console.log("checkForVerticalWin")

        gameLogic.checkForVerticalWin()
        if (gameLogic.playerWon) {
            setWinVariables(currentPlayer)
            return true
        }
        return false
    }

    function checkForDiagonalWin() {
        console.log("checkForDiagonalWin")

        gameLogic.checkForDiagonalWin()
        if (gameLogic.playerWon) {
            setWinVariables(currentPlayer)
            return true
        }
        return false
    }

    function checkForCatsCradle() {
        console.log("checkForCatsCradle")
        gameLogic.checkForCatsCradle()
        if (gameLogic.catsCradle) {
            console.log("CatsCradle! All squares filled without a winner.")
            catsCradlePopup.open() // Show the cats cradle popup
            return true
        }
        console.log("No CatsCradle yet...")
        return false
    }

    function playerTwoTurn() {
        console.log("playerTwoTurn")

        var selectedSquare = null
        const emptySquares = []

        if (gameMode == "1Player" && currentPlayer == 2) {
            for (const item of itemIds) {
                console.log("playerTwoTurn - Item ID:", item.objectName, "Source:", item.icon.source)
                if (item.icon.source == "") {
                    emptySquares.push(item)
                }
            }

            if (emptySquares.length > 0) {
                var randomIndex = Math.floor(Math.random() * emptySquares.length)
                selectedSquare = emptySquares[randomIndex]
                selectedSquare.icon.source = "qrc:///playerTwoIcon.png"
                //selectedSquare.visible = true

                console.log("selectedSquare: " + selectedSquare.objectName)

                // Convert the square select to same naming convention as the C++ std::map object
                //
                var squareKey = ""
                if (selectedSquare.objectName == "row1rect1Btn") {
                    squareKey = "A1"
                } else if (selectedSquare.objectName == "row1rect2Btn") {
                    squareKey = "A2"
                } else if (selectedSquare.objectName == "row1rect3Btn") {
                    squareKey = "A3"
                } else if (selectedSquare.objectName == "row2rect1Btn") {
                    squareKey = "B1"
                } else if (selectedSquare.objectName == "row2rect2Btn") {
                    squareKey = "B2"
                } else if (selectedSquare.objectName == "row2rect3Btn") {
                    squareKey = "B3"
                } else if (selectedSquare.objectName == "row3rect1Btn") {
                    squareKey = "C1"
                } else if (selectedSquare.objectName == "row3rect2Btn") {
                    squareKey = "C2"
                } else if (selectedSquare.objectName == "row3rect3Btn") {
                    squareKey = "C3"
                }
                else{
                    console.log("error computer selection....")
                }

                console.log("squareKey: "+squareKey)

                // set the square selected
                //
                playerSelectSquare(squareKey)

                // set the icon color
                //
                if(selectedSquare.icon.source == "qrc:///playerTwoIcon.png"){
                    console.log("selectedSquare.icon.color "+selectedSquare.icon.color)
                    selectedSquare.icon.color = player2Color
                    console.log("selectedSquare.icon.color "+selectedSquare.icon.color)
                }

                if(!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin()){
                    checkForCatsCradle()
                }
            } else {
                console.log("No empty squares available.")
            }
        } else {
            console.log("not your turn computer... wait your turn!")
            gameLogic.playerTwoTurn()
            checkForHorizontalWin()
            checkForVerticalWin()
            checkForDiagonalWin()
            checkForCatsCradle()
        }

        // If no winner go back to player 1
        //
        if(!playerWon){
            mainColumn.enabled = true
            checkPlayerTurn()
        }
    }

    // Player/User Nofitication Popups
    //
    PopupDialog {
        id: nextPlayerPopup
        modal: true
        popupMsgtxt: "Next turn: Player" + gameLogic.currentPlayer
        onClosed: {
            console.log("Next player popup closed")
            mainColumn.enabled = true
        }
    }

    PopupDialog {
        id: gameWonPopup
        modal: true
        popupMsgtxt: "Player" + gameLogic.currentPlayer + " Won"
        onClosed: {
            console.log("Win popup closed")
            resetBoard()
            checkPlayerTurn()

        }
    }

    PopupDialog {
        id: catsCradlePopup
        modal: true
        width: textItem.paintedWidth + 50
        popupMsgtxtVisible: false
        Text {
            id: textItem
            text: "It's a tie! All squares filled without a winner."
            wrapMode: Text.Wrap
            anchors.centerIn: parent
            font.pointSize: 12
        }
        onClosed: {
            console.log("Cats cradle popup closed")
            resetBoard()
            checkPlayerTurn()

        }
    }

    // Used for 1Player mode to delay the computer player's turn
    //
    Timer {
        id: delayTimer
        interval: 1000 // 1 second
        onTriggered: {
            console.log("timer triggered...")
            playerTwoTurn()
        }
    }

    GameHeader {
        id: playAreaHeader
        scoreAlias.visible: true
        player1Score: p1Score
        player2Score: p2Score
    }

    // Boarder for the game board
    //
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

        Column {
            id: mainColumn
            spacing: 10
            anchors.fill: parent

            // Row 1
            //
            Row {
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
                    Button {
                        id: row1rect1Btn
                        objectName: "row1rect1Btn"
                        icon.source: ""
                        icon.color: r1b1IconColor
                        onBackgroundChanged:  {
                            console.log("color changed")
                        }
                        icon.height: parent.height
                        icon.width: parent.width
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row1rect1Btn)
                        }
                        onClicked: {
                            // Loop through all the squares itemIds and set the icon source and color
                            //
                            for (const item of itemIds) {
                                if(item.objectName == "row1rect1Btn"){
                                    if (item.icon.source == "") {
                                        row1rect1Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                                    }
                                    if (item.icon.color == "" || item.icon.color == "#808080") {
                                        item.icon.color = currentPlayer == 1 ?  player1Color : player2Color
                                    }
                                }
                            }
                            playerSelectSquare("A1")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin() && !checkForCatsCradle()) {
                                if (gameMode == "1Player") {
                                    delayTimer.start()
                                }
                                row1rect1.enabled = false
                                mainColumn.enabled = false
                                checkPlayerTurn()
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
                    Button {
                        id: row1rect2Btn
                        objectName: "row1rect2Btn"
                        icon.source: ""
                        icon.color: r1b2IconColor
                        icon.height: parent.height
                        icon.width: parent.width
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row1rect2Btn)
                        }
                        onClicked: {
                            // Loop through all the squares itemIds and set the icon source and color
                            //
                            for (const item of itemIds) {
                                if(item.objectName == "row1rect2Btn"){
                                    if (item.icon.source == "") {
                                        row1rect2Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                                    }
                                    if (item.icon.color == "" || item.icon.color == "#808080") {
                                        item.icon.color = currentPlayer == 1 ?  player1Color : player2Color
                                    }
                                }
                            }
                            playerSelectSquare("A2")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin() && !checkForCatsCradle()) {
                                if (gameMode == "1Player") {
                                    delayTimer.start()
                                }
                                checkPlayerTurn()
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
                    Button {
                        id: row1rect3Btn
                        objectName: "row1rect3Btn"
                        icon.source: ""
                        icon.color: r1b3IconColor
                        icon.height: parent.height
                        icon.width: parent.width
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row1rect3Btn)
                        }
                        onClicked: {
                            // Loop through all the squares itemIds and set the icon source and color
                            //
                            for (const item of itemIds) {
                                if(item.objectName == "row1rect3Btn"){
                                    if (item.icon.source == "") {
                                        row1rect3Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                                    }
                                    if (item.icon.color == "" || item.icon.color == "#808080") {
                                        item.icon.color = currentPlayer == 1 ?  player1Color : player2Color
                                    }
                                }
                            }
                            playerSelectSquare("A3")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin() && !checkForCatsCradle()) {
                                if (gameMode == "1Player") {
                                    delayTimer.start()
                                }
                                row1rect3.enabled = false
                                mainColumn.enabled = false
                                checkPlayerTurn()
                            }
                        }
                    }
                }
            }

            // Row 2
            //
            Row {
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
                    Button {
                        id: row2rect1Btn
                        objectName: "row2rect1Btn"
                        icon.source: ""
                        icon.color: r2b1IconColor
                        icon.height: parent.height
                        icon.width: parent.width
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row2rect1Btn)
                        }
                        onClicked: {
                            // Loop through all the squares itemIds and set the icon source and color
                            //
                            for (const item of itemIds) {
                                if(item.objectName == "row2rect1Btn"){
                                    if (item.icon.source == "") {
                                        row2rect1Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                                    }
                                    if (item.icon.color == "" || item.icon.color == "#808080") {
                                        item.icon.color = currentPlayer == 1 ?  player1Color : player2Color
                                    }
                                }
                            }
                            playerSelectSquare("B1")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin() && !checkForCatsCradle()) {
                                if (gameMode == "1Player") {
                                    delayTimer.start()
                                }
                                row2rect1.enabled = false
                                mainColumn.enabled = false
                                checkPlayerTurn()
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
                    Button {
                        id: row2rect2Btn
                        objectName: "row2rect2Btn"
                        icon.source: ""
                        icon.color: r2b2IconColor
                        icon.height: parent.height
                        icon.width: parent.width
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row2rect2Btn)
                        }
                        onClicked: {
                            // Loop through all the squares itemIds and set the icon source and color
                            //
                            for (const item of itemIds) {
                                if(item.objectName == "row2rect2Btn"){
                                    if (item.icon.source == "") {
                                        row2rect2Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                                    }
                                    if (item.icon.color == "" || item.icon.color == "#808080") {
                                        item.icon.color = currentPlayer == 1 ?  player1Color : player2Color
                                    }
                                }
                            }
                            playerSelectSquare("B2")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin() && !checkForCatsCradle()) {
                                if (gameMode == "1Player") {
                                    delayTimer.start()
                                }
                                row2rect2.enabled = false
                                mainColumn.enabled = false
                                checkPlayerTurn()
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
                    Button {
                        id: row2rect3Btn
                        objectName: "row2rect3Btn"
                        icon.source: ""
                        icon.color: r2b3IconColor
                        icon.height: parent.height
                        icon.width: parent.width
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row2rect3Btn)
                        }
                        onClicked: {
                            // Loop through all the squares itemIds and set the icon source and color
                            //
                            for (const item of itemIds) {
                                if(item.objectName == "row2rect3Btn"){
                                    if (item.icon.source == "") {
                                        row2rect3Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                                    }
                                    if (item.icon.color == "" || item.icon.color == "#808080") {
                                        item.icon.color = currentPlayer == 1 ?  player1Color : player2Color
                                    }
                                }
                            }
                            playerSelectSquare("B3")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin() && !checkForCatsCradle()) {
                                if (gameMode == "1Player") {
                                    delayTimer.start()
                                }
                                row2rect3.enabled = false
                                mainColumn.enabled = false
                                checkPlayerTurn()
                            }
                        }
                    }
                }
            }

            // Row 3
            //
            Row {
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
                    Button {
                        id: row3rect1Btn
                        objectName: "row3rect1Btn"
                        width: parent.width
                        height: parent.height
                        icon.source: ""
                        icon.color: r3b1IconColor
                        icon.height: parent.height
                        icon.width: parent.width
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row3rect1Btn)
                        }
                        onClicked: {
                            // Loop through all the squares itemIds and set the icon source and color
                            //
                            for (const item of itemIds) {
                                if(item.objectName == "row3rect1Btn"){
                                    if (item.icon.source == "") {
                                        row3rect1Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                                    }
                                    if (item.icon.color == "" || item.icon.color == "#808080") {
                                        item.icon.color = currentPlayer == 1 ?  player1Color : player2Color
                                    }
                                }
                            }
                            playerSelectSquare("C1")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin() && !checkForCatsCradle()) {
                                if (gameMode == "1Player") {
                                    delayTimer.start()
                                }
                                row3rect1.enabled = false
                                mainColumn.enabled = false
                                checkPlayerTurn()
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
                    Button {
                        id: row3rect2Btn
                        objectName: "row3rect2Btn"
                        width: parent.width
                        height: parent.height
                        icon.source: ""
                        icon.color: r3b2IconColor
                        icon.height: parent.height
                        icon.width: parent.width
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row3rect2Btn)
                        }
                        onClicked: {
                            // Loop through all the squares itemIds and set the icon source and color
                            //
                            for (const item of itemIds) {
                                if(item.objectName == "row3rect2Btn"){
                                    if (item.icon.source == "") {
                                        row3rect2Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                                    }
                                    if (item.icon.color == "" || item.icon.color == "#808080") {
                                        item.icon.color = currentPlayer == 1 ?  player1Color : player2Color
                                    }
                                }
                            }
                            playerSelectSquare("C2")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin() && !checkForCatsCradle()) {
                                if (gameMode == "1Player") {
                                    delayTimer.start()
                                }
                                row3rect2.enabled = false
                                mainColumn.enabled = false
                                checkPlayerTurn()
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
                    Button {
                        id: row3rect3Btn
                        objectName: "row3rect3Btn"
                        width: parent.width
                        height: parent.height
                        icon.source: ""
                        icon.color: r3b3IconColor
                        icon.height: parent.height
                        icon.width: parent.width
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row3rect3Btn)
                        }
                        onClicked: {
                            // Loop through all the squares itemIds and set the icon source and color
                            //
                            for (const item of itemIds) {
                                if(item.objectName == "row3rect3Btn"){
                                    if (item.icon.source == "") {
                                        row3rect3Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                                    }
                                    if (item.icon.color == "" || item.icon.color == "#808080") {
                                        item.icon.color = currentPlayer == 1 ?  player1Color : player2Color
                                    }
                                }
                            }
                            playerSelectSquare("C3")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin() && !checkForCatsCradle()) {
                                if (gameMode == "1Player") {
                                    delayTimer.start()
                                }
                                row3rect3.enabled = false
                                mainColumn.enabled = false
                                checkPlayerTurn()
                            }
                        }
                    }
                }
            } // end row3
        } // end column
    } // end rectangle


    // WinStrike Connections
    //
    Connections {
        target: gameLogic
        function onPlayerWonChanged(winType, winLocation) {
            var playerColor = currentPlayer == 1 ? player1Color : player2Color
            if (winType == "horizontal") {
                winVisual.showHorizontalWin(winLocation, playerColor)
            } else if (winType == "vertical") {
                winVisual.showVerticalWin(winLocation, playerColor)
            } else if (winType == "diagonal") {
                winVisual.showDiagonalWin(winLocation, playerColor)
            }
        }
    }

    GameFooter {
        id: playAreaFooter
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
            resetBoard()
            resetWinStrikes()
            checkPlayerTurn()
            gameLogic.resetTicTacToeBoard() // Ensure this line resets the board
        }
        homeBtnTxt: "Back"
        homeIcon: "qrc:///backArrow.png"
        resetBtnTxt: "Reset"
        resetBtn.visible: true
        resetBtn.onClicked: {
            resetBoard()
            resetWinStrikes()
            checkPlayerTurn()
        }
    }
}
