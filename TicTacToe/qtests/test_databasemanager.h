#pragma once

#include <QObject>
#include <QtTest/QtTest>

class TestDatabaseManager : public QObject
{
    Q_OBJECT

private slots:
    void initTestCase();    // Called before the first test function is executed
    void cleanupTestCase(); // Called after the last test function is executed
    void init();            // Called before each test function is executed
    void cleanup();         // Called after each test function is executed

    // Test cases for each public method in DatabaseManager
    void testInitializeDatabase();
    void testCloseDatabase();
    void testGetPlayerIdByName();
    void testGetHighScoreForPlayer();
    //void testUpdatePlayer();
    //void testRetrievePlayerName();
    //void testRetrievePlayerColor();
    //void testGetPlayerByName();
    //void testGetPlayerById();
    //void testGetAllPlayers();
    //void testGetAdminUsername();
    //void testGetDecryptedAdminPassword();
    //void testGetHighScoreList();
    //void testSetPlayerHighScoreValue();
    //void testAuthenticateAdmin();
    //void testUpdatePlayerHighScore();
};
