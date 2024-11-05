#include "aboutinfo.h"

//#define DEBUG

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

    qDebug() << "Application name: " << m_appName;
    qDebug() << "Software version: " << m_softwareVersion;
    qDebug() << "Date and time: "    << m_dateTime;
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
    qDebug() << "Getting application name: " << m_settingsManager.getAppName();
    return m_settingsManager.getAppName();
}

/**
 * \fn QString AboutInfo::getSoftwareVersion() const
 * \brief Gets the software version.
 * \return The software version as a QString.
 */
QString AboutInfo::getSoftwareVersion() const
{
    qDebug() << "Getting software version: " << m_settingsManager.getSoftwareVersion();
    return m_settingsManager.getSoftwareVersion();
}

/**
 * \fn QString AboutInfo::getDateTime() const
 * \brief Gets the current date and time.
 * \return The current date and time as a QString.
 */
QString AboutInfo::getDateTime() const
{
    qDebug() << "Getting date and time: " << m_settingsManager.getDateTime();
    return m_settingsManager.getDateTime();
}
