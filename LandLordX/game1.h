#ifndef GAME1_H
#define GAME1_H

#include <QObject>
#include <QJsonObject>

#include "character.h"

class Game1 : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Character *player READ player WRITE setPlayer)

public:
    Game1();
    Q_INVOKABLE bool loadGame();
    Q_INVOKABLE bool saveGame() const;

    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;

    void print(int indentation = 0) const;

    Character *player() const;
    void setPlayer(Character *player);

private:
    Character *mPlayer;
};

#endif // GAME1_H
