#pragma once

#include <QObject>
#include <QSettings>
#include <QString>
#include <QDateTime>

class FileManager : public QObject
{
    Q_OBJECT
public:
    explicit FileManager(QObject *parent = nullptr);
    ~FileManager();

    QString getAppName() const;
    void setAppName(const QString &appName);

    QString getSoftwareVersion() const;
    void setSoftwareVersion(const QString &softwareVersion);

    QDateTime getDateTime() const;
    void setDateTime(const QDateTime &dateTime);

private:
    QSettings m_settingsFile;
    QString m_settingsFilePath="/data/config/settings.ini";
};
