#ifndef CHARACTER_H
#define CHARACTER_H

#include <QJsonObject>
#include <QObject>
#include <QString>

class Character : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString userName READ userName WRITE setUserName)
    Q_PROPERTY(QString avatar READ avatar WRITE setAvatar)
public:
    Character();

    QString userName() const;
    void setUserName(const QString &userName);

    QString avatar() const;
    void setAvatar(const QString &avatar);

    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;

    void print(int indentation = 0) const;

private:
    QString mUserName;
    QString mAvatar;
};
#endif // CHARACTER_H
