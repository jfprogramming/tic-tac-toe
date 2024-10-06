#include "gamelogic.h"
#include <QRandomGenerator>

/**
 * \fn GameLogic::GameLogic
 * \brief Constructor for GameLogic.
 * \param parent The parent QObject.
 */
GameLogic::GameLogic(QObject *parent)
    : QObject{parent}, currentPlayer{"Player1"}, playerWon{false}
{
    // Initialize the ticTacToeBoard with open squares
    ticTacToeBoard = {
        {"A1", false}, {"A2", false}, {"A3", false},
        {"B1", false}, {"B2", false}, {"B3", false},
        {"C1", false}, {"C2", false}, {"C3", false}
    };
}

/**
 * \fn GameLogic::getCurrentPlayer()
 * \brief Gets the current player.
 * \return The current player.
 */
QString GameLogic::getCurrentPlayer() const
{
    return currentPlayer;
}

/**
 * \fn GameLogic::setCurrentPlayer()
 * \brief Sets the current player.
 * \param newCurrentPlayer The new current player.
 * \return void
 */
void GameLogic::setCurrentPlayer(const QString &newCurrentPlayer)
{
    currentPlayer = newCurrentPlayer;
    emit playerChanged(currentPlayer);
}


/**
 * \fn GameLogic::getPlayerWon()
 * \brief Gets the player won status.
 * \return boolean - True if a player has won, otherwise false.
 */
bool GameLogic::getPlayerWon() const
{
    return playerWon;
}


/**
 * \fn GameLogic::setPlayerWon()
 * \brief Sets the player won status.
 * \param bool won: The new player won status.
 * \return void
 */
void GameLogic::setPlayerWon(bool won)
{
    playerWon = won;
    emit playerWonChanged(won);
}


/**
 * \fn GameLogic::checkPlayerTurn()
 * \brief Checks and switches the player turn.
 * \return void
 */
void GameLogic::checkPlayerTurn()
{
    if (currentPlayer == "Player1") {
        currentPlayer = "Player2";
    } else {
        currentPlayer = "Player1";
    }
    emit playerChanged(currentPlayer);
}


/**
 * \fn GameLogic::checkForHorizontalWin()
 * \brief Checks for a horizontal win.
 * \return void
 */
void GameLogic::checkForHorizontalWin()
{
    const QStringList rows = {"A", "B", "C"};
    for (const auto& row : rows) {
        if (ticTacToeBoard[row + "1"] && ticTacToeBoard[row + "2"] && ticTacToeBoard[row + "3"]) {
            setPlayerWon(true);
            emit gameWon(currentPlayer);
            return;
        }
    }
}


/**
 * \brief Checks for a vertical win.
 * \fn GameLogic::checkForVerticalWin()
 * \return void
 */
void GameLogic::checkForVerticalWin()
{
    const QStringList cols = {"1", "2", "3"};
    for (const auto& col : cols) {
        if (ticTacToeBoard["A" + col] && ticTacToeBoard["B" + col] && ticTacToeBoard["C" + col]) {
            setPlayerWon(true);
            emit gameWon(currentPlayer);
            return;
        }
    }
}


/**
 * \fn GameLogic::checkForDiagonalWin()
 * \brief Checks for a diagonal win.
 * \return void
 */
void GameLogic::checkForDiagonalWin()
{
    if ((ticTacToeBoard["A1"] && ticTacToeBoard["B2"] && ticTacToeBoard["C3"]) ||
        (ticTacToeBoard["A3"] && ticTacToeBoard["B2"] && ticTacToeBoard["C1"])) {
        setPlayerWon(true);
        emit gameWon(currentPlayer);
    }
}


/**
 * \fn GameLogic::checkForCatsCradle()
 * \brief Checks for a tie (CatsCradle).
 * \return void
 */
void GameLogic::checkForCatsCradle()
{
    bool allFilled = true;
    for (const auto &cell : ticTacToeBoard) {
        if (cell.isEmpty()) {
            allFilled = false;
            break;
        }
    }
    if (allFilled) {
        emit catsCradleMatch();
    }
}


/**
 * \fn GameLogic::playerTwoIconTurn()
 * \brief Handles the turn for player two in one-player mode.
 * \return void
 */
void GameLogic::playerTwoIconTurn()
{
    if (currentPlayer == "Player2") {
        QVector<int> emptySquares;
        for (int i = 0; i < ticTacToeBoard.size(); ++i) {
            if (ticTacToeBoard[i].isEmpty()) {
                emptySquares.append(i);
            }
        }
        if (!emptySquares.isEmpty()) {
            int randomIndex = QRandomGenerator::global()->bounded(emptySquares.size());
            int selectedSquare = emptySquares[randomIndex];
            ticTacToeBoard[selectedSquare] = "Player2";
            checkForHorizontalWin();
            checkForVerticalWin();
            checkForDiagonalWin();
            checkForCatsCradle();
        }
    }
}


/**
 * \fn GameLogic::resetGame()
 * \brief Resets the game to the initial state.
 * \return void
 */
void GameLogic::resetGame()
{
    ticTacToeBoard.fill("");
    setCurrentPlayer("Player1");
    setPlayerWon(false);
}


/**
 * \fn GameLogic::getCatsCradle()
 * \brief Returns member variable catsCradle.
 * \return bool - catsCradle
 */
bool GameLogic::getCatsCradle() const
{
    return catsCradle;
}


/**
 * \fn GameLogic::setCatsCradle()
 * \brief Returns member variable catsCradle.
 * \return bool
 */
void GameLogic::setCatsCradle(bool newCatsCradle)
{
    if (catsCradle == newCatsCradle)
        return;
    catsCradle = newCatsCradle;
    emit catsCradleChanged();
}


/**
 * \fn GameLogic::resetCatsCradle()
 * \brief Reset member variable catsCradle back to false'
 * \return void
 */
void GameLogic::resetCatsCradle()
{
    setCatsCradle(false);
}
