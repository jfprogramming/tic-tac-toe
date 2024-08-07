#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>
#include <QDateTime>
#include "databasecontroller.h"

DatabaseController::DatabaseController(QObject *parent)
    : QThread{parent}
{}


void DatabaseController::initializeDatabase()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("/data/database/tictactoe.db");
    if (!db.open())
    {
        qDebug() << "Error opening database:" << db.lastError().text();
        // Handle the error (e.g., show an error message)
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

void DatabaseController::closeDatabase()
{
    QSqlDatabase::database().close();
}
