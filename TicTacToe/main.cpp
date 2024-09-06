#include "controllers/databasemanager.h"
#include "models/highscoremodel.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtCore>
#include "controllers.h"
#include "models/playermodel.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Setup DB
    //
    Controllers::dbManager.initializeDatabase();

    // Setup models for QML
    //
    PlayerModel playerModel;
    engine.rootContext()->setContextProperty("playerModel", &playerModel);

    HighscoreModel highscoreModel;
    engine.rootContext()->setContextProperty("highscoreModel", &highscoreModel);


    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("TicTacToe", "Main");

    return app.exec();
}
