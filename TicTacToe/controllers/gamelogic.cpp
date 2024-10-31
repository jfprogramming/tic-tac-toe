#include "gamelogic.h"
#include "qdebug.h"
#include <QRandomGenerator>

#define DEBUG

/**
 * \fn GameLogic::GameLogic
 * \brief Constructor for GameLogic.
 * \param parent The parent QObject.
 */
GameLogic::GameLogic(QThread* home, QObject* parent)
    : QObject{parent}, m_currentPlayer{0}, m_playerWon{false}, m_catsCradle{false}, m_gameType{""}
{
    qDebug() << __FUNCTION__ << "GameLogic constructor";

    // Initialize the ticTacToeBoard with open squares
    //
    m_ticTacToeBoard = {
        {"A1", ' '}, {"A2", ' '}, {"A3", ' '},
        {"B1", ' '}, {"B2", ' '}, {"B3", ' '},
        {"C1", ' '}, {"C2", ' '}, {"C3", ' '}
    };
}


/**
 * \fn GameLogic::GameLogic
 * \brief Destructor for GameLogic.
 */
GameLogic::~GameLogic()
{
    qDebug() << __FUNCTION__ << "GameLogic destructor";
}


//
// Setter and Getter functions
//


/**
 * \fn GameLogic::getCurrentPlayer()
 * \brief Gets the current player.
 * \return The current player.
 */
int GameLogic::getCurrentPlayer() const
{
    qDebug() << __FUNCTION__ << "current player:" << m_currentPlayer;

    return m_currentPlayer;
}


/**
 * \fn GameLogic::setCurrentPlayer()
 * \brief Sets the current player.
 * \param newCurrentPlayer The new current player.
 * \return void
 */
void GameLogic::setCurrentPlayer(int newCurrentPlayer)
{
    qDebug() << __FUNCTION__ << "current player:" << m_currentPlayer << "new player:" << newCurrentPlayer;

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
    qDebug() << __FUNCTION__ << "get player won:" << m_playerWon;

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
    qDebug() << __FUNCTION__ << "player: " << m_currentPlayer << " won:" << won;

    m_playerWon = won;
}


/**
 * \fn GameLogic::getGameType()
 * \brief
 * \return QString
 */
QString GameLogic::getGameType() const
{
    qDebug() << __FUNCTION__ << "game type:" << m_gameType;

    return m_gameType;
}


/**
 * \fn GameLogic::setGameType()
 * \brief
 * \return void
 */
void GameLogic::setGameType(const QString &newGameType)
{
    qDebug() << __FUNCTION__ << "1 - new game type: " << newGameType;

    if (m_gameType != newGameType) {
        m_gameType = newGameType;
        emit gameTypeChanged();
        qDebug() << "2 - setGameType new game type: " << m_gameType;
    }
}

/**
 * \fn GameLogic::getCatsCradle()
 * \brief Returns member variable m_catsCradle.
 * \return bool - m_catsCradle
 */
bool GameLogic::getCatsCradle() const
{
    qDebug() << __FUNCTION__ << "cats cradle:" << m_catsCradle;

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
    qDebug() << __FUNCTION__ << "cats cradle:" << m_catsCradle << "new cats cradle:" << newCatsCradle;

    if (m_catsCradle == newCatsCradle)
        return;
    m_catsCradle = newCatsCradle;
    emit catsCradleMatch();
}


//
// Q_INVOKABLE functions
//


/**
 * \fn GameLogic::setSquareSelected()
 * \brief
 * \return void
 */
void GameLogic::setSquareSelected(const QString &square) {
    if (m_ticTacToeBoard.contains(square)) {
        m_ticTacToeBoard[square] = m_currentPlayer == 1 ? 'X' : 'O';
    }
#ifdef DEBUG
    qDebug() << __FUNCTION__ << "Square selected:" << square << "Player:" << m_currentPlayer;
    printGameBoard();
#endif
}


/**
 * \fn GameLogic::checkPlayerTurn()
 * \brief Checks and switches the player turn.
 * \return void
 */
void GameLogic::checkPlayerTurn()
{
    qDebug() << __FUNCTION__ << "Checking player turn" << m_currentPlayer;

    if(m_currentPlayer == 0){
        m_currentPlayer = 1;
    }
    else if (m_currentPlayer == 1) {
        m_currentPlayer = 2;
    }
    else if (m_currentPlayer == 2) {
        m_currentPlayer = 1;
    }
    else{
        qWarning() << "Invalid player";
    }
    emit playerChanged();
}


/**
 * \fn GameLogic::printGameBoard()
 * \brief Prints out current game board.
 * \return void
 */
void GameLogic::printGameBoard(){
    //print out gameboard in 3x3 format
    qDebug() << "Game Board:";
    qDebug() << "|-----------------|";
    qDebug() << "| " << m_ticTacToeBoard["A1"] << " | " << m_ticTacToeBoard["A2"] << " | " << m_ticTacToeBoard["A3"] << " |";
    qDebug() << "|-----------------|";
    qDebug() << "| " << m_ticTacToeBoard["B1"] << " | " << m_ticTacToeBoard["B2"] << " | " << m_ticTacToeBoard["B3"] << " |";
    qDebug() << "|-----------------|";
    qDebug() << "| " << m_ticTacToeBoard["C1"] << " | " << m_ticTacToeBoard["C2"] << " | " << m_ticTacToeBoard["C3"] << " |";
    qDebug() << "|-----------------|";
}


/**
 * \fn GameLogic::checkForHorizontalWin()
 * \brief Checks for a horizontal win.
 * \return void
 */
