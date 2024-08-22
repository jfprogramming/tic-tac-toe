#include "playermodel.h"
#include <QDebug>


PlayerModel::PlayerModel(QObject* parent) : QObject(parent)
{
    // Initialize any necessary data or perform setup here
}

void PlayerModel::onFormEntry(QString& name, QString& color){
    if (m_playerName != name)
    {
        m_playerName = name;
        emit userNameChanged(name);
    }

    qInfo() << __FUNCTION__ << __LINE__ << "player name:" << name;

    if (m_playerColor != color)
    {
        m_playerColor = color;
        emit userAgeChanged(color);
    }

    qInfo() << __FUNCTION__ << __LINE__ << "player color:" << color;

}

QString PlayerModel::playerColor() const
{
    return m_playerColor;
}

void PlayerModel::setPlayerColor(QString& newPlayerColor)
{
    if (m_playerColor == newPlayerColor)
        return;
    m_playerColor = newPlayerColor;
    emit playerColorChanged();
}

QString PlayerModel::playerName() const
{
    return m_playerName;
}

void PlayerModel::setPlayerName(const QString &newPlayerName)
{
    if (m_playerName == newPlayerName)
        return;
    m_playerName = newPlayerName;
    emit playerNameChanged(m_playerName, m_playerColor);
}

void PlayerModel::saveToDatabase(){
    // TODO call to database controller to save to db
}

