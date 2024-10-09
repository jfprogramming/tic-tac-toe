#pragma once

#include <QObject>
#include <QSettings>
#include <QString>
#include <QDateTime>

class SystemSettings : public QObject
{
    Q_OBJECT
public:
    explicit SystemSettings(QObject *parent = nullptr);
    ~SystemSettings();

    QString getAppName() const;
    void setAppName(const QString &appName);

    QString getSoftwareVersion() const;
    void setSoftwareVersion(const QString &softwareVersion);

    QString getDateTime() const;
    void setDateTime(const QDateTime &dateTime);

private:
    QString m_settingsFilePath="/data/config/settings.ini";
    QSettings m_settingsFile;

};
