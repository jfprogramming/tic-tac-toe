#include "highscoremodel.h"

HighscoreModel::HighscoreModel(QObject *parent) : QAbstractListModel{parent}
{

}

HighscoreModel::~HighscoreModel(){

}


void HighscoreModel::setHighScoreList(const QList<int> &newHighScoreList)
{
    beginResetModel();
    m_highScoreList = newHighScoreList;
    endResetModel();
}

int HighscoreModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0; // No child items
    return m_highScoreList.size();
}

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


