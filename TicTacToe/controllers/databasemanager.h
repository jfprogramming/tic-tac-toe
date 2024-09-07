#pragma once

#include "qdebug.h"
#include "qsqldatabase.h"
#include <QThread>
#include <QObject>

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
    bool createNewPlayer(QString &playerName, QString &playerColor);

    // Admin Login
    //
    QString getAdminUsername();
    QString getDecryptedAdminPassword();

    QList<int> getHighScoreList();

public slots:

    Q_INVOKABLE bool authenticateAdmin(const QString &username, const QString &password);
    Q_INVOKABLE void print(){qInfo() << "test***";};


private:
    bool m_isDatabaseInitialized;
    QSqlDatabase *m_db;
};

