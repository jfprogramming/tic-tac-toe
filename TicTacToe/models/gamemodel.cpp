#include "gamemodel.h"

GameModel::GameModel(QObject *parent) : QObject(parent){

}

GameModel::~GameModel(){

}

QString GameModel::getGameType() const
{
    return gameType;
}

void GameModel::setGameType(const QString &newGameType)
{
    gameType = newGameType;
}

QString GameModel::getPlayer1() const
{
    return player1;
}

void GameModel::setPlayer1(const QString &newPlayer1)
{
    player1 = newPlayer1;
}

QString GameModel::getPlayer2() const
{
    return player2;
}

void GameModel::setPlayer2(const QString &newPlayer2)
{
    player2 = newPlayer2;
}
