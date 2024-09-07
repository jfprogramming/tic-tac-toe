#include "gamelogic.h"

/**
 * @fn    GameLogic::GameLogic
 * @brief Constructor for GameLogic.
 * @param parent The parent QObject.
 */
GameLogic::GameLogic(QObject *parent)
    : QObject{parent}
{}


/**
 * @fn     GameLogic::getCurrent_player
 * @brief  Gets the current player.
 * @return The current player as a QString.
 */
QString GameLogic::getCurrent_player() const
{
    return current_player;
}


/**
 * @fn    GameLogic::setCurrent_player
 * @brief Sets the current player.
 * @param newCurrent_player The new current player.
 * @return void
 */
void GameLogic::setCurrent_player(const QString &newCurrent_player)
{
    current_player = newCurrent_player;
}


/**
 * @fn     GameLogic::getIsOnePlayerMode
 * @brief  Checks if the game is in one-player mode.
 * @return True if the game is in one-player mode, false otherwise.
 */
bool GameLogic::getIsOnePlayerMode() const
{
    return isOnePlayerMode;
}

/**
 * @fn    GameLogic::setIsOnePlayerMode
 * @brief Sets the one-player mode.
 * @param newIsOnePlayerMode The new one-player mode status.
 * @return void
 */
void GameLogic::setIsOnePlayerMode(bool newIsOnePlayerMode)
{
    isOnePlayerMode = newIsOnePlayerMode;
}

/**
 * @fn     GameLogic::getIsTwoPlayerMode
 * @brief  Checks if the game is in two-player mode.
 * @return True if the game is in two-player mode, false otherwise.
 */
bool GameLogic::getIsTwoPlayerMode() const
{
    return isTwoPlayerMode;
}


/**
 * @fn    GameLogic::setIsTwoPlayerMode
 * @brief Sets the two-player mode.
 * @param newIsTwoPlayerMode The new two-player mode status.
 */
void GameLogic::setIsTwoPlayerMode(bool newIsTwoPlayerMode)
{
    isTwoPlayerMode = newIsTwoPlayerMode;
}
