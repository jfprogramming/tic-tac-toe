#pragma once

#include <QObject>


/**
 * @file GameModel.h
 *
 * @brief The GameModel class manages game data.
 *        Handles game type and player information.
 *        Provides interface for setting and retrieving game details.
 */
class GameModel : public QObject
{
    Q_OBJECT
public:
    GameModel(QObject *parent=nullptr);
    ~GameModel();

    QString getGameType() const;
    QString getPlayer1() const;
    QString getPlayer2() const;

public slots:
    void setGameType(const QString &newGameType);
    void setPlayer1(const QString &newPlayer1);
    void setPlayer2(const QString &newPlayer2);

private:
    QString gameType = "";
    QString player1  = "";
    QString player2  = "";
};
