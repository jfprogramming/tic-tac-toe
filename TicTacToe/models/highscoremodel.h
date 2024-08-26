#pragma once

#include <QObject>

class highscoreModel : public QObject
{
    Q_OBJECT
public:
    explicit highscoreModel(QObject *parent = nullptr);
    ~highscoreModel();

    QList<int> highScoreList() const;

public slots:
    void setHighScoreList(const QList<int> &newHighScoreList);

signals:
    QList<int> m_highScoreList;
};

