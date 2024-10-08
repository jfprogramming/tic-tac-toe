#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>
#include <QDateTime>
#include "databasemanager.h"
#include "cryptclass.h"
#include "models/adminplayermodel.h"

/**
*  \fn    DatabaseManager::DatabaseManager
 * \brief Constructor for DatabaseManager.
 * \param home The QThread object.
 * \param parent The parent QObject.
 */
DatabaseManager::DatabaseManager(QThread* home, QObject* parent) : QObject(parent)
{
    qDebug() << __FUNCTION__ << "DatabaseManager constructor";

    m_isDatabaseInitialized = false;
}


/**
 * \fn    DatabaseManager::~DatabaseManager
 * \brief Destructor for DatabaseManager.
 */
DatabaseManager::~DatabaseManager(){
    qDebug() << __FUNCTION__ << "DatabaseManager destructor";

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
        m_isDatabaseInitialized = true;
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
    qDebug() << __FUNCTION__ << "Closing database...";

    m_isDatabaseInitialized = false;
    QSqlDatabase::database().close();
}


/**
 * \fn     DatabaseManager::getAdminUsername
 * \brief  Retrieves the admin username from the database.
 * \return The admin username as a QString.
 */
QString DatabaseManager::getAdminUsername()
{
    qDebug() << __FUNCTION__ << "Fetching admin username...";

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
    qDebug() << __FUNCTION__ << "Fetching and decrypting admin password...";

    QString decryptedPassword;
    QSqlQuery query;
    query.prepare("SELECT adminPassword FROM AdminTable");

    if (query.exec() && query.next())
    {
        QString encryptedPassword = query.value(0).toString();

        // Decrypt the password using bcrypt (replace "admin" with the actual admin password)
        //
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
bool DatabaseManager::authenticateAdmin(const QString &username, const QString &password)
{
    qDebug() << __FUNCTION__ << "Authenticating admin...";

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
    }
    else {
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
    }
    else{
        return false;
    }
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
    qDebug() << __FUNCTION__ << "Setting player name for player:" << playerId << " new name:" << newName;

    QSqlQuery query;

    if(playerId == 1){
        // Create new player
        QString na = "N/A";
        createNewPlayer(newName, na);
    } else {
        query.prepare("UPDATE PlayerTable SET playerName = :playerName WHERE playerId = :playerId");
        query.bindValue(":playerName", newName);
        query.bindValue(":playerId",   playerId);
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
    qDebug() << __FUNCTION__ << "Setting player color for player:" << playerId << " new color:" << color;

    QSqlQuery query;

    if(playerId ==1){
        // Create new player
        //
        QString na = "N/A";
        createNewPlayer(na, color);
    }else{
        query.prepare("UPDATE UserTable SET userAge = :playerColor WHERE playerId = :playerId");
        query.bindValue(":playerColor", color);
        query.bindValue(":playerId",    playerId);
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
bool DatabaseManager::createNewPlayer(const QString &playerName, const QString &playerColor)
{
    qDebug() << __FUNCTION__ << "Creating new player:" << playerName << " color:" << playerColor;

    QSqlQuery query;
    query.prepare("SELECT playerId FROM PlayerTable WHERE playerName = :playerName");
    query.bindValue(":playerName", playerName);

    if (query.exec() && query.next()) {
        // Player exists, update the playerColor
        //
        int playerId = query.value(0).toInt();
        query.prepare("UPDATE PlayerTable SET playerColor = :playerColor WHERE playerId = :playerId");
        query.bindValue(":playerColor", playerColor);
        query.bindValue(":playerId",    playerId);
    } else {
        // Player does not exist, create a new player
        //
        query.prepare("INSERT INTO PlayerTable (playerName, playerColor, dateTime) VALUES(:playerName, :playerColor, :dateTime)");
        query.bindValue(":playerName",  playerName);
        query.bindValue(":playerColor", playerColor);
        query.bindValue(":dateTime", QDateTime::currentDateTime());
    }

    return query.exec();
}


/**
 * \fn      DatabaseManager::retrievePlayerName
 * \brief   Gets a player by their row index in the high score table
 * \param   QString name
 * \return  bool
 */
QString DatabaseManager::retrievePlayerName(const int id)
{
    QSqlQuery query;
    query.prepare("SELECT playerName FROM HighScore WHERE id = :id");
    query.bindValue(":id", id);

    qDebug() << "player name successfully retrieved";
    if (query.exec() && query.next())
        return query.value(0).toString();
    return "";
}


/**
 * \fn      DatabaseManager::retrievePlayerColor
 * \brief   Gets a player by their row index in the high score table
 * \param   QString name
 * \return  bool
 */
QString DatabaseManager::retrievePlayerColor(const int id)
{
    QSqlQuery query;
    query.prepare("SELECT playerColor FROM HighScore WHERE id = :id");
    query.bindValue(":id", id);

    qDebug() << "player name successfully retrieved";
    if (query.exec() && query.next())
        return query.value(0).toString();
    return "";
}


/**
 * \fn      DatabaseManager::getPlayerByName
 * \brief   Gets a player by their name
 * \param   QString name
 * \return  bool
 */
Player DatabaseManager::getPlayerById(const int id) {
    qDebug() << __FUNCTION__ << "Fetching player by id:" << id;

    Player player;

    QSqlQuery query;
    query.prepare("SELECT id, playerName, playerColor, highScore FROM PlayerTable WHERE id = :id");
    query.bindValue(":id", id);

    if (query.exec() && query.next()) {
        player.id        = query.value(0).toInt();
        player.name      = query.value(1).toString();
        player.color     = query.value(2).toString();
        player.highScore = query.value(3).toInt();
    } else {
        qWarning() << "Failed to fetch player by id:" << query.lastError();
        player.id        = -1;
        player.name      = "DNE";
        player.color     = "DNE";
        player.highScore = 0;
    }
    return player;
}



/**
 * \fn      DatabaseManager::getPlayerByName
 * \brief   Gets a player by their name
 * \param   QString name
 * \return  bool
 */
Player DatabaseManager::getPlayerByName(const QString &name) {
    qDebug() << __FUNCTION__ << "Fetching player by name:" << name;

    Player player;

    QSqlQuery query;
    query.prepare("SELECT id, playerName, playerColor, highScore FROM PlayerTable WHERE playerName = :name");
    query.bindValue(":name", name);

    if (query.exec() && query.next()) {
        player.id        = query.value(0).toInt();
        player.name      = query.value(1).toString();
        player.color     = query.value(2).toString();
        player.highScore = query.value(3).toInt();
    } else {
        qWarning() << "Failed to fetch player by name:" << query.lastError();
        player.id        = -1;
        player.name      = "DNE";
        player.color     = "DNE";
        player.highScore = 0;
    }
    return player;
}


/**
 * \fn    DatabaseManager::setPlayerHighScoreValue
 * \brief Closes the database.
 * \param int score
 * \return bool.
 */
bool DatabaseManager::setPlayerHighScoreValue(int playerId, int score)
{
    qDebug() << __FUNCTION__ << "Setting high score for player:" << playerId << " score:" << score;

    QSqlQuery query;
    query.prepare("INSERT INTO HighScoreTable (playerId, highScore) VALUES (:playerId, :score)");
    query.bindValue(":playerId", playerId);
    query.bindValue(":score", score);
    query.bindValue(":dateTime", QDateTime::currentDateTime());
    if (!query.exec()) {
        qWarning() << "Failed to insert high score:" << query.lastError();
        return false;
    }
    qDebug() << "High score inserted successfully";
    return true;
}

/**
 * \fn    DatabaseManager::updatePlayerHighScore
 * \brief Closes the database.
 * \param int score
 * \return bool.
 */
bool DatabaseManager::updatePlayerHighScore(const QString &playerName, int score)
{
    qDebug() << __FUNCTION__ << "Updating high score for player:" << playerName << " score:" << score;

    QSqlQuery query;
    query.prepare("UPDATE HighScoreTable SET highScore = :score, dateTime = :dateTime WHERE playerId = (SELECT playerId FROM PlayerTable WHERE playerName = :playerName)");
    query.bindValue(":score", score);
    query.bindValue(":dateTime", QDateTime::currentDateTime().toString(Qt::ISODate));
    query.bindValue(":playerName", playerName);
    qDebug() << "Query:" << query.lastQuery();
    if (!query.exec()) {
        qWarning() << "Failed to update high score:" << query.lastError();
        return false;
    }
    return true;
}


/**
 * \fn     DatabaseManager::getHighScoreList
 * \brief  Retrieves the high score list from the database.
 * \return A QList of high scores.
 */
QList<QPair<QString, int>> DatabaseManager::getHighScoreList() {
    qDebug() << __FUNCTION__ << "Fetching high score list...";

    QList<QPair<QString, int>> highScores;

    QSqlQuery query("SELECT PlayerTable.name, HighScoreTable.highScore FROM HighScoreTable "
                    "JOIN PlayerTable ON HighScoreTable.playerId = PlayerTable.id");
    while (query.next()) {
        QString playerName = query.value(0).toString();
        int highScore = query.value(1).toInt();
        highScores.append(qMakePair(playerName, highScore));
    }

    qInfo() << "highscore list:" << highScores;
    return highScores;
}


/**
 * \fn      DatabaseManager::getHighScoreForPlayer
 * \brief   Gets a high score asscoated with a player
 * \param   int playerId
 * \return  int
 */
int DatabaseManager::getHighScoreForPlayer(int playerId) {
    QSqlQuery query;
    query.prepare("SELECT highScore FROM PlayerTable WHERE playerId = :id");
    query.bindValue(":id", playerId);
    if (query.exec() && query.next())
        return query.value(0).toInt();
    else
        return 0;
}


/**
 * \fn      DatabaseManager::getAllPlayers
 * \brief   Get a list of all the players in the database
 * \return  QList<QMap<QString, QString>>
 */
QList<AdminPlayer> DatabaseManager::getAllPlayers() {
    QList<AdminPlayer> players;
    QSqlQuery query("SELECT name, color FROM players"); // Adjust query based on your table schema
    while (query.next()) {
        AdminPlayer adminPlayer;
        adminPlayer.id        = query.value("id").toInt();
        adminPlayer.name      = query.value("name").toString();
        adminPlayer.color     = query.value("color").toString();
        adminPlayer.highScore = query.value("highscore").toInt();
        players.append(adminPlayer);
    }
    return players;
}
