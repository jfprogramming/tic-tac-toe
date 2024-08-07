#pragma once
#include <QObject>

class PlayerManger : public QObject
{
    Q_OBJECT
public:
    explicit PlayerManger(QObject *parent = nullptr);

    QString getPlayerName() const;
    QString getPlayerColor() const;

public slots:
    void setPlayerName(const QString &newPlayerName);
    void setPlayerColor(const QString &newPlayerColor);

signals:


private:
    QString playerName;
    QString playerColor;

};
