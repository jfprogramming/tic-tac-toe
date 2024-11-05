#include "highscoremodel.h"
#include "controllers.h"
#include "controllers/databasemanager.h"

#define DEBUG


/**
 * \brief Constructor for HighscoreModel.
 * \param parent The parent QObject.
 */
HighscoreModel::HighscoreModel(QObject *parent) : QAbstractListModel{parent}
{
    qInfo() << "HighscoreModel constructor";
    QList<QPair<QString, int>> fetchedHighScores = Controllers::dbManager.getHighScoreList();

#ifdef DEBUG
    qDebug() << "Fetched High Scores:" << fetchedHighScores;
#endif

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
    qInfo() << "Setting High Score List";

    beginResetModel();
    m_highScoreList = newHighScoreList;

#ifdef DEBUG
    qDebug() << "Setting High Score List:" << m_highScoreList;
#endif
  
    endResetModel();
}


/**
 * \brief Returns the number of rows in the model.
 * \param parent The parent QModelIndex.
 * \return The number of rows.
 */
int HighscoreModel::rowCount(const QModelIndex &parent) const
{
    qInfo() << "HighscoreModel rowCount";

    if (parent.isValid())
        return 0; // No child items

#ifdef DEBUG
    qDebug() << "High Score List Size:" << m_highScoreList.size();
#endif

    return m_highScoreList.size();
}


/**
 * \brief  Returns the data for a given index and role.
 * \param  index The QModelIndex.
 * \param  role The role for which data is requested.
 * \return The data as a QVariant.
 */
QVariant HighscoreModel::data(const QModelIndex &index, int role) const {

    qInfo() << "HighscoreModel data";

    if (!index.isValid())
        return QVariant();

    if (!index.isValid() || index.row() >= m_highScoreList.size())
        return QVariant();

    const auto &pair = m_highScoreList.at(index.row());

    switch (role) {
    case PlayerNameRole:
        return pair.first;
    case HighScoreRole:
        return pair.second;
    default:
        return QVariant();
    }
}


/**
 * \brief  Returns the role names.
 * \return The data as a QHash.
 */
QHash<int, QByteArray> HighscoreModel::roleNames() const {
    qInfo() << "HighscoreModel roleNames";

    QHash<int, QByteArray> roles;
    roles[PlayerNameRole] = "playerName";
    roles[HighScoreRole] = "highScore";

#ifdef DEBUG
    qDebug() << "High Score Roles:" << roles;
#endif

    return roles;
}
