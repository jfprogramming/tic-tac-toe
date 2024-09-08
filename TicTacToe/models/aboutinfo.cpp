#include "aboutinfo.h"
#include "qsettings.h"

/**
 * \brief Constructor for AboutInfo.
 * \param parent The parent QObject.
 */
AboutInfo::AboutInfo(QObject* parent) : QObject(parent){

    QSettings myAppSettings("/data/config/settings.ing", QSettings::NativeFormat);
    info(myAppSettings);
    load(myAppSettings);
}

/**
 * \brief Destructor for AboutInfo.
 */
AboutInfo::~AboutInfo(){

}

/**
 * \brief Logs information about the QSettings object.
 * \param settings The QSettings object.
 */
void AboutInfo::info(QSettings &settings){
    qInfo() << "settings" << settings.fileName();
    qInfo() << "settings" << settings.allKeys();
}

/**
 * \brief Saves application settings to the QSettings object.
 * \param settings The QSettings object.
 */
void AboutInfo::save(QSettings &settings){
    settings.beginGroup("AppSettings");
    settings.setValue("AppName",         "Tic-Tac-Toe");
    settings.setValue("SoftwarVersion",  "0.0.1");
    settings.setValue("DatabaseVersion", "0.0.1");
    settings.setValue("DataDir",         "/Data");
    settings.endGroup();

    qInfo() << "status:" << settings.status();
    qInfo() << "settings saved";
}

/**
 * \brief Loads application settings from the QSettings object.
 * \param settings The QSettings object.
 */
void AboutInfo::load(QSettings &settings){
    // Pull the settings out of the settings file
    // if no setting set default value
    //
    qInfo() << "AppName:"         << settings.value("AppSettings/AppName").toString();
    qInfo() << "DataDir:"         << settings.value("AppSettings/DataDir").toString();

    // TODO: convert to get data from database
    //
    qInfo() << "SoftwarVersion:"  << settings.value("AppSettings/SoftwarVersion").toString();
    qInfo() << "DatabaseVersion:" << settings.value("AppSettings/DatabaseVersion").toString();
}

/**
 * \brief Gets the software version.
 * \return The software version as a QString.
 */
QString AboutInfo::softwareVersion() const
{
    return m_softwareVersion;
}

/**
 * \brief Sets the software version.
 * \param newSoftwareVersion The new software version as a QString.
 */
void AboutInfo::setSoftwareVersion(const QString &newSoftwareVersion)
{
    m_softwareVersion = newSoftwareVersion;
}

/**
 * \brief Gets the database version.
 * \return The database version as a QString.
 */
QString AboutInfo::databaseVersion() const
{
    return m_databaseVersion;
}

/**
 * \brief Sets the database version.
 * \param newDatabaseVersion The new database version as a QString.
 */
void AboutInfo::setDatabaseVersion(const QString &newDatabaseVersion)
{
    m_databaseVersion = newDatabaseVersion;
}

/**
 * \brief Gets the data directory.
 * \return The data directory as a QString.
 */
QString AboutInfo::dataDir() const
{
    return m_dataDir;
}

/**
 * \brief Sets the data directory.
 * \param newDataDir The new data directory as a QString.
 */
void AboutInfo::setDataDir(const QString &newDataDir)
{
    m_dataDir = newDataDir;
}

/**
 * \brief Gets the application name.
 * \return The application name as a QString.
 */
QString AboutInfo::appName() const
{
    return m_appName;
}

/**
 * \brief Sets the application name.
 * \param newAppName The new application name as a QString.
 */
void AboutInfo::setAppName(const QString &newAppName)
{
    m_appName = newAppName;
}
