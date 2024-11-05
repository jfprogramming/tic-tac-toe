#pragma once

#include "../models/adminplayermodel.h"
#include "../models/gameplaymodel.h"
#include "qdebug.h"
#include "qsqldatabase.h"
#include <QThread>
#include <QObject>
#include <qmutex.h>

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
    void closeDatabase();
    bool isDatabaseOpen();

    // High Score Mngt
    //
    int getPlayerIdByName(const QString &name);
    int getHighScoreForPlayer(int playerId);

    // Player Management
    //
    bool updatePlayer(const int playerId, const QString &playerName, const QString &playerColor);

    Player getPlayerByName(const QString &name);

    Player getPlayerById(const int id);

    QList<AdminPlayer> getAllPlayers();

    // Admin Login
    //
    QString getAdminUsername();
    QString getDecryptedAdminPassword();

    // High Score Mngt
    //
    QList<QPair<QString, int> > getHighScoreList();
    bool setPlayerHighScoreValue(int playerId, int score);

    bool authenticateAdmin(const QString &username, const QString &password);
    bool updatePlayerHighScore(const QString &playerName, int score);

private:
    bool m_isDatabaseInitialized;
    int m_playerId;
    QSqlDatabase *m_db;
    QMutex m_dbLock;
};

