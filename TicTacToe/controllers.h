#pragma once
#include <QThread>
#include "controllers/databasemanager.h"

/**
 * @file dbmanager.h
 *
 * @brief Contains declarations for database manager and related threads.
 *        Provides external linkage for DatabaseManager and QThread instances.
 */

namespace Controllers
{
    // External declaration of the DatabaseManager instance.
    //
    extern DatabaseManager dbManager;
}

namespace Threads
{
    // External declaration of the QThread instance for the database manager.
    //
    extern QThread dbManagerThread;
}
