#pragma once

#include <QThread>

class DatabaseController : public QThread
{

public:
    explicit DatabaseController(QObject *parent = nullptr);

    void initializeDatabase();
    void performDatabaseOperations();
    void closeDatabase();

    QString getUserName(int userId);
    int getUserAge(int userId);
    QString getUserSelectedOption(int userId);

    bool setUserName(int userId, const QString& newName);
    bool setUserAge(int userId, const QString& newAge);
    bool setUserSelectedOption(int userId, const QString& newSelectedOption);
    bool createNewUser(QString userName, const QString& newAge);


signals:
};

