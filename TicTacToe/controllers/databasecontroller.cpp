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
    db.setDatabaseName("/data/database/my_database.db");
    if (!db.open())
    {
        qDebug() << "Error opening database:" << db.lastError().text();
        // Handle the error (e.g., show an error message)
    }
}


void DatabaseController::performDatabaseOperations()
{
    QSqlQuery query;
    if (query.exec("SELECT * FROM userTable"))
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

QString DatabaseController::getUserName(int userId)
{
    QSqlQuery query;
    query.prepare("SELECT userName FROM UserTable WHERE userId = :id");
    query.bindValue(":id", userId);
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return ""; // Return an empty string or handle the error
}

int DatabaseController::getUserAge(int userId)
{
    QSqlQuery query;
    query.prepare("SELECT userAge FROM UserTable WHERE userId = :id");
    query.bindValue(":id", userId);
    if (query.exec() && query.next())
        return query.value(0).toInt();
    else
        return -1; // Return an empty string or handle the error
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


bool DatabaseController::setUserName(int userId, const QString& newName)
{
    QSqlQuery query;


    if(userId == 1){
        //create new user
        createNewUser(newName, "N/A");

    }else{
        query.prepare("UPDATE UserTable SET userName = :userName WHERE userId = :id");
        query.bindValue(":userName", newName);
        query.bindValue(":id", userId);
    }

    return query.exec();
}


bool DatabaseController::setUserAge(int userId, const QString& newAge)
{
    QSqlQuery query;

    if(userId ==1){
        //create new user
        createNewUser("N/A", newAge);
    }else{
        query.prepare("UPDATE UserTable SET userAge = :userAge WHERE userId = :id");
        query.bindValue(":userAge", newAge);
        query.bindValue(":id", userId);
    }

    return query.exec();
}

bool DatabaseController::createNewUser(QString userName, const QString& newAge)
{
    QSqlQuery query;

    //create new user
    query.prepare("INSERT INTO UserTable (userName, userAge, userOptionSelected, dateTime) VALUES(:userName, :userAge, :userOptionSelected, :dateTime)");
    query.bindValue(":userName", userName);
    query.bindValue(":userAge", newAge);
    query.bindValue(":userOptionSelected", "N/A");
    query.bindValue(":dateTime", QDateTime::currentDateTime());

    return query.exec();
}

bool DatabaseController::setUserSelectedOption(int userId, const QString& newSelectedOption)
{
    QSqlQuery query;
    query.prepare("UPDATE UserTable SET userSelectedOption = :userSelectedOption WHERE userId = :id");
    query.bindValue(":userSelectedOption", newSelectedOption);
    query.bindValue(":id", userId);
    return query.exec();
}

void DatabaseController::closeDatabase()
{
    QSqlDatabase::database().close();
}
