#pragma once
#include <QObject>


// Player data structure holds player data
//
struct Player
{
    int id;
    QString name;
    QString color;
    int highScore;
};

/**
 * \file GamePlayModel.h
 *
 * \brief The GamePlayModel class manages player data.
 *        Handles player name and color information.
 *        Provides interface for setting and retrieving player details.
 */
class GamePlayModel : public QObject
{
    Q_OBJECT

    // Player 1 Properties
    //
    Q_PROPERTY(QString player1Name  READ getPlayer1Name  NOTIFY player1NameChanged)
    Q_PROPERTY(QString player1Color READ getPlayer1Color NOTIFY player1ColorChanged)

    // Player 2 Properties
    //
    Q_PROPERTY(QString player2Name  READ getPlayer2Name  NOTIFY player2NameChanged)
    Q_PROPERTY(QString player2Color READ getPlayer2Color NOTIFY player2ColorChanged)

public:
    explicit GamePlayModel(QObject* parent = nullptr);
    ~GamePlayModel();

    // Get Player1 info (name, color)
    //
    QString getPlayer1Name()  const { return m_player1.name; }
    QString getPlayer1Color() const { return m_player1.color; }

    // Get Player1 info (name, color)
    //
    QString getPlayer2Name()  const { return m_player2.name; }
    QString getPlayer2Color() const { return m_player2.color; }

    // Get the player data
    //
    Player getPlayer1() const { return m_player1; }
    Player getPlayer2() const { return m_player2; }

    Q_INVOKABLE QString getPlayerColor(const QString &playerName);

signals:
    void player1NameChanged(const QString &playerName);
    void player1ColorChanged(const QString &playerColor);

    void player2NameChanged(const QString &playerName);
    void player2ColorChanged(const QString &playerColor);

    void player1Changed();
    void player2Changed();

public slots:
    // Set the players chosen for game play
    //
    void setPlayer1(const QString &newPlayer1);
    void setPlayer2(const QString &newPlayer2);

    void updatePlayerHighScoreValue(QString playerName, int score);

private:
    QString m_player1Name;
    QString m_player1Color;

    QString m_player2Name;
    QString m_player2Color;

    Player m_player1;
    Player m_player2;
};
