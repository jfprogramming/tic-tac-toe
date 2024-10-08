#include "adminplayermodel.h"
#include "controllers.h"
#include <QDebug>

AdminPlayerModel::AdminPlayerModel(QObject* parent) : QObject(parent)
{
    qDebug() << __FUNCTION__ << "AdminPlayerModel constructor";
}


/**
 * \fn AdminPlayerModel::onAdminLogin(const QString &username, const QString &password){
 * \brief Authenticates an admin user.
 * \param username The admin username.
 * \param password The admin password.
 * \return True if authentication is successful, false otherwise.
 */
bool AdminPlayerModel::onAdminLogin(const QString &username, const QString &password){
    qDebug() << __FUNCTION__ << "Admin login...";

    return Controllers::dbManager.authenticateAdmin(username, password);
}


void AdminPlayerModel::savePlayerToDatabase(const QString &name, const QString &color){
    Controllers::dbManager.createNewPlayer(name, color);
}

void AdminPlayerModel::lookupPlayer(const QString &name) {
    qDebug() << "player lookup...";
    m_playerData = Controllers::dbManager.getPlayerByName(name);
    emit playerDataChanged();
}

/**
 * \fn AdminPlayerModel::getPlayerColor(const QString &playerName)
 * \brief Looks up the player's name and color in the database.
 * \param name The player's name.
 */
QList<Player> AdminPlayerModel::getAllPlayers() {
    QList<Player> playerList;
    auto players = Controllers::dbManager.getAllPlayers();
    for (const auto &player : players) {
        playerList.append(new Player(player["name"], player["color"], player["highscore"]));
    }
    return playerList;
}
