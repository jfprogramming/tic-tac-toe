#include "systemsettings.h"


/**
 * \fn  SystemSettings::SystemSettings
 * \brief Constructs a new SystemSettings object.
 * \param parent The parent QObject, default is nullptr.
 * \return SystemSettings* The new SystemSettings object.
 */
SystemSettings::SystemSettings(QObject *parent)
    : QObject(parent), m_settingsFile(m_settingsFilePath, QSettings::IniFormat)
{
    //m_settingsFile("/data/config/settings.ini", QSettings::IniFormat);
    qDebug() << "Settings file path: " << m_settingsFilePath;
}

/**
 * \fn  SystemSettings::~SystemSettings
 * \brief Destroys the SystemSettings object.
 */
SystemSettings::~SystemSettings()
{
    qDebug() << "SystemSettings object destroyed.";
}

/**
 * \fn  SystemSettings::getAppName
 * \brief Gets the application name.
 * \return QString The name of the application.
 */
QString SystemSettings::getAppName() const
{
    return m_settingsFile.value("appName", "TicTacToe").toString();
}


/**
 * \fn  SystemSettings::setAppName
 * \brief Sets the application name.
 * \param appName The new name of the application.
 */
void SystemSettings::setAppName(const QString &appName)
{
    m_settingsFile.setValue("appName", appName);
}


/**
 * \fn  SystemSettings::getSoftwareVersion
 * \brief Gets the software version.
 * \return QString The software version.
 */
QString SystemSettings::getSoftwareVersion() const
{
    return m_settingsFile.value("softwareVersion", "1.0").toString();
}


/**
 * \fn  SystemSettings::setSoftwareVersion
 * \brief Sets the software version.
 * \param softwareVersion The new software version.
 */
void SystemSettings::setSoftwareVersion(const QString &softwareVersion)
{
    m_settingsFile.setValue("softwareVersion", softwareVersion);
}


/**
 * \fn  SystemSettings::getDateTime
 * \brief Gets the date and time setting.
 * \return QDateTime The date and time setting.
 */
QDateTime SystemSettings::getDateTime() const
{
    return m_settingsFile.value("dateTime", QDateTime::currentDateTime()).toDateTime();
}


/**
 * \fn  SystemSettings::setDateTime
 * \brief Sets the date and time setting.
 * \param dateTime The new date and time setting.
 */
void SystemSettings::setDateTime(const QDateTime &dateTime)
{
    m_settingsFile.setValue("dateTime", dateTime);
}
