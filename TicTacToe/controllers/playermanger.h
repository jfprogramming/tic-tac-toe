#pragma once
#include <QThread>
#include <QSharedPointer>
#include "models/playermodel.h"

class PlayerManger : public QThread
{
    Q_OBJECT
public:
    explicit PlayerManger(QThread *parent = nullptr);

    // Player Model Obj
    //
    PlayerModel playerModel;

    QString getPlayerName() const;
    QString getPlayerColor() const;



public slots:
    void setPlayerName(const QString &newPlayerName);
    void setPlayerColor(const QString &newPlayerColor);
    void savePlayer(const QString &playerName, const QString &playerColor);

signals:


private:
    QString playerName;
    QString playerColor;

};
