#include "playermanger.h"


/**
 * @fn PlayerManger::PlayerManger
 * @brief Constructor for PlayerManger.
 * @param parent The parent QThread.
 */
PlayerManger::PlayerManger(QThread *parent) : QThread{parent}
{
    // Setup connections from player model
    QObject::connect(&playerModel, &PlayerModel::playerNameChanged, this, &PlayerManger::savePlayer);
}


/**
 * @fn PlayerManger::getPlayerName
 * @brief Gets the player name.
 * @return The player name as a QString.
 */
QString PlayerManger::getPlayerName() const
{
    return playerName;
}


/**
 * @fn PlayerManger::setPlayerName
 * @brief Sets the player name.
 * @param newPlayerName The new player name.
 * @return void
 */
void PlayerManger::setPlayerName(const QString &newPlayerName)
{
    playerName = newPlayerName;
}


/**
 * @fn PlayerManger::getPlayerColor
 * @brief Gets the player color.
 * @return The player color as a QString.
 */
QString PlayerManger::getPlayerColor() const
{
    return playerColor;
}


/**
 * @fn PlayerManger::setPlayerColor
 * @brief Sets the player color.
 * @param newPlayerColor The new player color.
 */
void PlayerManger::setPlayerColor(const QString &newPlayerColor)
{
    playerColor = newPlayerColor;
}


/**
 * @fn PlayerManger::savePlayer
 * @brief Saves the player information.
 * @param playerName The name of the player.
 * @param playerColor The color of the player.
 */
void PlayerManger::savePlayer(const QString &playerName, const QString &playerColor)
{
    // TODO call to database manager to save player info to player table
}
