#pragma once

#include <QObject>
#include <QSettings>
#include <QString>
#include <QDateTime>
#include "controllers/systemsettings.h"

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

    Q_PROPERTY(QString   appName         READ getAppName         NOTIFY dataChanged)
    Q_PROPERTY(QString   softwareVersion READ getSoftwareVersion NOTIFY dataChanged)
    Q_PROPERTY(QDateTime dateTime        READ getDateTime        NOTIFY dataChanged)

public:
    explicit AboutInfo(QObject *parent = nullptr);
    ~AboutInfo();

    QString   getAppName()         const;
    QString   getSoftwareVersion() const;
    QDateTime getDateTime()        const;

signals:
    void dataChanged();

private:
    QString   m_appName;
    QString   m_softwareVersion;
    QDateTime m_dateTime;

    SystemSettings m_settingsManager;
};
