#include "controllers.h"

/**
 * \namespace Controllers
 * \brief Contains instances of various controllers used in the application.
 */
namespace Controllers
{
    DatabaseManager dbManager(&Threads::dbManagerThread);
    SystemSettings  sysSettings(&Threads::sysSettingsThread);
    GameLogic       gameLogic(&Threads::gameLogicThread);
}

/**
 * \namespace Threads
 * \brief Contains instances of QThread used for different managers.
 */
namespace Threads
{
    QThread dbManagerThread;
    QThread sysSettingsThread;
    QThread gameLogicThread;
}


/**
 * \namespace runThreads
 * \brief Start the threads after the namespace definitions
 */
namespace runThreads{
    struct ThreadStarter {
        ThreadStarter() {
            Threads::dbManagerThread.start();
            Threads::sysSettingsThread.start();
            Threads::gameLogicThread.start();
        }
    } threadStarter;
}
