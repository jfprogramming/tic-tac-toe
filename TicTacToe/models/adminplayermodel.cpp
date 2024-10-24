#include "adminplayermodel.h"
#include "controllers.h"
#include <QDebug>


/**
 * \fn AdminPlayerModel::AdminPlayerModel(QObject* parent)
 * \brief Constructs an AdminPlayerModel object.
 * \param parent QObject* The parent object.
 */
AdminPlayerModel::AdminPlayerModel(QObject *parent) : QAbstractListModel{parent}
{
    qDebug() << __FUNCTION__ << "AdminPlayerModel constructor";
    m_allPlayers = getAllPlayers();
    qDebug() << "All Players:" << m_allPlayers[0].name;
}


/**
 * \fn int AdminPlayerModel::rowCount(const QModelIndex &parent) const
 * \brief Returns the number of rows in the model.
 * \param parent const QModelIndex& The parent index.
 * \return int The number of rows in the model.
 */
int AdminPlayerModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_allPlayers.count();
}


/**
 * \fn QVariant AdminPlayerModel::data(const QModelIndex &index, int role) const
 * \brief Returns the data stored under the given role for the item referred to by the index.
 * \param index const QModelIndex& The index of the item.
 * \param role int The role of the data.
 * \return QVariant The data stored under the given role.
 */
QVariant AdminPlayerModel::data(const QModelIndex &index, int role) const {
    if (index.row() < 0 || index.row() >= m_allPlayers.count())
        return QVariant();

    const AdminPlayer &player = m_allPlayers[index.row()];
    if (role == IdRole)
        return player.id;
    else if (role == NameRole)
        return player.name;
    else if (role == ColorRole)
        return player.color;
    else if (role == HighScoreRole)
        return player.highScore;

    return QVariant();
}


/**
 * \fn QHash<int, QByteArray> AdminPlayerModel::roleNames() const
 * \brief Returns the names of the roles used in the model.
 * \return QHash<int, QByteArray> A hash of role names.
 */
QHash<int, QByteArray> AdminPlayerModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdRole]        = "id";
    roles[NameRole]      = "name";
    roles[ColorRole]     = "color";
    roles[HighScoreRole] = "highScore";
    return roles;
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
void AdminPlayerModel::updatePlayer(const int playerId, const QString &name, const QString &color){
    qDebug() << __FUNCTION__ << "updating player..." << "playerId:" << playerId << "name:" << name << "color:" << color;
    Controllers::dbManager.updatePlayer(playerId, name, color);
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

    // Clear the existing list
    //
    m_allPlayers.clear();

    m_allPlayers = Controllers::dbManager.getAllPlayers();
    return m_allPlayers;
}
