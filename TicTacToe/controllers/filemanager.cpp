#include "filemanager.h"

/**
 * \fn  FileManager::FileManager
 * \brief Constructs a new FileManager object.
 *
 * \param parent The parent QObject, default is nullptr.
 *
 * \return FileManager* The new FileManager object.
 */
FileManager::FileManager(QObject *parent)
    : QObject(parent), m_settingsFile(m_settingsFilePath, QSettings::IniFormat)
{
    qDebug() << "FileManager object created.";
}

/**
 * \fn  FileManager::~FileManager
 * \brief Destroys the FileManager object.
 */
FileManager::~FileManager()
{
    qDebug() << "FileManager object destroyed.";
}

/**
 * \fn  FileManager::getAppName
 * \brief Gets the application name.
 * \return QString The name of the application.
 */
QString FileManager::getAppName() const
{
    return m_settingsFile.value("appName", "TicTacToe").toString();
}


/**
 * \fn  FileManager::setAppName
 * \brief Sets the application name.
 * \param appName The new name of the application.
 */
void FileManager::setAppName(const QString &appName)
{
    m_settingsFile.setValue("appName", appName);
}


/**
 * \fn  FileManager::getSoftwareVersion
 * \brief Gets the software version.
 * \return QString The software version.
 */
QString FileManager::getSoftwareVersion() const
{
    return m_settingsFile.value("softwareVersion", "1.0").toString();
}


/**
 * \fn  FileManager::setSoftwareVersion
 * \brief Sets the software version.
 * \param softwareVersion The new software version.
 */
void FileManager::setSoftwareVersion(const QString &softwareVersion)
{
    m_settingsFile.setValue("softwareVersion", softwareVersion);
}


/**
 * \brief Gets the date and time setting.
 *
 * \return QDateTime The date and time setting.
 */
QDateTime FileManager::getDateTime() const
{
    return m_settingsFile.value("dateTime", QDateTime::currentDateTime()).toDateTime();
}


/**
 * \fn  FileManager::setDateTime
 * \brief Sets the date and time setting.
 * \param dateTime The new date and time setting.
 */
void FileManager::setDateTime(const QDateTime &dateTime)
{
    m_settingsFile.setValue("dateTime", dateTime);
}
