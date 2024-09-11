#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>
#include <QDateTime>
#include "databasemanager.h"
#include "cryptclass.h"


/**
*  \fn    DatabaseManager::DatabaseManager
 * \brief Constructor for DatabaseManager.
 * \param home The QThread object.
 * \param parent The parent QObject.
 */
DatabaseManager::DatabaseManager(QThread* home, QObject* parent) : QObject(parent)
{
    m_isDatabaseInitialized = false;
}


/**
 * \fn    DatabaseManager::~DatabaseManager
 * \brief Destructor for DatabaseManager.
 */
DatabaseManager::~DatabaseManager(){
    closeDatabase();
}


/**
 * \fn     DatabaseManager::initializeDatabase
 * \brief  Initializes the database.
 * \return True if the database is successfully initialized, false otherwise.
 */
bool DatabaseManager::initializeDatabase()
{
    qInfo() << "database initialization...";

    if (m_isDatabaseInitialized) {
        // Database already initialized, no need to proceed
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
        // m_isDatabaseInitialized = true;
        return true;
    }
}


/**
 * \fn    DatabaseManager::closeDatabase
 * \brief Closes the database.
 * \return void
 */
void DatabaseManager::closeDatabase()
{
    m_isDatabaseInitialized = false;
    QSqlDatabase::database().close();
}


/**
 * \fn    DatabaseManager::fetchPlayerId
 * \brief Closes the database.
 * \param int score
 * \return bool.
 */
void DatabaseManager::fetchPlayerId(const QString &playerName) {
    QSqlQuery query;
    query.prepare("SELECT playerId FROM PlayerTable WHERE playerName = :playerName");
    query.bindValue(":playerName", playerName);
    if (query.exec() && query.next()) {
        int playerId = query.value(0).toInt();
        setPlayerId(playerId);
    } else {
        qWarning() << "Failed to fetch player ID:" << query.lastError();
    }
}

/**
 * \fn    DatabaseManager::setPlayerHighScoreValue
 * \brief Closes the database.
 * \param int score
 * \return bool.
 */
bool DatabaseManager::setPlayerHighScoreValue(int playerId, int score) {
    QSqlQuery query;
    query.prepare("INSERT INTO HighScoreTable (playerId, highScore) VALUES (:playerId, :score)");
    query.bindValue(":playerId", playerId);
    query.bindValue(":score", score);
    if (!query.exec()) {
        qWarning() << "Failed to insert high score:" << query.lastError();
        return false;
    }
    return true;
}


/**
 * \fn     DatabaseManager::getHighScoreList
 * \brief  Retrieves the high score list from the database.
 * \return A QList of high scores.
 */
QList<int> DatabaseManager::getHighScoreList(){
    QList<int> highScores;

    QSqlQuery query("SELECT highScore FROM HighScoreTable");
    while (query.next()) {
        highScores.append(query.value(0).toInt());
    }

    qInfo() << "highscore list:" << highScores;
    return highScores;
}


/**
 * \fn     DatabaseManager::getAdminUsername
 * \brief  Retrieves the admin username from the database.
 * \return The admin username as a QString.
 */
QString DatabaseManager::getAdminUsername()
{
    QSqlQuery query;
    query.prepare("SELECT adminName FROM AdminTable");
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return "";
}


/**
 * \fn     DatabaseManager::getDecryptedAdminPassword
 * \brief  Retrieves and decrypts the admin password from the database.
 * \return The decrypted admin password as a QString.
 */
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
        return "";
}


/**
 * \fn     DatabaseManager::authenticateAdmin
 * \brief  Authenticates the admin user.
 * \param  username The admin username.
 * \param  password The admin password.
 * \return True if authentication is successful, false otherwise.
 */
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

/**
 * \fn     DatabaseManager::playerId
 * \brief  return the current playerId
 * \return void
 */
int DatabaseManager::playerId() const
{
    return m_playerId;
}

