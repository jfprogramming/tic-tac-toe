#include "gameplaymodel.h"
#include "controllers.h"
#include <QDebug>


/**
 * \fn GamePlayModel::GamePlayModel(QObject* parent) : QObject(parent)
 * \brief Constructor for GamePlayModel.
 * \param parent The parent QObject.
 */
GamePlayModel::GamePlayModel(QObject* parent) : QObject(parent)
{
    qDebug() << __FUNCTION__ << "PlayerModel constructor";
}





/**
 * \fn GamePlayModel::setPlayer1(const QString &newPlayer1)
 * \brief Sets the first player's name.
 * \param newPlayer1 The new player name.
 */
void GamePlayModel::setPlayer1(const QString &newPlayer1) {
    qDebug() << __FUNCTION__ << "setting player1...";

    QString trimmedPlayer1 = newPlayer1;
    trimmedPlayer1 = trimmedPlayer1.remove(' ');

    if (m_player1.name == trimmedPlayer1)
        return;

    // Look up player by name
    //
    m_player1 = Controllers::dbManager.getPlayerByName(trimmedPlayer1);

    emit player1Changed();
}


/**
 * \fn GamePlayModel::setPlayer2(const QString &newPlayer2)
 * \brief Sets the second player's name.
 * \param newPlayer2 The new player name.
 */
void GamePlayModel::setPlayer2(const QString &newPlayer2)
{
    qDebug() << __FUNCTION__ << "setting player2...";

    QString trimmedPlayer2 = newPlayer2;
    trimmedPlayer2 = trimmedPlayer2.remove(' ');

    if (m_player2.name == trimmedPlayer2)
        return;

    // Look up player by name
    //
    m_player2 = Controllers::dbManager.getPlayerByName(trimmedPlayer2);

    emit player2Changed();
}


/**
 * \fn GamePlayModel::updatePlayerHighScoreValue(QString playerName, int score)
 * \brief Sets the player's high score value.
 * \param int score.
 */
void GamePlayModel::updatePlayerHighScoreValue(QString playerName, int score)
{
    qDebug() << __FUNCTION__ << "setting player high score...";

    Player player = Controllers::dbManager.getPlayerByName(playerName);
    int highscore = Controllers::dbManager.getHighScoreForPlayer(player.id);
    int newScore = highscore + score;

    Controllers::dbManager.updatePlayerHighScore(playerName, newScore);
}



/**
 * \fn GamePlayModel::getPlayerColor(const QString &playerName)
 * \brief Looks up the player's name and color in the database.
 * \param name The player's name.
 */
QString GamePlayModel::getPlayerColor(const QString &playerName) {
    qDebug() << __FUNCTION__ << "playerNumber:" << playerName;

    if(m_player1.name == playerName)
        return m_player1.color;
    else if(m_player2.name == playerName)
        return m_player2.color;
    else{
        qWarning() << __FUNCTION__ << "Error getting player color - Player not found!";
        return "";
    }
}
