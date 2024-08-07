#ifndef PLAYERMANGER_H
#define PLAYERMANGER_H

#include <QObject>

class PlayerManger : public QObject
{
    Q_OBJECT
public:
    explicit PlayerManger(QObject *parent = nullptr);

signals:
};

#endif // PLAYERMANGER_H
