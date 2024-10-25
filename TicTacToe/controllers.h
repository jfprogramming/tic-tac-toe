#pragma once
#include <QThread>
#include "controllers/databasemanager.h"
#include "controllers/gamelogic.h"
#include "controllers/systemsettings.h"

/**
 * \file controllers.h
 *
 * \brief Contains declarations for database manager and related threads.
 *        Provides external linkage for DatabaseManager and QThread instances.
 */

namespace Controllers
{
    // External declaration of the DatabaseManager instance.
    //
    extern DatabaseManager dbManager;
    extern SystemSettings  sysSettings;
    extern GameLogic       gameLogic;
}

namespace Threads
{
    // External declaration of the QThread instance for the database manager.
    //
    extern QThread dbManagerThread;
    extern QThread sysSettingsThread;
    extern QThread gameLogicThread;

}
