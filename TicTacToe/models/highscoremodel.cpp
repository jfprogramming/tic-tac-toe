#include "highscoremodel.h"
#include "controllers.h"
#include "controllers/databasemanager.h"


/**
 * \brief Constructor for HighscoreModel.
 * \param parent The parent QObject.
 */
HighscoreModel::HighscoreModel(QObject *parent) : QAbstractListModel{parent}
{
    QList<QPair<QString, int>> fetchedHighScores = Controllers::dbManager.getHighScoreList();
    setHighScoreList(fetchedHighScores);
}


/**
 * \brief Destructor for HighscoreModel.
 */
HighscoreModel::~HighscoreModel(){}

/**
 * \brief Sets the high score list.
 * \param newHighScoreList The new list of high scores.
 */
void HighscoreModel::setHighScoreList(const QList<QPair<QString, int>> &newHighScoreList)
{
    beginResetModel();
    m_highScoreList = newHighScoreList;
    endResetModel();
}


/**
 * \brief Returns the number of rows in the model.
 * \param parent The parent QModelIndex.
 * \return The number of rows.
 */
int HighscoreModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0; // No child items
    return m_highScoreList.size();
}


/**
 * \brief  Returns the data for a given index and role.
 * \param  index The QModelIndex.
 * \param  role The role for which data is requested.
 * \return The data as a QVariant.
 */
QVariant HighscoreModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid())
        return QVariant();

    const auto &entry = m_highScoreList.at(index.row());
    switch (role) {
    case PlayerNameRole:
        return entry.first;
    case HighScoreRole:
        return entry.second;
    default:
        return QVariant();
    }
}


/**
 * \brief  Returns the role names.
 * \return The data as a QHash.
 */
QHash<int, QByteArray> HighscoreModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[PlayerNameRole] = "playerName";
    roles[HighScoreRole] = "highScore";
    return roles;
}

/**
 * \brief Returns the player name for a given index.
 * \param index The QModelIndex.
 * \return The player name as a QVariant.
 */
QVariant HighscoreModel::playerName(const QModelIndex &index) const
{
    if (!index.isValid())
        return QVariant();

    QString playerName = Controllers::dbManager.retrievePlayerName(index.row());

    return playerName;
}


/**
 * \brief Returns the player high score for a given index.
 * \param index The QModelIndex.
 * \return The player high score as a QVariant.
 */
QVariant HighscoreModel::playerHighScore(const QModelIndex &index) const
{
    if (!index.isValid())
        return QVariant();

    return Controllers::dbManager.getHighScoreForPlayer(index.row());
}
