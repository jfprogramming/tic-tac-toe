#include "playermanger.h"

PlayerManger::PlayerManger(QObject *parent)
    : QObject{parent}
{}

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
