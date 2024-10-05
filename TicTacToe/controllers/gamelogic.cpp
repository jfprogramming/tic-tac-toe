#include "gamelogic.h"
#include "controllers.h"

/**
 * \fn    GameLogic::GameLogic
 * \brief Constructor for GameLogic.
 * \param parent The parent QObject.
 */
GameLogic::GameLogic(QObject *parent)
    : QObject{parent}, current_player{"Player1"}, isOnePlayerMode{false}, isTwoPlayerMode{false}
{
}


/**
 * \fn    GameLogic::setCurrent_player
 * \brief Sets the current player.
 * \param newCurrent_player The new current player.
 * \return void
 */
QString GameLogic::getCurrent_player() const
{
    return current_player;
}


/**
 * \fn    GameLogic::setCurrent_player
 * \brief Sets the current player.
 * \param newCurrent_player The new current player.
 * \return void
 */
void GameLogic::setCurrent_player(const QString &newCurrent_player)
{
    current_player = newCurrent_player;
    emit playerChanged(current_player);
}

/**
 * \fn     GameLogic::getIsOnePlayerMode
 * \brief  Checks if the game is in one-player mode.
 * \return True if the game is in one-player mode, false otherwise.
 */
bool GameLogic::getIsOnePlayerMode() const
{
    return isOnePlayerMode;
}

/**
 * \fn    GameLogic::setIsOnePlayerMode
 * \brief Sets the one-player mode.
 * \param newIsOnePlayerMode The new one-player mode status.
 * \return void
 */
void GameLogic::setIsOnePlayerMode(bool newIsOnePlayerMode)
{
    isOnePlayerMode = newIsOnePlayerMode;
}

/**
 * \fn     GameLogic::getIsTwoPlayerMode
 * \brief  Checks if the game is in two-player mode.
 * \return True if the game is in two-player mode, false otherwise.
 */
bool GameLogic::getIsTwoPlayerMode() const
{
    return isTwoPlayerMode;
}


/**
 * \fn    GameLogic::setIsTwoPlayerMode
 * \brief Sets the two-player mode.
 * \param newIsTwoPlayerMode The new two-player mode status.
 */
void GameLogic::setIsTwoPlayerMode(bool newIsTwoPlayerMode)
{
    isTwoPlayerMode = newIsTwoPlayerMode;
}


/**
 * \fn    GameLogic::checkWinner
 * \brief Checks for game winner.
 *        adds 1 to the player's highscore.
 */
void GameLogic::nextTurn()
{
    if (current_player == "Player1")
        setCurrent_player("Player2");
    else
        setCurrent_player("Player1");
}


/**
 * \fn    GameLogic::checkWinner
 * \brief Checks for game winner.
 *        adds 1 to the player's highscore.
 */
void GameLogic::checkWinner()
{
    // Implement your winning logic here
    // If a player wins, emit the gameWon signal

    if (threeiInARow) {
        emit gameWon(current_player);
        // Update high score
        Controllers::dbManager.updatePlayerHighScore(current_player, 1);
    }
}
