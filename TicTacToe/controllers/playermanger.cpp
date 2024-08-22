#include "playermanger.h"

PlayerManger::PlayerManger(QThread *parent) : QThread{parent}
{
    // Setup connections from player model (M-V-C)
    QObject::connect(&playerModel, &PlayerModel::playerNameChanged, this, &PlayerManger::savePlayer);
}

QString PlayerManger::getPlayerName() const
{
    return playerName;
}

void PlayerManger::setPlayerName(const QString &newPlayerName)
{
    playerName = newPlayerName;
}

QString PlayerManger::getPlayerColor() const
{
    return playerColor;
}

void PlayerManger::setPlayerColor(const QString &newPlayerColor)
{
    playerColor = newPlayerColor;
}

void PlayerManger::savePlayer(const QString &playerName, const QString &playerColor)
{
    // TODO call to database manager to save player info to player table
}
