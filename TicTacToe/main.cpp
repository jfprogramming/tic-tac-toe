#include "controllers/databasecontroller.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtCore>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    DatabaseController databaseController;
    qmlRegisterType<DatabaseController>("DbModule", 1, 0, "DtabaseController");
    // directly access the database controller to save
    engine.rootContext()->setContextProperty("databaseController", &databaseController);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("TicTacToe", "Main");



    return app.exec();
}
