#pragma once
#include <QObject>

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

    Q_PROPERTY(QString player1 READ getPlayer1 WRITE setPlayer1 NOTIFY player1Changed FINAL)
    Q_PROPERTY(QString player2 READ getPlayer2 WRITE setPlayer2 NOTIFY player2Changed FINAL)


public:
    explicit GamePlayModel(QObject* parent = nullptr);

    // Get Player info (name, color)
    //
    QString getPlayer1Name()  const { return m_player1Name; }
    QString getPlayer1Color() const { return m_player1Color; }

    QString getPlayer2Name()  const { return m_player2Name; }
    QString getPlayer2Color() const { return m_player2Color; }

    // Set Game-play player names selected and color associated with player
    //
    QString getPlayer1() const { return m_player1; }
    QString getPlayer2() const { return m_player2; }

    Q_INVOKABLE QString getPlayerColor(const QString &playerName);

signals:
    void player1NameChanged(const QString &playerName);
    void player1ColorChanged(const QString &playerColor);

    void player2NameChanged(const QString &playerName);
    void player2ColorChanged(const QString &playerColor);

    void player1Changed();
    void player2Changed();

public slots:
    void lookupPlayer(const QString &name);

    void setPlayer1Color(const QString &newPlayerColor);
    void setPlayer1Name(const QString &newPlayerName);

    void setPlayer2Color(const QString &newPlayerColor);
    void setPlayer2Name(const QString &newPlayerName);

    void setPlayer1(const QString &newPlayer1);
    void setPlayer2(const QString &newPlayer2);

    void setPlayerHighScoreValue(QString playerName, int score);

private:
    QString m_player1Name="";
    QString m_player1Color="";

    QString m_player2Name="";
    QString m_player2Color="";

    QString m_player1="";
    QString m_player2="";

    int m_player1Id;
    int m_player2Id;
};
