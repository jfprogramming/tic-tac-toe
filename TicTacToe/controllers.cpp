#include "controllers.h"

namespace Controllers
{
    DatabaseManager dbManager(&Threads::dbManagerThread);
}

namespace Threads
{
    QThread dbManagerThread;
}


