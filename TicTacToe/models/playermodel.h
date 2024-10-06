#pragma once
#include <QObject>

/**
 * \file PlayerModel.h
 *
 * \brief The PlayerModel class manages player data.
 *        Handles player name and color information.
 *        Provides interface for setting and retrieving player details.
 */
class PlayerModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString playerName READ getPlayerName WRITE setPlayerName NOTIFY playerNameChanged)
    Q_PROPERTY(QString playerColor READ getPlayerColor WRITE setPlayerColor NOTIFY playerColorChanged)

    Q_PROPERTY(QString player1 READ getPlayer1 WRITE setPlayer1 NOTIFY player1Changed FINAL)
    Q_PROPERTY(QString player2 READ getPlayer2 WRITE setPlayer2 NOTIFY player2Changed FINAL)


public:
    explicit PlayerModel(QObject* parent = nullptr);

    // Get Player info (name, color)
    //
    QString getPlayerName() const { return m_playerName; }
    QString getPlayerColor() const { return m_playerColor; }

    // Set Game-play player names selected
    //
    QString getPlayer1() const { return m_player1; }
    QString getPlayer2() const { return m_player2; }

    void setPlayerHighScoreValue(int playerId, int score);

signals:
    void playerNameChanged(const QString &playerName);
    void playerColorChanged(const QString &playerColor);

    void player1Changed();
    void player2Changed();

    void checkAdminLogin();

public slots:
    bool onAdminLogin(const QString &username, const QString &password);

    void savePlayerToDatabase(const QString &name, const QString &color);
    void lookupPlayer(const QString &name);

    void setPlayerColor(const QString &newPlayerColor);
    void setPlayerName(const QString &newPlayerName);

    void setPlayer1(const QString &newPlayer1);
    void setPlayer2(const QString &newPlayer2);

private:
    QString m_playerName = "";
    QString m_playerColor = "";

    QString m_player1 = "";
    QString m_player2 = "";
};
