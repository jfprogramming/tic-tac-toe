#include "aboutinfo.h"

AboutInfo::AboutInfo(QObject *parent)
    : QObject(parent), m_settings(m_settingsFilePath, QSettings::IniFormat)
{
}

QString AboutInfo::getAppName() const
{
    return m_settings.value("AppSettings/AppName", "TicTacToe").toString();
}

QString AboutInfo::getSoftwareVersion() const
{
    return m_settings.value("AppSettings/SoftwareVersion", "1.0").toString();
}

QString AboutInfo::getDatabaseVersion() const
{
    return m_settings.value("AppSettings/DatabaseVersion", "0.0.1").toString();
}

QString AboutInfo::getDataDir() const
{
    return m_settings.value("AppSettings/DataDir", "/Data").toString();
}

QDateTime AboutInfo::getDateTime() const
{
    return m_settings.value("dateTime", QDateTime::currentDateTime()).toDateTime();
}
