// playermodel.h
#pragma once
#include <QObject>

class PlayerModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(int userAge READ userAge WRITE setUserAge NOTIFY userAgeChanged)

public:
    explicit PlayerModel(QObject* parent = nullptr);

    QString userName() const;
    void setUserName(QString& name);

    int userAge() const;
    void setUserAge(int &age);

     Q_INVOKABLE void saveToDatabase();

signals:
    void userNameChanged(QString &name);
    void userAgeChanged(int &age);

public slots:
    void onFormEntry(QString& name, int& age);


private:
    QString m_userName;
    int m_userAge;
};
