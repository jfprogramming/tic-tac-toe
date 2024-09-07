#pragma once

#include <QObject>
#include <QAbstractListModel>

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