/**
 * \fn     DatabaseManager::setPlayerId
 * \brief  set the current player id
 * \return void
 */
void DatabaseManager::setPlayerId(int newPlayerId)
{
    m_playerId = newPlayerId;
}


/**
 * \fn     DatabaseManager::performDatabaseOperations
 * \brief  generic database operation place holder
 * \return void
 */
void DatabaseManager::performDatabaseOperations()
{
    // TODO: fill in when needed.
    //
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

/**
 * \fn     DatabaseManager::getPlayerName
 * \brief  Retrieves the name of a player from the database.
 * \param  playerId The ID of the player.
 * \return QString The name of the player.
 */
QString DatabaseManager::getPlayerName(int playerId)
{
    QSqlQuery query;
    query.prepare("SELECT palyerName FROM PlayerTable WHERE playerId = :id");
    query.bindValue(":playerId", playerId);
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return "";
}


/**
 * \fn     DatabaseManager::getPlayerColor
 * \brief  Retrieves the color associated with a player from the database.
 * \param  color The color to search for.
 * \return QString The color associated with the player.
 */
QString DatabaseManager::getPlayerColor(QString &color)
{
    QSqlQuery query;
    query.prepare("SELECT playerColor FROM PlayerTable WHERE userId = :id");
    query.bindValue(":color", color);
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return "";
}


/**
 * \fn     DatabaseManager::getUserSelectedOption
 * \brief  Retrieves the selected option of a user from the database.
 * \param  userId The ID of the user.
 * \return QString The selected option of the user.
 */
QString DatabaseManager::getUserSelectedOption(int userId)
{
    QSqlQuery query;
    query.prepare("SELECT userSelectedOption FROM UserTable WHERE userId = :id");
    query.bindValue(":id", userId);
    if (query.exec() && query.next())
        return query.value(0).toString();
    else
        return "";
}


/**
 * \fn    DatabaseManager::setPlayerName
 * \brief  Sets the name of a player in the database.
 * \param  playerId The ID of the player.
 * \param  newName The new name of the player.
 * \return bool True if the operation was successful, false otherwise.
 */
bool DatabaseManager::setPlayerName(int playerId, QString &newName)
{
    QSqlQuery query;

    if(playerId == 1){
        // Create new player
        QString na = "N/A";
        createNewPlayer(newName, na);
    } else {
        query.prepare("UPDATE PlayerTable SET playerName = :playerName WHERE playerId = :playerId");
        query.bindValue(":playerName", newName);
        query.bindValue(":playerId", playerId);
    }

    return query.exec();
}


/**
 * \fn     DatabaseManager::setPlayerColor
 * \brief  set the player color int the player table
 * \param  playerId
 * \param  color
 * \return bool
 */
bool DatabaseManager::setPlayerColor(int playerId, QString &color)
{
    QSqlQuery query;

    if(playerId ==1){
        // Create new player
        //
        QString na = "N/A";
        createNewPlayer(na, color);
    }else{
        query.prepare("UPDATE UserTable SET userAge = :playerColor WHERE playerId = :playerId");
        query.bindValue(":playerColor", color);
        query.bindValue(":playerId", playerId);
    }

    return query.exec();
}


/**
 * \fn      DatabaseManager::createNewPlayer
 * \brief   Inserts a new user int the player table
 * \param   playerName
 * \param   playerColor
 * \return  bool
 */
bool DatabaseManager::createNewPlayer(QString &playerName, QString &playerColor)
{
    QSqlQuery query;

    // Create new player
    //
    query.prepare("INSERT INTO UserTable (userName, userAge, userOptionSelected, dateTime) VALUES(:userName, :userAge, :userOptionSelected, :dateTime)");
    query.bindValue(":playerName", playerName);
    query.bindValue(":playerColor", playerColor);
    query.bindValue(":dateTime", QDateTime::currentDateTime());

    return query.exec();
}

