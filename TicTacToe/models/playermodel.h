#pragma once
#include <QObject>

/**
 * @file PlayerModel.h
 *
 * @brief The PlayerModel class manages player data.
 *        Handles player name and color information.
 *        Provides interface for setting and retrieving player details.
 */
class PlayerModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString playerName READ playerName WRITE setPlayerName NOTIFY playerNameChanged FINAL)
    Q_PROPERTY(QString playerColor READ playerColor WRITE setPlayerColor NOTIFY playerColorChanged FINAL)


public:
    explicit PlayerModel(QObject* parent = nullptr);

    QString playerColor() const;
    QString playerName() const;

    //Q_INVOKABLE void saveToDatabase(QString &name, QString &color);

 signals:
    //void loginBtnClicked(QString username, QString password);
    void userNameChanged(QString &name);
    void userAgeChanged(QString &age);
    void playerColorChanged();
    void playerNameChanged(const QString &playerName, const QString &playerColor);
    void checkAdminLogin();

public slots:
    bool onAdminLogin(const QString &username, const QString &password);
    void onFormEntry(QString& name, QString &color);
    void setPlayerColor(QString &newPlayerColor);
    void setPlayerName(const QString &newPlayerName);

    void saveToDatabase(QString &name, QString &color);

private:
    QString m_playerName;
    QString m_playerColor;
};
