#include "controllers.h"

namespace Controllers
{
    // Instance of DatabaseManager initialized with dbManagerThread.
    //
    DatabaseManager dbManager(&Threads::dbManagerThread);
}

namespace Threads
{
    // Instance of QThread for the database manager.
    //
    QThread dbManagerThread;
}


