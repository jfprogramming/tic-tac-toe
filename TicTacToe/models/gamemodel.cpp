#include "gamemodel.h"

/**
 * @brief Constructor for GameModel.
 * @param parent The parent QObject.
 */
GameModel::GameModel(QObject *parent) : QObject(parent){

}

/**
 * @brief Destructor for GameModel.
 */
GameModel::~GameModel(){

}

/**
 * @brief Gets the game type.
 * @return The game type as a QString.
 */
QString GameModel::getGameType() const
{
    return gameType;
}

/**
 * @brief Sets the game type.
 * @param newGameType The new game type as a QString.
 */
void GameModel::setGameType(const QString &newGameType)
{
    gameType = newGameType;
}

/**
 * @brief Gets the name of player 1.
 * @return The name of player 1 as a QString.
 */
QString GameModel::getPlayer1() const
{
    return player1;
}

/**
 * @brief Sets the name of player 1.
 * @param newPlayer1 The new name of player 1 as a QString.
 */
void GameModel::setPlayer1(const QString &newPlayer1)
{
    player1 = newPlayer1;
}

/**
 * @brief Gets the name of player 2.
 * @return The name of player 2 as a QString.
 */
QString GameModel::getPlayer2() const
{
    return player2;
}

/**
 * @brief Sets the name of player 2.
 * @param newPlayer2 The new name of player 2 as a QString.
 */
void GameModel::setPlayer2(const QString &newPlayer2)
{
    player2 = newPlayer2;
}
