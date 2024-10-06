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
    // Initialize the board with empty strings
    board.fill("", 9);
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
    // Implement horizontal win logic
    // If there is a win, call setPlayerWon(true) and emit gameWon(currentPlayer)
}


/**
 * \brief Checks for a vertical win.
 * \fn GameLogic::checkForVerticalWin()
 * \return void
 */
void GameLogic::checkForVerticalWin()
{
    // Implement vertical win logic
    // If there is a win, call setPlayerWon(true) and emit gameWon(currentPlayer)
}


/**
 * \fn GameLogic::checkForDiagonalWin()
 * \brief Checks for a diagonal win.
 * \return void
 */
void GameLogic::checkForDiagonalWin()
{
    // Implement diagonal win logic
    // If there is a win, call setPlayerWon(true) and emit gameWon(currentPlayer)
}


/**
 * \fn GameLogic::checkForCatsCradle()
 * \brief Checks for a tie (CatsCradle).
 * \return void
 */
void GameLogic::checkForCatsCradle()
{
    bool allFilled = true;
    for (const auto &cell : board) {
        if (cell.isEmpty()) {
            allFilled = false;
            break;
        }
    }
    if (allFilled) {
        // Handle the CatsCradle scenario
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
        for (int i = 0; i < board.size(); ++i) {
            if (board[i].isEmpty()) {
                emptySquares.append(i);
            }
        }
        if (!emptySquares.isEmpty()) {
            int randomIndex = QRandomGenerator::global()->bounded(emptySquares.size());
            int selectedSquare = emptySquares[randomIndex];
            board[selectedSquare] = "Player2";
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
    board.fill("");
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
