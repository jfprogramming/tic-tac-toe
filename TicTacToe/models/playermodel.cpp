#include "playermodel.h"
#include "controllers.h"
#include <QDebug>

/**
 * \brief Constructor for PlayerModel.
 * \param parent The parent QObject.
 */
PlayerModel::PlayerModel(QObject* parent) : QObject(parent)
{

}

/**
 * \brief Authenticates an admin user.
 * \param username The admin username.
 * \param password The admin password.
 * \return True if authentication is successful, false otherwise.
 */
bool PlayerModel::onAdminLogin(const QString &username, const QString &password){
    if(Controllers::dbManager.authenticateAdmin(username, password)){
        return true;
    }
    else{
        return false;
    }
}


/**
 * \brief Sets the player's color.
 * \param newPlayerColor The new player color.
 */
void PlayerModel::setPlayerColor(const QString& newPlayerColor)
{
    if (m_playerColor == newPlayerColor)
        return;
    m_playerColor = newPlayerColor;
    emit playerColorChanged(m_playerColor);
}


/**
 * \brief Sets the player's name.
 * \param newPlayerName The new player name.
 */
void PlayerModel::setPlayerName(const QString &newPlayerName)
{
    if (m_playerName == newPlayerName)
        return;
    m_playerName = newPlayerName;
    emit playerNameChanged(m_playerName);
}


/**
 * \brief Sets the first player's name.
 * \param newPlayer1 The new player name.
 */
void PlayerModel::setPlayer1(const QString &newPlayer1) {
    qDebug() << __FUNCTION__ << "setting player1...";
    QString trimmedPlayer1 = newPlayer1;
    trimmedPlayer1 = trimmedPlayer1.remove(' ');

    if (m_player1 == trimmedPlayer1)
        return;
    m_player1 = trimmedPlayer1;
    emit player1Changed();

    // Look up player by name and set highscore
    lookupPlayer(m_player1);
    m_player1Id = Controllers::dbManager.getPlayerIdByName(m_player1);

    emit player1Changed();
}

/**
 * \brief Sets the second player's name.
 * \param newPlayer2 The new player name.
 */
void PlayerModel::setPlayer2(const QString &newPlayer2)
{
    qDebug() << __FUNCTION__ << "setting player2...";

    QString trimmedPlayer2 = newPlayer2;
    trimmedPlayer2 = trimmedPlayer2.remove(' ');

    if (m_player2 == trimmedPlayer2)
        return;
    m_player2 = trimmedPlayer2;
    emit player1Changed();

    // Look up player by name and set highscore
    lookupPlayer(m_player2);
    m_player2Id = Controllers::dbManager.getPlayerIdByName(m_player2);

    emit player2Changed();
}


/**
 * \brief Sets the player's high score value.
 * \param int score.
 */
void PlayerModel::setPlayerHighScoreValue(QString playerName, int score)
{
    int playerId = Controllers::dbManager.getPlayerIdByName(playerName);
    int highscore = Controllers::dbManager.getHighScoreForPlayer(playerId);
    int newScore = highscore + score;

    Controllers::dbManager.updatePlayerHighScore(playerName, newScore);
}

/**
 * \brief Saves the player's name and color to the database.
 * \param name The player's name.
 * \param color The player's color.
 */
void PlayerModel::savePlayerToDatabase(const QString &name, const QString &color){
    Controllers::dbManager.createNewPlayer(name, color);
}


/**
 * \brief Looks up the player's name and color in the database.
 * \param name The player's name.
 */
void PlayerModel::lookupPlayer(const QString &name) {
    qDebug() << "player lookup...";
    QMap<QString, QString> player = Controllers::dbManager.getPlayerByName(name);
    if (player.contains("playerName") && player.contains("playerColor")) {
        qDebug() << "Player found...";
        setPlayerName(player["playerName"]);
        setPlayerColor(player["playerColor"]);
    } else {
        setPlayerName("DNE");
        setPlayerColor("DNE");
    }
}
