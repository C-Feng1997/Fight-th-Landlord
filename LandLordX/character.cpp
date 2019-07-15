#include "character.h"

#include <QTextStream>

Character::Character() :
    mUserName("玩家"), mAvatar("qrc:/images/touxiang/touxiang1.png")
{

}

QString Character::userName() const
{
    return mUserName;
}

void Character::setUserName(const QString &userName)
{
    mUserName = userName;
}

QString Character::avatar() const
{
    return mAvatar;
}

void Character::setAvatar(const QString &avatar)
{
    mAvatar = avatar;
}

void Character::read(const QJsonObject &json)
{
    if(json.contains("userName")&&json["userName"].isString())
        mUserName = json["userName"].toString();
    if(json.contains("avatar")&&json["avatar"].isString())
        mAvatar = json["avatar"].toString();
}

void Character::write(QJsonObject &json) const
{
    json["userName"] = mUserName;
    json["avatar"] = mAvatar;
}

void Character::print(int indentation) const
{
    const QString indent(indentation * 2, ' ');
    QTextStream(stdout) << indent << "UserName:\t" << mUserName << "\n";
    QTextStream(stdout) << indent << "Avatar:\t" << mAvatar << "\n";
}
