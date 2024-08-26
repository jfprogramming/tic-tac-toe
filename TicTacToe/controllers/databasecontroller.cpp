#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>
#include <QDateTime>
#include "databasecontroller.h"
#include "cryptclass.h"

DatabaseController::DatabaseController(QObject *parent)
    : QThread(parent)
{
    initializeDatabase();
    this->start();
}

DatabaseController::~DatabaseController(){
    closeDatabase();
    if (isRunning()) {
        quit();
        wait();
    }
}


void DatabaseController::initializeDatabase()
{
    qInfo() << "database initialization...";
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("/data/database/tictactoe.db");
    if (!db.open())
    {
        qDebug() << "Error opening database:" << db.lastError().text();
        // Handle the error (e.g., show an error message)
    }
}


void DatabaseController::closeDatabase()
{
    QSqlDatabase::database().close();
}


QList<int> DatabaseController::getHighScoreList(){
    QList<int> highScores;
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("/data/database/tictactoe.db");

    if (!db.open()) {
        qDebug() << "Error opening database:" << db.lastError().text();
        // Handle the error (e.g., show an error message)
        return highScores;
    }

    QSqlQuery query("SELECT highScore FROM HighScoreTable");
    while (query.next()) {
        highScores.append(query.value(0).toInt());
    }

    qInfo() << "highscore list:" << highScores;

    db.close();
    return highScores;
}


bool DatabaseController::authenticateAdmin(const QString &username, const QString &password) {
    QSqlQuery query;
    QString   adminName;
    QString   adminPassword;

    qInfo() << "Admin Login username:" << username << " Admin password:" << password;

    query.prepare("SELECT * FROM AdminTable WHERE adminName = :adminName");
    query.bindValue(":adminName", username);

    if (query.exec() && query.next()) {
        int count = query.value(0).toInt();

        qInfo() << "Query executed successfully. Record count:" << count;

        adminName     = query.value("adminName").toString();
        adminPassword = query.value("adminPassword").toString();
    } else {
        qWarning() << "Error executing query:" << query.lastError().text();
        return false;
    }

    // Decrypt the password using bcrypt
    //
    QByteArray byteArray      = password.toLatin1();
    const char* charArray     = byteArray.data();
    QString decryptedPassword = CryptClass::bcrypt_checkpw(charArray, password.toUtf8().constData())
                                    ? "admin" // Correct password
                                    : ""; // Incorrect password


    qInfo() << "Decrypted password:" << decryptedPassword;

    if(username == adminName && password == decryptedPassword){
        return true;
    }else{
        return false;
    }
}


void DatabaseController::performDatabaseOperations()
{
    QSqlQuery query;
    if (query.exec("SELECT * FROM PlayerTable"))
    {
        while (query.next())
        {
            QString value = query.value("column_name").toString();
            // Process the retrieved data (e.g., display it or use it in your application)
        }
    }
    else
    {
        qDebug() << "Error executing query:" << query.lastError().text();
        // Handle the query error
    }
}

QString DatabaseController::getPlayerName(int playerId)
{
    QSqlQuery query;
    query.prepare("SELECT palyerName FROM PlayerTable WHERE playerId = :id");
    query.bindValue(":playerId", playerId);
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return ""; // Return an empty string or handle the error
}

QString DatabaseController::getPlayerColor(QString &color)
{
    QSqlQuery query;
    query.prepare("SELECT playerColor FROM PlayerTable WHERE userId = :id");
    query.bindValue(":color", color);
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return ""; // Return an empty string or handle the error
}

QString DatabaseController::getUserSelectedOption(int userId)
{
    QSqlQuery query;
    query.prepare("SELECT userSelectedOption FROM UserTable WHERE userId = :id");
    query.bindValue(":id", userId);
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return ""; // Return an empty string or handle the error
}


bool DatabaseController::setPlayerName(int playerId, const QString& newName)
{
    QSqlQuery query;


    if(playerId == 1){
        //create new player
        createNewPlayer(newName, "N/A");

    }else{
        query.prepare("UPDATE PlayerTable SET playerName = :playerName WHERE playerId = :playerId");
        query.bindValue(":playerName", newName);
        query.bindValue(":playerId", playerId);
    }

    return query.exec();
}


bool DatabaseController::setPlayerColor(int playerId, const QString& color)
{
    QSqlQuery query;

    if(playerId ==1){
        //create new user
        createNewPlayer("N/A", color);
    }else{
        query.prepare("UPDATE UserTable SET userAge = :playerColor WHERE playerId = :playerId");
        query.bindValue(":playerColor", color);
        query.bindValue(":playerId", playerId);
    }

    return query.exec();
}

bool DatabaseController::createNewPlayer(QString playerName, const QString& playerColor)
{
    QSqlQuery query;

    //create new user
    query.prepare("INSERT INTO UserTable (userName, userAge, userOptionSelected, dateTime) VALUES(:userName, :userAge, :userOptionSelected, :dateTime)");
    query.bindValue(":playerName", playerName);
    query.bindValue(":playerColor", playerColor);
    query.bindValue(":dateTime", QDateTime::currentDateTime());

    return query.exec();
}

QString DatabaseController::getAdminUsername()
{
    QSqlQuery query;
    query.prepare("SELECT adminName FROM AdminTable");
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return ""; // Return an empty string or handle the error
}

QString DatabaseController::getDecryptedAdminPassword()
{
    QString decryptedPassword;
    QSqlQuery query;
    query.prepare("SELECT adminPassword FROM AdminTable");
    if (query.exec() && query.next())
    {
        QString encryptedPassword = query.value(0).toString();
        // Decrypt the password using bcrypt (replace "admin" with the actual admin password)
        QString decryptedPassword = CryptClass::bcrypt_checkpw("admin", encryptedPassword.toUtf8().constData())
                                        ? "admin" // Correct password
                                        : ""; // Incorrect password
        return decryptedPassword;
    }
    else
        return ""; // Return an empty string or handle the error
}


