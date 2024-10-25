#pragma once

#include <QObject>
#include <QSettings>
#include <QString>
#include <QDateTime>

class SystemSettings : public QObject
{
    Q_OBJECT
public:
    explicit SystemSettings(QThread* home = NULL, QObject *parent = NULL);
    ~SystemSettings();

    QString getAppName() const;
    void setAppName(const QString &appName);

    QString getSoftwareVersion() const;
    void setSoftwareVersion(const QString &softwareVersion);

    Q_INVOKABLE QString getDateFormat() const;
    Q_INVOKABLE void setDateFormat(const QString &dateFormat);

    Q_INVOKABLE QString getTime() const;
    Q_INVOKABLE void setTime(const QDateTime &dateTime);


    Q_INVOKABLE QString getDate() const;
    Q_INVOKABLE void setDate(const QDateTime &dateTime);

    Q_INVOKABLE QString getDateTime() const;
    Q_INVOKABLE void setDateTime(const QDateTime &dateTime);

private:
    QString   m_settingsFilePath="/data/config/settings.ini";
    QSettings m_settingsFile;
    QString   m_dateFormate;

};
