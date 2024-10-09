#include "aboutinfo.h"

/**
 * \fn AboutInfo::AboutInfo(QObject *parent)
 * \brief Constructor for AboutInfo.
 * \param parent The parent QObject.
 */
AboutInfo::AboutInfo(QObject *parent): QObject(parent)
{
    qDebug() << "AboutInfo object created.";

    m_appName         = getAppName();
    m_softwareVersion = getSoftwareVersion();
    m_dateTime        = getDateTime();
}

/**
 * \fn AboutInfo::~AboutInfo()
 * \brief Destructor for AboutInfo.
 */
AboutInfo::~AboutInfo()
{
    qDebug() << "AboutInfo object destroyed.";
}

/**
 * \fn QString AboutInfo::getAppName() const
 * \brief Gets the application name.
 * \return The application name as a QString.
 */
QString AboutInfo::getAppName() const
{
    return m_settingsManager.getAppName();
}

/**
 * \fn QString AboutInfo::getSoftwareVersion() const
 * \brief Gets the software version.
 * \return The software version as a QString.
 */
QString AboutInfo::getSoftwareVersion() const
{
    return m_settingsManager.getSoftwareVersion();
}

/**
 * \fn QDateTime AboutInfo::getDateTime() const
 * \brief Gets the current date and time.
 * \return The current date and time as a QDateTime.
 */
QDateTime AboutInfo::getDateTime() const
{
    return m_settingsManager.getDateTime();
}
