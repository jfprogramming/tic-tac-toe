#include "adminplayermodel.h"
#include "controllers.h"
#include <QDebug>


/**
 * \fn AdminPlayerModel::AdminPlayerModel(QObject* parent)
 * \brief Constructs an AdminPlayerModel object.
 * \param parent QObject* The parent object.
 */
AdminPlayerModel::AdminPlayerModel(QObject* parent) : QObject(parent)
{
    qDebug() << __FUNCTION__ << "AdminPlayerModel constructor";
}


/**
 * \fn AdminPlayerModel::onAdminLogin(const QString &username, const QString &password)
 * \brief Authenticates an admin user.
 * \param username const QString& The admin username.
 * \param password const QString& The admin password.
 * \return bool True if authentication is successful, false otherwise.
 */
bool AdminPlayerModel::onAdminLogin(const QString &username, const QString &password){
    qDebug() << __FUNCTION__ << "Admin login...";
    return Controllers::dbManager.authenticateAdmin(username, password);
}


/**
 * \fn AdminPlayerModel::savePlayerToDatabase(const QString &name, const QString &color)
 * \brief Saves a new player to the database.
 * \param name const QString& The player's name.
 * \param color const QString& The player's color.
 */
void AdminPlayerModel::savePlayerToDatabase(const QString &name, const QString &color){
    Controllers::dbManager.createNewPlayer(name, color);
}


/**
 * \fn AdminPlayerModel::lookupPlayer(const QString &name)
 * \brief Looks up a player by name.
 * \param name const QString& The player's name.
 */
void AdminPlayerModel::lookupPlayer(const QString &name) {
    qDebug() << "player lookup...";
    //m_playerData = Controllers::dbManager.getPlayerByName(name);
    emit playerDataChanged();
}


/**
 * \fn AdminPlayerModel::getAllPlayers()
 * \brief Retrieves a list of all players.
 * \return QList<Player> A list of Player objects.
 */
QList<AdminPlayer> AdminPlayerModel::getAllPlayers() {
    qDebug() << __FUNCTION__ << "Retrieving all players...";

    m_allPlayers = Controllers::dbManager.getAllPlayers();
    return m_allPlayers;
}
