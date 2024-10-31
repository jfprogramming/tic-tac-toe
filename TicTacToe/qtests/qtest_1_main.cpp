#include <QtTest/QtTest>
#include "test_databasemanager.h"

// Example class to test
//
class TestClass : public QObject {
    Q_OBJECT

private slots:
    void testAddition() {
        QCOMPARE(1 + 1, 2);
    }
};

QTEST_MAIN(TestDatabaseManager)

#include "qtest_1_main.moc"
