#include "gamelogic.h"

GameLogic::GameLogic(QObject *parent)
    : QObject{parent}
{}

QString GameLogic::getCurrent_player() const
{
    return current_player;
}

void GameLogic::setCurrent_player(const QString &newCurrent_player)
{
    current_player = newCurrent_player;
}

bool GameLogic::getIsOnePlayerMode() const
{
    return isOnePlayerMode;
}

void GameLogic::setIsOnePlayerMode(bool newIsOnePlayerMode)
{
    isOnePlayerMode = newIsOnePlayerMode;
}

bool GameLogic::getIsTwoPlayerMode() const
{
    return isTwoPlayerMode;
}

void GameLogic::setIsTwoPlayerMode(bool newIsTwoPlayerMode)
{
    isTwoPlayerMode = newIsTwoPlayerMode;
}
