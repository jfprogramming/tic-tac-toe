#pragma once
#include <QObject>

class PlayerModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString playerName READ playerName WRITE setPlayerName NOTIFY playerNameChanged FINAL)
    Q_PROPERTY(QString playerColor READ playerColor WRITE setPlayerColor NOTIFY playerColorChanged FINAL)


public:
    explicit PlayerModel(QObject* parent = nullptr);

    QString playerColor() const;
    QString playerName() const;

    Q_INVOKABLE void saveToDatabase();

 signals:
    void userNameChanged(QString &name);
    void userAgeChanged(QString &age);
    void playerColorChanged();
    void playerNameChanged();

public slots:
    void onFormEntry(QString& name, QString &color);
    void setPlayerColor(QString &newPlayerColor);
    void setPlayerName(const QString &newPlayerName);

private:
    QString m_playerName;
    QString m_playerColor;
};
