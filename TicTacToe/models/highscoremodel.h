#pragma once

#include <QObject>
#include <QAbstractListModel>


/**
 * \file HighscoreModel.h
 *
 * \brief The HighscoreModel class manages the high score data.
 *        Implements the necessary methods for a list model.
 *        Provides interface for setting and retrieving high score details.
 */
class HighscoreModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit HighscoreModel(QObject *parent = nullptr);
    ~HighscoreModel();

    // Implement the necessary methods for a list model
    //
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Set the high score list
    //
    void setHighScoreList(const QList<QPair<QString, int> > &newHighScoreList);

    // Get the player name for a given index
    //
    QVariant playerName(const QModelIndex &index) const;

    // Get the player high score for a given index
    //
    QVariant playerHighScore(const QModelIndex &index) const;

private:
    QList<QPair<QString, int>> m_highScoreList;
};
