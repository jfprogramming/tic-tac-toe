#include "playermodel.h"
#include <QDebug>


PlayerModel::PlayerModel(QObject* parent) : QObject(parent)
{
    // Initialize any necessary data or perform setup here
}

QString PlayerModel::userName() const
{
    return m_userName;
}

void PlayerModel::setUserName(QString& name)
{
    if (m_userName != name)
    {
        m_userName = name;
        emit userNameChanged(name);
    }

    qInfo() << __FUNCTION__ << __LINE__ << "name:" << name;
}

int PlayerModel::userAge() const
{
    return m_userAge;
}

void PlayerModel::setUserAge(int& age)
{
    if (m_userAge != age)
    {
        m_userAge = age;
        emit userAgeChanged(age);
    }

    qInfo() << __FUNCTION__ << __LINE__ << "age:" << age;
}

void PlayerModel::onFormEntry(QString& name, int& age){
    if (m_userName != name)
    {
        m_userName = name;
        emit userNameChanged(name);
    }

    qInfo() << __FUNCTION__ << __LINE__ << "name:" << name;

    if (m_userAge != age)
    {
        m_userAge = age;
        emit userAgeChanged(age);
    }

    qInfo() << __FUNCTION__ << __LINE__ << "age:" << age;

}

void PlayerModel::saveToDatabase(){
    // TODO call to database controller to save to db
}

