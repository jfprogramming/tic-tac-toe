#pragma once

#include <QObject>


/**
 * \file gamelogic.h
 *
 * \brief The GameLogic class manages the core game logic, including player modes and current player state.
 */
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
