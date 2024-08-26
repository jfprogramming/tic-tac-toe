#pragma once

#include "qdebug.h"
#include "qsqldatabase.h"
#include <QThread>
#include <QObject>

class DatabaseManager : public QThread
{
    Q_OBJECT

public:
    explicit DatabaseManager(QObject *parent = nullptr);
    ~DatabaseManager();

    bool initializeDatabase();
    void performDatabaseOperations();
    void closeDatabase();

    QString getPlayerName(int userId);
    QString getPlayerColor(QString &color);
    QString getUserSelectedOption(int userId);

    bool setPlayerName(int playerId, const QString& newName);
    bool setPlayerColor(int playerId, const QString& color);
    bool createNewPlayer(QString playerName, const QString& playerColor);

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

