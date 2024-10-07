#pragma once

#include <QObject>
#include <QSettings>

class SystemSettings : public QObject {
    Q_OBJECT
public:
    explicit SystemSettings(QObject* parent = nullptr);

    Q_INVOKABLE void setDateTimeSettings(const QString& dateTime);
    Q_INVOKABLE QString getDateTimeSettings() const;

private:
    QSettings settings;
};

