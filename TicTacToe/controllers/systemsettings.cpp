#include "systemsettings.h"

SystemSettings::SystemSettings(QObject* parent)
    : QObject(parent), settings("YourOrganization", "YourAppName") {}

void SystemSettings::setDateTimeSettings(const QString& dateTime) {
    settings.setValue("dateTime", dateTime);
}

QString SystemSettings::getDateTimeSettings() const {
    return settings.value("dateTime", "").toString();
}
