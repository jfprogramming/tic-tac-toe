#include "gamelogic.h"
#include <QRandomGenerator>

/**
 * \fn GameLogic::GameLogic
 * \brief Constructor for GameLogic.
 * \param parent The parent QObject.
 */
GameLogic::GameLogic(QObject *parent)
    : QObject{parent}, m_currentPlayer{"Player1"}, m_playerWon{false}, m_catsCradle{false}
{
    // Initialize the ticTacToeBoard with open squares
    m_ticTacToeBoard = {
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
    return m_currentPlayer;
}

/**
 * \fn GameLogic::setCurrentPlayer()
 * \brief Sets the current player.
 * \param newCurrentPlayer The new current player.
 * \return void
 */
void GameLogic::setCurrentPlayer(const QString &newCurrentPlayer)
{
    m_currentPlayer = newCurrentPlayer;
    emit playerChanged();
}

/**
 * \fn GameLogic::getPlayerWon()
 * \brief Gets the player won status.
 * \return boolean - True if a player has won, otherwise false.
 */
bool GameLogic::getPlayerWon() const
{
    return m_playerWon;
}

/**
 * \fn GameLogic::setPlayerWon()
 * \brief Sets the player won status.
 * \param bool won: The new player won status.
 * \return void
 */
void GameLogic::setPlayerWon(bool won)
{
    m_playerWon = won;
    emit playerWonChanged();
}


/**
 * \fn GameLogic::checkPlayerTurn()
 * \brief Checks and switches the player turn.
 * \return void
 */
void GameLogic::checkPlayerTurn()
{
    if(m_currentPlayer == ""){
        m_currentPlayer = "Player1";
    }
    else if (m_currentPlayer == "Player1") {
        m_currentPlayer = "Player2";
    } else {
        m_currentPlayer = "Player1";
    }
    emit playerChanged();
}


/**
 * \fn GameLogic::getGameType()
 * \brief
 * \return QString
 */
QString GameLogic::getGameType() const
{
    return m_gameType;
}


/**
 * \fn GameLogic::setGameType()
 * \brief
 * \return void
 */
void GameLogic::setGameType(const QString &newGameType)
{
    if (m_gameType != newGameType) {
        m_gameType = newGameType;
        emit gameTypeChanged();
    }
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
        if (m_ticTacToeBoard[row + "1"] && m_ticTacToeBoard[row + "2"] && m_ticTacToeBoard[row + "3"]) {
            setPlayerWon(true);
            emit gameWon();
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
        if (m_ticTacToeBoard["A" + col] && m_ticTacToeBoard["B" + col] && m_ticTacToeBoard["C" + col]) {
            setPlayerWon(true);
            emit gameWon();
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
    if ((m_ticTacToeBoard["A1"] && m_ticTacToeBoard["B2"] && m_ticTacToeBoard["C3"]) ||
        (m_ticTacToeBoard["A3"] && m_ticTacToeBoard["B2"] && m_ticTacToeBoard["C1"])) {
        setPlayerWon(true);
        emit gameWon();
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
    for (const auto &cell : m_ticTacToeBoard) {
        if (!cell) {
            allFilled = false;
            break;
        }
    }
    if (allFilled) {
        setCatsCradle(true);
    }
}

/**
 * \fn GameLogic::playerTwoTurn()
 * \brief Handles the turn for player two in one-player mode.
 * \return void
 */
void GameLogic::playerTwoTurn()
{
    if (m_currentPlayer == "Player2") {
        QStringList emptySquares;
        for (auto it = m_ticTacToeBoard.begin(); it != m_ticTacToeBoard.end(); ++it) {
            if (!it.value()) {
                emptySquares.append(it.key());
            }
        }
        if (!emptySquares.isEmpty()) {
            int randomIndex = QRandomGenerator::global()->bounded(emptySquares.size());
            QString selectedSquare = emptySquares[randomIndex];
            m_ticTacToeBoard[selectedSquare] = true;
            checkForHorizontalWin();
            checkForVerticalWin();
            checkForDiagonalWin();
            checkForCatsCradle();
        }
    }
}


/**
 * \fn GameLogic::resetTicTacToeBoard()
 * \brief Resets the game to the initial state.
 * \return void
 */
void GameLogic::resetTicTacToeBoard()
{
    m_ticTacToeBoard = {
        {"A1", false}, {"A2", false}, {"A3", false},
        {"B1", false}, {"B2", false}, {"B3", false},
        {"C1", false}, {"C2", false}, {"C3", false}
    };
    setCurrentPlayer("Player1");
    setPlayerWon(false);
    resetCatsCradle();
}

/**
 * \fn GameLogic::resetPlayerWon()
 * \brief
 * \return void
 */
void GameLogic::resetPlayerWon()
{
    setPlayerWon(false);
}


/**
 * \fn GameLogic::resetGameType()
 * \brief
 * \return void
 */
void GameLogic::resetGameType()
{
    setGameType("");
}

/**
 * \fn GameLogic::getCatsCradle()
 * \brief Returns member variable m_catsCradle.
 * \return bool - m_catsCradle
 */
bool GameLogic::getCatsCradle() const
{
    return m_catsCradle;
}

/**
 * \fn GameLogic::setCatsCradle()
 * \brief Sets the member variable m_catsCradle.
 * \param newCatsCradle The new value for m_catsCradle.
 * \return void
 */
void GameLogic::setCatsCradle(bool newCatsCradle)
{
    if (m_catsCradle == newCatsCradle)
        return;
    m_catsCradle = newCatsCradle;
    emit catsCradleMatch();
}

/**
 * \fn GameLogic::resetCatsCradle()
 * \brief Resets the member variable catsCradle to false.
 * \return void
 */
void GameLogic::resetCatsCradle()
{
    setCatsCradle(false);
}
