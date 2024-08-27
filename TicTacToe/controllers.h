#pragma once
#include <QThread>
#include "controllers/databasemanager.h"

namespace Controllers
{
    extern DatabaseManager dbManager;
}

namespace Threads
{
    extern QThread dbManagerThread;
}




