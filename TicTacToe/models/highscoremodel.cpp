#include "highscoremodel.h"
#include "controllers.h"
#include "controllers/databasemanager.h"

/**
 * @brief Constructor for HighscoreModel.
 * @param parent The parent QObject.
 */
HighscoreModel::HighscoreModel(QObject *parent) : QAbstractListModel{parent}
{
    //DatabaseManager dbManager;
    //QList<int> fetchedHighScores = dbManager.getHighScoreList();

    QList<int> fetchedHighScores = Controllers::dbManager.getHighScoreList();
    setHighScoreList(fetchedHighScores);
}

/**
 * @brief Destructor for HighscoreModel.
 */
HighscoreModel::~HighscoreModel(){

}

/**
 * @brief Sets the high score list.
 * @param newHighScoreList The new list of high scores.
 */
void HighscoreModel::setHighScoreList(const QList<int> &newHighScoreList)
{
    beginResetModel();
    m_highScoreList = newHighScoreList;
    endResetModel();
}

/**
 * @brief Returns the number of rows in the model.
 * @param parent The parent QModelIndex.
 * @return The number of rows.
 */
int HighscoreModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0; // No child items
    return m_highScoreList.size();
}

/**
 * @brief  Returns the data for a given index and role.
 * @param  index The QModelIndex.
 * @param  role The role for which data is requested.
 * @return The data as a QVariant.
 */
QVariant HighscoreModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (role == Qt::DisplayRole) {
        // Return the high score value as a QVariant
        return m_highScoreList.at(index.row());
    }

    return QVariant();
}
