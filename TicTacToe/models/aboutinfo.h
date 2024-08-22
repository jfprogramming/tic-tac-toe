#pragma once
#include <QObject>
#include <QSettings>

class AboutInfo :  public QObject
{
    Q_OBJECT
public:
    AboutInfo(QObject* parent = nullptr);
    ~AboutInfo();

    void save(QSettings &settings);
    void info(QSettings &settings);
    void load(QSettings &settings);

    QString softwareVersion() const;

    QString databaseVersion() const;

    QString dataDir() const;

    QString appName() const;

public slots:
    void setSoftwareVersion(const QString &newSoftwareVersion);

    void setDatabaseVersion(const QString &newDatabaseVersion);

    void setDataDir(const QString &newDataDir);

    void setAppName(const QString &newAppName);

private:
    QString m_settingFileName="/data/config/settings.ini";
    QString m_softwareVersion;
    QString m_databaseVersion;
    QString m_dataDir;
    QString m_appName;

};

