#pragma once

#include <QObject>
#include <QMap>
#include <qabstractitemmodel.h>


// Player data structure holds player data
//
struct AdminPlayer
{
    int     id;
    QString name;
    QString color;
    int     highScore;
};


/**
 * \file adminplayermodel.h
 *
 * \brief The AdminPlayerModel class handles admin operations and player data management.
 */
class AdminPlayerModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit AdminPlayerModel(QObject* parent = nullptr);

    enum AdminPlayerRoles {
        IdRole = Qt::UserRole + 1,
        NameRole,
        ColorRole,
        HighScoreRole
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

signals:
    void playerDataChanged();

    void checkAdminLogin();

public slots:
    bool onAdminLogin(const QString &username, const QString &password);
    void updatePlayer(const int playerId, const QString &name, const QString &color);

    QList<AdminPlayer> getAllPlayers();

private:
    QMap<QString, QString> m_playerData;
    QList<AdminPlayer> m_allPlayers;
};
