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

    Q_PROPERTY(QString player1Name  READ getPlayer1Name  WRITE setPlayer1Name  NOTIFY player1NameChanged)
    Q_PROPERTY(QString player1Color READ getPlayer1Color WRITE setPlayer1Color NOTIFY player1ColorChanged)

    Q_PROPERTY(QString player2Name  READ getPlayer2Name  WRITE setPlayer2Name NOTIFY player2NameChanged)
    Q_PROPERTY(QString player2Color READ getPlayer2Color WRITE setPlayer2Color NOTIFY player2ColorChanged)

public:
    explicit GamePlayModel(QObject* parent = nullptr);

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
    // Slots are used in the game-play view (QML) to set the player names and colors
    //
    void setPlayer1Color(const QString &newPlayerColor);
    void setPlayer1Name(const QString &newPlayerName);

    void setPlayer2Color(const QString &newPlayerColor);
    void setPlayer2Name(const QString &newPlayerName);

    void setPlayer1(const QString &newPlayer1);
    void setPlayer2(const QString &newPlayer2);

    void setPlayerHighScoreValue(QString playerName, int score);

private:
    QString m_player1Name;
    QString m_player1Color;

    QString m_player2Name;
    QString m_player2Color;

    Player m_player1;
    Player m_player2;
};
