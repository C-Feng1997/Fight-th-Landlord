#include "game1.h"

#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QRandomGenerator>
#include <QTextStream>

Game1::Game1()
{
    mPlayer = new Character;
}

bool Game1::loadGame()
{
    QFile loadFile(QStringLiteral("save.json"));

    if (!loadFile.open(QIODevice::ReadOnly)) {
        qWarning("Couldn't open save file.");
        return false;
    }

    QByteArray saveData = loadFile.readAll();

    QJsonDocument loadDoc(QJsonDocument::fromJson(saveData));

    read(loadDoc.object());

    return true;
}

bool Game1::saveGame() const
{
    QFile saveFile(QStringLiteral("save.json"));

    if (!saveFile.open(QIODevice::WriteOnly)) {
        qWarning("Couldn't open save file.");
        return false;
    }

    QJsonObject gameObject;
    write(gameObject);
    QJsonDocument saveDoc(gameObject);
    saveFile.write(saveDoc.toJson());

    return true;
}

void Game1::read(const QJsonObject &json)
{
    if (json.contains("player") && json["player"].isObject())
        mPlayer->read(json["player"].toObject());
}

void Game1::write(QJsonObject &json) const
{
    QJsonObject playerObject;
    mPlayer->write(playerObject);
    json["player"] = playerObject;
}

void Game1::print(int indentation) const
{
    const QString indent(indentation * 2, ' ');
    QTextStream(stdout) << indent << "Player\n";
    mPlayer->print(indentation + 1);
}

Character *Game1::player() const
{
    return mPlayer;
}

void Game1::setPlayer(Character *player)
{
    mPlayer = player;
}

