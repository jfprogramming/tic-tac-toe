#pragma once

#include <QObject>
#include <QSettings>
#include <QString>
#include <QDateTime>


/**
 * \file AboutInfo.h
 *
 * \brief The AboutInfo class manages application information.
 *        Handles saving, loading, and displaying application settings.
 *        Provides interface for About screen details.
 */
class AboutInfo : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString appName READ getAppName NOTIFY dataChanged)
    Q_PROPERTY(QString softwareVersion READ getSoftwareVersion NOTIFY dataChanged)
    Q_PROPERTY(QString databaseVersion READ getDatabaseVersion NOTIFY dataChanged)
    Q_PROPERTY(QString dataDir READ getDataDir NOTIFY dataChanged)
    Q_PROPERTY(QDateTime dateTime READ getDateTime NOTIFY dataChanged)

public:
    explicit AboutInfo(QObject *parent = nullptr);

    QString getAppName() const;
    QString getSoftwareVersion() const;
    QString getDatabaseVersion() const;
    QString getDataDir() const;
    QDateTime getDateTime() const;

signals:
    void dataChanged();

private:
    QSettings m_settings;
    QString m_settingsFilePath = "/data/config/settings.ini";
};
