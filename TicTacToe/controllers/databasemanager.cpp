#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>
#include <QDateTime>
#include "databasemanager.h"
#include "cryptclass.h"

DatabaseManager::DatabaseManager(QThread* home, QObject* parent) : QObject(parent)
{
    m_isDatabaseInitialized = false;
}

DatabaseManager::~DatabaseManager(){
    closeDatabase();
}


bool DatabaseManager::initializeDatabase()
{
    qInfo() << "database initialization...";

    if (m_isDatabaseInitialized) {
        //Database already initialized, no need to proceed
        return true;
    }

    m_db  = new QSqlDatabase();
    *m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db->setDatabaseName("/data/database/tictactoe.db");

    if (!m_db->open()) {
        qDebug() << "Error opening database:" << m_db->lastError().text();
        // Handle the error (e.g., show an error message)
        return false;
    } else {
        // Set the flag to true after successful initialization
        //m_isDatabaseInitialized = true;
        return true;
    }
}


void DatabaseManager::closeDatabase()
{
    m_isDatabaseInitialized = false;
    QSqlDatabase::database().close();
}


QList<int> DatabaseManager::getHighScoreList(){
    QList<int> highScores;

    QSqlQuery query("SELECT highScore FROM HighScoreTable");
    while (query.next()) {
        highScores.append(query.value(0).toInt());
    }

    qInfo() << "highscore list:" << highScores;
    return highScores;
}

QString DatabaseManager::getAdminUsername()
{
    QSqlQuery query;
    query.prepare("SELECT adminName FROM AdminTable");
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return ""; // Return an empty string or handle the error
}


QString DatabaseManager::getDecryptedAdminPassword()
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


bool DatabaseManager::authenticateAdmin(const QString &username, const QString &password) {
    QSqlQuery query;
    QString   adminName;
    QString   adminPassword;

    qInfo() << "Admin Login username:" << username << " Admin password:" << password;

    query.prepare("SELECT * FROM AdminTable WHERE adminName = :adminName");
    query.bindValue(":adminName", username);

    qInfo() << "Query:" << &query;

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


void DatabaseManager::performDatabaseOperations()
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


QString DatabaseManager::getPlayerName(int playerId)
{
    QSqlQuery query;
    query.prepare("SELECT palyerName FROM PlayerTable WHERE playerId = :id");
    query.bindValue(":playerId", playerId);
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return ""; // Return an empty string or handle the error
}


QString DatabaseManager::getPlayerColor(QString &color)
{
    QSqlQuery query;
    query.prepare("SELECT playerColor FROM PlayerTable WHERE userId = :id");
    query.bindValue(":color", color);
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return ""; // Return an empty string or handle the error
}


QString DatabaseManager::getUserSelectedOption(int userId)
{
    QSqlQuery query;
    query.prepare("SELECT userSelectedOption FROM UserTable WHERE userId = :id");
    query.bindValue(":id", userId);
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return ""; // Return an empty string or handle the error
}


bool DatabaseManager::setPlayerName(int playerId, QString &newName)
{
    QSqlQuery query;


    if(playerId == 1){
        //create new player
        QString na = "N/A";
        createNewPlayer(newName, na);

    }else{
        query.prepare("UPDATE PlayerTable SET playerName = :playerName WHERE playerId = :playerId");
        query.bindValue(":playerName", newName);
        query.bindValue(":playerId", playerId);
    }

    return query.exec();
}


bool DatabaseManager::setPlayerColor(int playerId, QString &color)
{
    QSqlQuery query;

    if(playerId ==1){
        //create new user
        QString na = "N/A";
        createNewPlayer(na, color);
    }else{
        query.prepare("UPDATE UserTable SET userAge = :playerColor WHERE playerId = :playerId");
        query.bindValue(":playerColor", color);
        query.bindValue(":playerId", playerId);
    }

    return query.exec();
}


bool DatabaseManager::createNewPlayer(QString &playerName, QString &playerColor)
{
    QSqlQuery query;

    //create new user
    query.prepare("INSERT INTO UserTable (userName, userAge, userOptionSelected, dateTime) VALUES(:userName, :userAge, :userOptionSelected, :dateTime)");
    query.bindValue(":playerName", playerName);
    query.bindValue(":playerColor", playerColor);
    query.bindValue(":dateTime", QDateTime::currentDateTime());

    return query.exec();
}

