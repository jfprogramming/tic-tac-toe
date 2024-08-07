#pragma once
#include <QObject>
#include "src/controllers/databasecontroller.h"
#include "src/models/usermodel.h"

class UserController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(UserModel* userModel READ userModel CONSTANT)

public:
    explicit UserController(QObject* parent = nullptr);

    UserModel* userModel() const;

    DatabaseController databasecontroller;

    bool updateUserNameInDatabase(QString &name);
    bool updateUserAgeInDatabase(int &age);

private:
    UserModel* m_userModel;
};