void GameLogic::checkForHorizontalWin()
{
    qDebug() << __FUNCTION__ << "Checking for Horizontal Win";

#ifdef DEBUG
    printGameBoard();
#endif

    const QStringList rows = {"A", "B", "C"};
    for (const auto& row : rows) {
        if (m_ticTacToeBoard[row + "1"] != ' ' &&
            m_ticTacToeBoard[row + "1"] == m_ticTacToeBoard[row + "2"] &&
            m_ticTacToeBoard[row + "2"] == m_ticTacToeBoard[row + "3"]) {
            qDebug() << __FUNCTION__ << "player won:" << m_currentPlayer;
            setPlayerWon(true);
            // Emit winType (Row = horizontal) that won and strike that won (Row: A, B, C)
            //
            emit playerWonChanged("horizontal", row);
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
    qDebug() << __FUNCTION__ << "Checking for Vertical Win";

    const QStringList cols = {"1", "2", "3"};
    for (const auto& col : cols) {
        if (m_ticTacToeBoard["A" + col] != ' ' &&
            m_ticTacToeBoard["A" + col] == m_ticTacToeBoard["B" + col] &&
            m_ticTacToeBoard["B" + col] == m_ticTacToeBoard["C" + col]) {
            qDebug() << __FUNCTION__ << "player won:" << m_currentPlayer;
            setPlayerWon(true);
            // Emit winType (Column = vertical) that won and strike that won (Column: 1, 2, 3)
            //
            emit playerWonChanged("vertical", col);  // Emit column (1, 2, or 3)
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
    qDebug() << __FUNCTION__ << "Checking for Diagonal Win";

    if (m_ticTacToeBoard["A1"] != ' ' && m_ticTacToeBoard["A1"] == m_ticTacToeBoard["B2"] && m_ticTacToeBoard["B2"] == m_ticTacToeBoard["C3"]) {
        setPlayerWon(true);
        // Emit winType (Diagonal = A1, B2, C3) that won and strike that won (Diagonal: 1)
        //
        emit playerWonChanged("diagonal", "1");
        return;
    } else if (m_ticTacToeBoard["A3"] != ' ' && m_ticTacToeBoard["A3"] == m_ticTacToeBoard["B2"] && m_ticTacToeBoard["B2"] == m_ticTacToeBoard["C1"]) {
        setPlayerWon(true);
        // Emit winType (Diagonal = A3, B2, C1) that won and strike that won (Diagonal: 2)
        //
        emit playerWonChanged("diagonal", "2");
        return;
    }
}


/**
 * \fn GameLogic::checkForCatsCradle()
 * \brief Checks for a tie (CatsCradle).
 * \return void
 */
/**
 * \fn GameLogic::checkForCatsCradle()
 * \brief Checks for a tie (CatsCradle).
 * \return void
 */
void GameLogic::checkForCatsCradle()
{
    qDebug() << __FUNCTION__ << "Checking for Cats Cradle";

    bool allFilled = true;
    for (const auto &cell : m_ticTacToeBoard) {
        if (cell.second == ' ') {
            allFilled = false;
            break;
        }
    }
    if (allFilled) {
        setCatsCradle(true);

        // Emit signal for UI to open the cats-cradle popup
        //
        emit catsCradleMatch();
    } else {
        qDebug() << __FUNCTION__ << "Cats Cradle not found";
    }
}


/**
 * \fn GameLogic::playerTwoTurn()
 * \brief Handles the turn for player two in one-player mode.
 * \return void
 */
void GameLogic::playerTwoTurn()
{
    qDebug() << __FUNCTION__ << "Player two turn";

    if (m_currentPlayer == 2) {
        QStringList emptySquares;
        for (auto it = m_ticTacToeBoard.begin(); it != m_ticTacToeBoard.end(); ++it) {
            if (it->second == ' ') {
                emptySquares.append(it->first);
            }
        }
        if (!emptySquares.isEmpty()) {
            int randomIndex = QRandomGenerator::global()->bounded(emptySquares.size());
            QString selectedSquare = emptySquares[randomIndex];
            m_ticTacToeBoard[selectedSquare] = 'O'; // Assuming 'O' for player 2
            checkForHorizontalWin();
            checkForVerticalWin();
            checkForDiagonalWin();
            checkForCatsCradle();
        }
    }
}


//
// Q_INVOKABLE RESET functions
//


/**
 * \fn GameLogic::resetTicTacToeBoard()
 * \brief Resets the game to the initial state.
 * \return void
 */
void GameLogic::resetTicTacToeBoard()
{
    qDebug() << __FUNCTION__ << "Resetting Tic Tac Toe Board";

    // Reset the ticTacToeBoard with open squares
    //
    m_ticTacToeBoard = {
        {"A1", ' '}, {"A2", ' '}, {"A3", ' '},
        {"B1", ' '}, {"B2", ' '}, {"B3", ' '},
        {"C1", ' '}, {"C2", ' '}, {"C3", ' '}
    };

    setCurrentPlayer(0);
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
    qDebug() << __FUNCTION__ << "Resetting player won";

    setPlayerWon(false);
}


/**
 * \fn GameLogic::resetGameType()
 * \brief
 * \return void
 */
void GameLogic::resetGameType()
{
    qDebug() << __FUNCTION__ << "Resetting game type";

    setGameType("");
}


/**
 * \fn GameLogic::resetCatsCradle()
 * \brief Resets the member variable catsCradle to false.
 * \return void
 */
void GameLogic::resetCatsCradle()
{
    qDebug() << __FUNCTION__ << "Resetting Cats Cradle";

    setCatsCradle(false);
}
