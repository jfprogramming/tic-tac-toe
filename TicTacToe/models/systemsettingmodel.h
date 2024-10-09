#ifndef SYSTEMSETTINGMODEL_H
#define SYSTEMSETTINGMODEL_H

#include <QObject>

class SystemSettingModel : public QObject
{
    Q_OBJECT
public:
    explicit SystemSettingModel(QObject *parent = nullptr);

signals:
};

#endif // SYSTEMSETTINGMODEL_H
