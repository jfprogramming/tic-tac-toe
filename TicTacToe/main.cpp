#include "controllers.h"
#include "controllers/gamelogic.h"
#include "models/highscoremodel.h"
#include "models/playermodel.h"
#include "qguiapplication.h"
#include "qqmlapplicationengine.h"
#include "qqmlcontext.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Setup DB
    Controllers::dbManager.initializeDatabase();

    // Setup models for QML
    PlayerModel playerModel;
    engine.rootContext()->setContextProperty("playerModel", &playerModel);

    HighscoreModel highscoreModel;
    engine.rootContext()->setContextProperty("highscoreModel", &highscoreModel);

    // Setup game logic for QML
    GameLogic gameLogic;
    engine.rootContext()->setContextProperty("gameLogic", &gameLogic);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    // Start the UI
    engine.loadFromModule("TicTacToe", "Main");

    return app.exec();
}
