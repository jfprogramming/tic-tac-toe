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
    void setHighScoreList(const QList<int> &newHighScoreList);;

private:
    QList<int> m_highScoreList;
};

