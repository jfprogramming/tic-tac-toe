#pragma once
#include <QObject>
#include <QMap>


// Player data structure holds player data
//
struct Player
{
    int id;
    QString name;
    QString color;
    int highScore;
};


/**
 * \file adminplayermodel.h
 *
 * \brief The AdminPlayerModel class handles admin operations and player data management.
 */
class AdminPlayerModel : public QObject
{
    Q_OBJECT

public:
    explicit AdminPlayerModel(QObject* parent = nullptr);

signals:
    void playerDataChanged();

    void checkAdminLogin();

public slots:
    bool onAdminLogin(const QString &username, const QString &password);
    void savePlayerToDatabase(const QString &name, const QString &color);
    void lookupPlayer(const QString &name);

    QList<Player> getAllPlayers();

private:
    QMap<QString, QString> m_playerData;
};
