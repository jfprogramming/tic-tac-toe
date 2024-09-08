#include "controllers.h"

/**
 * \namespace Controllers
 * \brief Contains instances of various controllers used in the application.
 */
namespace Controllers
{
    DatabaseManager dbManager(&Threads::dbManagerThread);
}

/**
 * \namespace Threads
 * \brief Contains instances of QThread used for different managers.
 */
namespace Threads
{
    QThread dbManagerThread;
}
