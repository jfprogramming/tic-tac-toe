#include "aboutinfo.h"


AboutInfo::AboutInfo(QObject *parent): QObject(parent)
{
    qDebug() << "AboutInfo object created.";
}

AboutInfo::~AboutInfo()
{
    qDebug() << "AboutInfo object destroyed.";
}

QString AboutInfo::getAppName() const
{
    return m_settingsManager.getAppName();
}

QString AboutInfo::getSoftwareVersion() const
{
    return m_settingsManager.getSoftwareVersion();
}


QDateTime AboutInfo::getDateTime() const
{
    return m_settingsManager.getDateTime();
}
