#pragma once

#include <QObject>

class GameLogic : public QObject
{
    Q_OBJECT
public:
    explicit GameLogic(QObject *parent = nullptr);

    QString getCurrent_player() const;
    bool getIsOnePlayerMode() const;
    bool getIsTwoPlayerMode() const;

public slots:
    void setCurrent_player(const QString &newCurrent_player);
    void setIsOnePlayerMode(bool newIsOnePlayerMode);
    void setIsTwoPlayerMode(bool newIsTwoPlayerMode);

signals:

private:
    QString current_player;
    bool isOnePlayerMode;
    bool isTwoPlayerMode;

};
