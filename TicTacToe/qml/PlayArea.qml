import QtQuick
import QtQuick.Controls
import "qrc:///onePlayerMode.js" as JavaScript

Item {
    id: playArea
    objectName: "playArea"

    property string player1: "player1"
    property string player2: "player2"

    property int currentPlayer: 0
    property bool playerWon: false

    property int p1Score: 0
    property int p2Score: 0

    // Set the game type to 1Player or 2Player
    property string gameMode: ""

    // Create an array to store item IDs
    property var itemIds: []
    property var emptyImgs: []

    property alias rowWidth: row1.width
    property alias row1Id: row1
    property alias row1Rect1ImgAlias: row1rect1Btn

    function update(){
        gameMode = gameLogic.gameType
        playerWon = gameLogic.playerWon
        currentPlayer = getCurrentPlayer()
    }

    onVisibleChanged: {
        console.log("playArea visibility:", visible)
        if(visible){
            update()
        }
    }

    Component.onCompleted: {
        update()
        console.log("gameMode:" + gameMode)
        checkPlayerTurn()
    }

    function resetBoard() {
        console.log("resetting the game board...")

        // Re-Enable Board Items
        for (const item of itemIds) {
            item.icon.source = ""
            item.visible = false
            item.enabled = true
        }
        mainColumn.enabled = true

        // Reset the current player
        currentPlayer = 1

        // Reset the win variable
        playerWon = false

        // Reset C++ objects
        gameLogic.resetCatsCradle()
        gameLogic.resetPlayerWon()
        gameLogic.resetTicTacToeBoard()
    }

    PopupMsg {
        id: nextPlayerPopup
        modal: true
        popupMsgtxt: "Next turn: Player" + gameLogic.currentPlayer
        onClosed: {
            console.log("Next player popup closed")
            mainColumn.enabled = true
        }
    }

    PopupMsg {
        id: gameWonPopup
        modal: true
        popupMsgtxt: "Player" + gameLogic.currentPlayer + " Won"
        onClosed: {
            console.log("Win popup closed")
            resetBoard()
        }
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

    function setWinVariables(player) {
        console.log("setWinVariables player: " + player)

        mainColumn.enabled = false
        gameLogic.playerWon = true
        playerWon = true

        if(currentPlayer == 1){
            p1Score++
            playerModel.player1Score = p1Score
            playAreaHeader.savePlayerHighScore("Player1", p1Score)
        } else if(currentPlayer == 2){
            p2Score++
            playerModel.player2Score = p2Score
            playAreaHeader.savePlayerHighScore("Player2", p2Score)
        }

        gameWonPopup.open()
    }

    function playerSelectSquare(squareKey) {
        gameLogic.setSquareSelected(squareKey)
    }

    function checkForHorizontalWin() {
        console.log("checkForHorizontalWin")

        gameLogic.checkForHorizontalWin()
        if (gameLogic.playerWon) {
            setWinVariables(gameLogic.currentPlayer)
            return true
        }
        return false
    }

    function checkForVerticalWin() {
        console.log("checkForVerticalWin")

        gameLogic.checkForVerticalWin()
        if (gameLogic.playerWon) {
            setWinVariables(gameLogic.currentPlayer)
            return true
        }
        return false
    }

    function checkForDiagonalWin() {
        console.log("checkForDiagonalWin")

        gameLogic.checkForDiagonalWin()
        if (gameLogic.playerWon) {
            setWinVariables(gameLogic.currentPlayer)
            return true
        }
        return false
    }

    function checkForCatsCradle() {
        console.log("checkForCatsCradle")
        gameLogic.checkForCatsCradle()
        if (gameLogic.catsCradle) {
            console.log("CatsCradle! All squares filled without a winner.")
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
                console.log("Item ID:", item.objectName, "Source:", item.icon.source)
                if (item.icon.source == "") {
                    emptySquares.push(item)
                }
            }

            if (emptySquares.length > 0) {
                var randomIndex = Math.floor(Math.random() * emptySquares.length)
                selectedSquare = emptySquares[randomIndex]
                selectedSquare.icon.source = "qrc:///playerTwoIcon.png"
                selectedSquare.visible = true

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

        if(!playerWon){ mainColumn.enabled = true }
        checkPlayerTurn()
    }

    Timer {
        id: delayTimer
        interval: 1000 // 1 second
        onTriggered: {
            console.log("timer triggered...")
            playerTwoTurn()
        }
    }

    Header {
        id: playAreaHeader
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

        Column {
            id: mainColumn
            spacing: 10
            anchors.fill: parent

            // Row 1
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
                        icon.source: ""
                        icon.color: "#0078D4"
                        visible: false
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row1rect1Btn)
                        }
                        onClicked: {
                            row1rect1Btn.visible = true
                            row1rect1Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                            playerSelectSquare("A1")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin()) {
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
                        icon.source: ""
                        icon.color: "#0078D4"
                        visible: false
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row1rect2Btn)
                        }
                        onClicked: {
                            row1rect2Btn.visible = true
                            row1rect2Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                            playerSelectSquare("A2")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin()) {
                                if (gameMode == "1Player") {
                                    delayTimer.start()
                                }
                                row1rect2.enabled = false
                                mainColumn.enabled = false
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
                        icon.source: ""
                        icon.color: "#0078D4"
                        visible: false
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row1rect3Btn)
                        }
                        onClicked: {
                            row1rect3Btn.visible = true
                            row1rect3Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                            playerSelectSquare("A3")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin()) {
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
                        icon.source: ""
                        icon.color: "#0078D4"
                        visible: false
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row2rect1Btn)
                        }
                        onClicked: {
                            row2rect1Btn.visible = true
                            row2rect1Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                            playerSelectSquare("B1")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin()) {
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
                        icon.source: ""
                        icon.color: "#0078D4"
                        visible: false
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row2rect2Btn)
                        }
                        onClicked: {
                            row2rect2Btn.visible = true
                            row2rect2Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                            playerSelectSquare("B2")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin()) {
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
                        icon.source: ""
                        icon.color: "#0078D4"
                        visible: false
                        anchors.fill: parent
                        Component.onCompleted: {
                            itemIds.push(row2rect3Btn)
                        }
                        onClicked: {
                            row2rect3Btn.visible = true
                            row2rect3Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                            playerSelectSquare("B3")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin()) {
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
                        width: parent.width
                        height: parent.height
                        icon.source: ""
                        visible: false
                        onClicked: {
                            row3rect1Btn.icon.visible = true
                            row3rect1Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                            playerSelectSquare("C1")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin()) {
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
                        width: parent.width
                        height: parent.height
                        icon.source: ""
                        visible: false
                        onClicked: {
                            row3rect2Btn.icon.visible = true
                            row3rect2Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                            playerSelectSquare("C2")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin()) {
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
                        width: parent.width
                        height: parent.height
                        icon.source: ""
                        visible: false
                        onClicked: {
                            row3rect3Btn.icon.visible = true
                            row3rect3Btn.icon.source = currentPlayer == 1 ? "qrc:///playerOneIcon.png" : "qrc:///playerTwoIcon.png"
                            playerSelectSquare("C3")
                            if (!checkForHorizontalWin() && !checkForVerticalWin() && !checkForDiagonalWin()) {
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

    Footer {
        id: playAreaFooter
        homeBtn.onClicked: {
            stackView.pop()
        }
        homeBtnTxt: "Back"
        resetBtnTxt: "Reset"
        resetBtn.visible: true
        resetBtn.onClicked: {
            resetBoard()
        }
    }
}
