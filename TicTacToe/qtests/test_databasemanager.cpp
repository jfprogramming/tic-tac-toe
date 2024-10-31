
#include "test_databasemanager.h"
#include "../controllers/databasemanager.h"

void TestDatabaseManager::initTestCase()
{
    //DatabaseManager dbManager;
    //dbManager.closeDatabase();
}

void TestDatabaseManager::cleanupTestCase()
{
    // Code to clean up the test environment after all test functions have been executed
}

void TestDatabaseManager::init()
{
    //DatabaseManager dbManager;
    //dbManager.initializeDatabase();
}

void TestDatabaseManager::cleanup()
{
    // Code to clean up after each test function if needed
}


void TestDatabaseManager::testInitializeDatabase()
{
    DatabaseManager dbManager;
    QVERIFY(dbManager.initializeDatabase() == true);
}


void TestDatabaseManager::testCloseDatabase()
{
    DatabaseManager dbManager;
    dbManager.initializeDatabase();
    dbManager.closeDatabase();
    QVERIFY(dbManager.isDatabaseOpen() == false);

    // Add assertions to verify the state after closing the database
}


void TestDatabaseManager::testGetPlayerIdByName()
{
    DatabaseManager dbManager;
    dbManager.initializeDatabase();
    int playerId = dbManager.getPlayerIdByName("PlayerName");
    QVERIFY(playerId != -1); // Assuming -1 indicates an invalid ID
}

void TestDatabaseManager::testGetHighScoreForPlayer()
{
    DatabaseManager dbManager;
    dbManager.initializeDatabase();
    int highScore = dbManager.getHighScoreForPlayer(1); // Assuming player ID 1 exists
    QVERIFY(highScore >= 0); // Verify that the high score is a non-negative value
}

#include "test_databasemanager.moc"
