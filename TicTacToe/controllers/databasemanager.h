#pragma once

#include "qdebug.h"
#include "qsqldatabase.h"
#include <QThread>
#include <QObject>

/**
 * \file databasemanager.h
 *
 * \brief The DatabaseManager class handles all database operations including initialization,
 *        player management, and admin authentication.
 */
class DatabaseManager : public QObject
{
    Q_OBJECT

public:
    explicit DatabaseManager(QThread* home = NULL, QObject *parent = NULL);
    ~DatabaseManager();

    bool initializeDatabase();
    void performDatabaseOperations();
    void closeDatabase();

    // Player Management
    //
    QString getPlayerName(int userId);
    QString getPlayerColor(QString &color);
    QString getUserSelectedOption(int userId);

    bool setPlayerName(int playerId, QString &newName);
    bool setPlayerColor(int playerId, QString &color);
    bool createNewPlayer(const QString &playerName, const QString &playerColor);
    QMap<QString, QString> getPlayerByName(const QString &name);

    // Admin Login
    //
    QString getAdminUsername();
    QString getDecryptedAdminPassword();

    QList<int> getHighScoreList();

    void fetchPlayerId(const QString &playerName);
    bool setPlayerHighScoreValue(int playerId, int score);

    int playerId() const;

public slots:
    bool authenticateAdmin(const QString &username, const QString &password);

    void setPlayerId(int newPlayerId);

private:
    bool m_isDatabaseInitialized;
    int m_playerId;
    QSqlDatabase *m_db;
};

