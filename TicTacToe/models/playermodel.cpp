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
 * \brief Handles form entry for player name and color.
 * \param name The player's name.
 * \param color The player's color.
 */
void PlayerModel::onFormEntry(QString& name, QString& color){
    if (m_playerName != name)
    {
        m_playerName = name;
        emit userNameChanged(name);
    }

    qInfo() << __FUNCTION__ << __LINE__ << "player name:" << name;

    if (m_playerColor != color)
    {
        m_playerColor = color;
        emit userAgeChanged(color);
    }

    qInfo() << __FUNCTION__ << __LINE__ << "player color:" << color;
}

/**
 * \brief Gets the player's color.
 * \return The player's color.
 */
QString PlayerModel::playerColor() const
{
    return m_playerColor;
}

/**
 * \brief Sets the player's color.
 * \param newPlayerColor The new player color.
 */
void PlayerModel::setPlayerColor(QString& newPlayerColor)
{
    if (m_playerColor == newPlayerColor)
        return;
    m_playerColor = newPlayerColor;
    emit playerColorChanged();
}

/**
 * \brief  Gets the player's name.
 * \return The player's name.
 */
QString PlayerModel::playerName() const
{
    return m_playerName;
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
    emit playerNameChanged(m_playerName, m_playerColor);
}

/**
 * \brief Sets the player's high score value.
 * \param int score.
 */
void PlayerModel::setPlayerHighScoreValue(int playerId, int score)
{
    Controllers::dbManager.setPlayerHighScoreValue(playerId, score);
}

/**
 * \brief Saves the player's name and color to the database.
 * \param name The player's name.
 * \param color The player's color.
 */
void PlayerModel::saveToDatabase(QString &name, QString &color){
    Controllers::dbManager.createNewPlayer(name, color);
}
