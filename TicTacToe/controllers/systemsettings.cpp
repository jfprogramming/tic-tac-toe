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
    qDebug() << "Settings file path:" << m_settingsFilePath;
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
    qDebug() << "Getting application name: " << m_settingsFile.value("AppName", "TicTacToe").toString();
    return m_settingsFile.value("AppName", "TicTacToe").toString();
}


/**
 * \fn  SystemSettings::setAppName
 * \brief Sets the application name.
 * \param appName The new name of the application.
 */
void SystemSettings::setAppName(const QString &appName)
{
    qDebug() << "Setting application name to: " << appName;
    m_settingsFile.setValue("AppName", appName);
}


/**
 * \fn  SystemSettings::getSoftwareVersion
 * \brief Gets the software version.
 * \return QString The software version.
 */
QString SystemSettings::getSoftwareVersion() const
{
    qDebug() << "Getting software version: " << m_settingsFile.value("SoftwareVersion", "1.0").toString();
    return m_settingsFile.value("SoftwareVersion", "1.0").toString();
}


/**
 * \fn  SystemSettings::setSoftwareVersion
 * \brief Sets the software version.
 * \param softwareVersion The new software version.
 */
void SystemSettings::setSoftwareVersion(const QString &softwareVersion)
{
    qDebug() << "Setting software version to: " << softwareVersion;
    m_settingsFile.setValue("SoftwareVersion", softwareVersion);
}


/**
 * \fn  SystemSettings::getDateTime
 * \brief Gets the date and time setting.
 * \return QDateTime The date and time setting.
 */
QString SystemSettings::getDateTime() const
{
    qDebug() << "Getting date and time: " << m_settingsFile.value("DateFormat", "YYYY-MM-dd").toString();
    return m_settingsFile.value("DateFormat", "YYYY-MMM-dd").toString();
}


/**
 * \fn  SystemSettings::setDateTime
 * \brief Sets the date and time setting.
 * \param dateTime The new date and time setting.
 */
void SystemSettings::setDateTime(const QDateTime &dateTime)
{
    qDebug() << "Setting date and time to: " << dateTime;
    m_settingsFile.setValue("DateTime", dateTime);
}
