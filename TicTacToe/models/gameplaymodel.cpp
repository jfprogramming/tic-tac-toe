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
 * \fn GamePlayModel::setPlayerColor(const QString &newPlayerColor)
 * \brief Sets the player1's color.
 * \param newPlayerColor The new player color.
 */
void GamePlayModel::setPlayer1Color(const QString& newPlayer1Color)
{
    qDebug() << __FUNCTION__ << "setting player1Color...";

    if (m_player1Color == newPlayer1Color)
        return;
    m_player1Color = newPlayer1Color;
    emit player1ColorChanged(m_player1Color);
}


/**
 * \fn GamePlayModel::setPlayerName(const QString &newPlayerName)
 * \brief Sets the player1's name.
 * \param newPlayerName The new player name.
 */
void GamePlayModel::setPlayer1Name(const QString &newPlayer1Name)
{
    qDebug() << __FUNCTION__ << "setting player1Name...";

    if (m_player1Name == newPlayer1Name)
        return;
    m_player1Name = newPlayer1Name;
    emit player1NameChanged(m_player1Name);
}


/**
 * \fn GamePlayModel::setPlayer2Color(const QString &newPlayerColor)
 * \brief Sets the player'2s color.
 * \param newPlayerColor The new player color.
 */
void GamePlayModel::setPlayer2Color(const QString& newPlayer2Color)
{
    qDebug() << __FUNCTION__ << "setting player2Color...";

    if (m_player2Color == newPlayer2Color)
        return;
    m_player2Color = newPlayer2Color;
    emit player2ColorChanged(m_player2Color);
}


/**
 * \fn GamePlayModel::setPlayer2Name(const QString &newPlayerName)
 * \brief Sets the player2's name.
 * \param newPlayerName The new player name.
 */
void GamePlayModel::setPlayer2Name(const QString &newPlayer2Name)
{
    qDebug() << __FUNCTION__ << "setting player2Name...";

    if (m_player2Name == newPlayer2Name)
        return;
    m_player2Name = newPlayer2Name;
    emit player2NameChanged(m_player2Name);
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

    if (m_player1 == trimmedPlayer1)
        return;
    m_player1 = trimmedPlayer1;

    // Look up player by name
    //
    lookupPlayer(m_player1);
    m_player1Id = Controllers::dbManager.getPlayerIdByName(m_player1);
    m_player1Color = getPlayerColor(m_player1);

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

    if (m_player2 == trimmedPlayer2)
        return;
    m_player2 = trimmedPlayer2;

    // Look up player by name
    //
    lookupPlayer(m_player2);
    m_player2Id = Controllers::dbManager.getPlayerIdByName(m_player2);
    m_player2Color = getPlayerColor(m_player2);

    emit player2Changed();
}


/**
 * \fn GamePlayModel::setPlayerHighScoreValue(QString playerName, int score)
 * \brief Sets the player's high score value.
 * \param int score.
 */
void GamePlayModel::setPlayerHighScoreValue(QString playerName, int score)
{
    int playerId = Controllers::dbManager.getPlayerIdByName(playerName);
    int highscore = Controllers::dbManager.getHighScoreForPlayer(playerId);
    int newScore = highscore + score;

    Controllers::dbManager.updatePlayerHighScore(playerName, newScore);
}


/**
 * \fn GamePlayModel::lookupPlayer(const QString &name)
 * \brief Admin Function  - Looks up the player's name and color in the database.
 * \param name The player's name.
 */
void GamePlayModel::lookupPlayer(const QString &name) {
    qDebug() << "player lookup...";
    QMap<QString, QString> player = Controllers::dbManager.getPlayerByName(name);
    if (player.contains("playerName") && player.contains("playerColor")) {
        qDebug() << "Player found...";
        // TOOD come up with new variablse for player look up
        setPlayer1Name(player["playerName"]);
        setPlayer1Color(player["playerColor"]);
    } else {
        setPlayer1Name("DNE");
        setPlayer1Color("DNE");
    }
}


/**
 * \fn GamePlayModel::getPlayerColor(const QString &playerName)
 * \brief Looks up the player's name and color in the database.
 * \param name The player's name.
 */
QString GamePlayModel::getPlayerColor(const QString &playerName) {
    qDebug() << __PRETTY_FUNCTION__ << "playerNumber:" << playerName;
    return Controllers::dbManager.getPlayerColor(playerName);
}
