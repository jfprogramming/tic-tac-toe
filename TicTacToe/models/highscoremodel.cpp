#include "highscoremodel.h"

highscoreModel::highscoreModel(QObject *parent) : QObject{parent}
{}

QList<int> highscoreModel::highScoreList() const
{
    return m_highScoreList;
}

void highscoreModel::setHighScoreList(const QList<int> &newHighScoreList)
{
    m_highScoreList = newHighScoreList;
}
