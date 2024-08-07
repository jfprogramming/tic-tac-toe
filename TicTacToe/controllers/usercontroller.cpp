#include "usercontroller.h"
#include "src/models/usermodel.h"

UserController::UserController(QObject* parent) : QObject(parent)
{
    // Initialize any necessary data or perform setup here
    m_userModel = new UserModel(this); // Create an instance of UserModel


    // Connect signals to database update functions
    connect(m_userModel, &UserModel::userNameChanged, this, &UserController::updateUserNameInDatabase);
    connect(m_userModel, &UserModel::userAgeChanged, this, &UserController::updateUserAgeInDatabase);

}

bool UserController::updateUserNameInDatabase(QString &name)
{
    int id = 1;
    return databasecontroller.setUserName(id, name);
}

bool UserController::updateUserAgeInDatabase(int &age)
{
    int id =1;
    return databasecontroller.setUserAge(id, QString::number(age));
}

UserModel* UserController::userModel() const
{
    return m_userModel;
}
