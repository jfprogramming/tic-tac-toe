#include "aboutinfo.h"
#include "qsettings.h"

AboutInfo::AboutInfo(QObject* parent) : QObject(parent){

    QSettings myAppSettings("/data/config/settings.ing", QSettings::NativeFormat);
    info(myAppSettings);
    load(myAppSettings);
}


AboutInfo::~AboutInfo(){

}


void AboutInfo::info(QSettings &settings){
    qInfo() << "settings" << settings.fileName();
    qInfo() << "settings" << settings.allKeys();
}


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


void AboutInfo::load(QSettings &settings){
    // Pull the settings out of the settings file
    // if no setting set default value
    //
    qInfo() << "AppName:"         << settings.value("AppSettings/AppName").toString();
    qInfo() << "SoftwarVersion:"  << settings.value("AppSettings/SoftwarVersion").toString();
    qInfo() << "DatabaseVersion:" << settings.value("AppSettings/DatabaseVersion").toString();
    qInfo() << "DataDir:"         << settings.value("AppSettings/DataDir").toString();
}

QString AboutInfo::softwareVersion() const
{
    return m_softwareVersion;
}

void AboutInfo::setSoftwareVersion(const QString &newSoftwareVersion)
{
    m_softwareVersion = newSoftwareVersion;
}

QString AboutInfo::databaseVersion() const
{
    return m_databaseVersion;
}

void AboutInfo::setDatabaseVersion(const QString &newDatabaseVersion)
{
    m_databaseVersion = newDatabaseVersion;
}

QString AboutInfo::dataDir() const
{
    return m_dataDir;
}

void AboutInfo::setDataDir(const QString &newDataDir)
{
    m_dataDir = newDataDir;
}

QString AboutInfo::appName() const
{
    return m_appName;
}

void AboutInfo::setAppName(const QString &newAppName)
{
    m_appName = newAppName;
}
