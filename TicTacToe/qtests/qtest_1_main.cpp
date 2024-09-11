#include <QtTest/QtTest>

// Example class to test
//
class TestClass : public QObject {
    Q_OBJECT

private slots:
    void testAddition() {
        QCOMPARE(1 + 1, 2);
    }
};

QTEST_MAIN(TestClass)
#include "qtest_1_main.moc"
