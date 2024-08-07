#pragma once

#include <QThread>

class DatabaseController : public QThread
{

public:
    explicit DatabaseController(QObject *parent = nullptr);

    void initializeDatabase();
    void performDatabaseOperations();
    void closeDatabase();

    QString getPlayerName(int userId);
    QString getPlayerColor(QString &color);
    QString getUserSelectedOption(int userId);

    bool setPlayerName(int playerId, const QString& newName);
    bool setPlayerColor(int playerId, const QString& color);
    bool createNewPlayer(QString playerName, const QString& playerColor);


signals:
};

