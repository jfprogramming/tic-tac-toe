#include "test_databasemanager.h"
//#include "../controllers/databasemanager.h/
#include "../controllers.h"

void TestDatabaseManager::initTestCase()
{
    // Code to set up the test environment before any test functions are executed
}

void TestDatabaseManager::cleanupTestCase()
{
    // Code to clean up the test environment after all test functions have been executed
}

void TestDatabaseManager::init()
{
    // Code to set up before each test function
}

void TestDatabaseManager::cleanup()
{
    // Code to clean up after each test function
}

// Test cases for each public method in DatabaseManager
void TestDatabaseManager::testInitializeDatabase()
{
    //DatabaseManager dbManager;
    //QVERIFY(dbManager.initializeDatabase() == true);
    QVERIFY(Controllers::dbManager.initializeDatabase() == true);
}

// Similarly, implement other test cases
void TestDatabaseManager::testCloseDatabase()
{
    //DatabaseManager dbManager;
    //dbManager.initializeDatabase();
    //dbManager.closeDatabase();

    Controllers::dbManager.initializeDatabase();
    Controllers::dbManager.closeDatabase();
    QVERIFY(Controllers::dbManager.isDatabaseOpen() == false);

    // Add assertions to verify the state after closing the database
}

void TestDatabaseManager::testGetPlayerIdByName()
{
    //DatabaseManager dbManager;
    //dbManager.initializeDatabase();
    //int playerId = dbManager.getPlayerIdByName("PlayerName");
    //QVERIFY(playerId != -1); // Assuming -1 indicates an invalid ID

    Controllers::dbManager.initializeDatabase();
    int playerId = Controllers::dbManager.getPlayerIdByName("Player1");
    QVERIFY(playerId != -1); // Assuming -1 indicates an invalid ID
}

#include "test_databasemanager.moc"
