#include "controllers/databasemanager.h"
#include "models/highscoremodel.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtCore>
#include "controllers.h"
#include "models/gameplaymodel.h"
#include "controllers/gamelogic.h"
#include "controllers/systemsettings.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Register GameLogic with QML
    //
    qmlRegisterType<GameLogic>("GameLogic", 1, 0, "GameLogic");

    // Register PlayerModel with QML
    //
    qmlRegisterType<GamePlayModel>("PlayerModel", 1, 0, "PlayerModel");

    // Setup DB
    //
    Controllers::dbManager.initializeDatabase();

    // Setup models for QML
    //
    GamePlayModel playerModel;
    engine.rootContext()->setContextProperty("playerModel", &playerModel);

    HighscoreModel highscoreModel;
    engine.rootContext()->setContextProperty("highscoreModel", &highscoreModel);

    // Setup game logic for QML
    //
    GameLogic gameLogic;
    engine.rootContext()->setContextProperty("gameLogic", &gameLogic);

    // System setttings for QML
    //
    SystemSettings settingsController;
    engine.rootContext()->setContextProperty("settingsController", &settingsController);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    // Start the UI
    //
    engine.loadFromModule("TicTacToe", "Main");

    return app.exec();
}
