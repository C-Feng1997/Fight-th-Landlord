#ifndef SHOUPAI_H
#define SHOUPAI_H

#include <QObject>
#include "player.h"
#include  "game.h"

class ShouPai : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList <int> ShouPaiQml READ ShouPaiQml)

public:
    ShouPai();
    QList<int> ShouPaiQml();


private:
    QList<int> shouPaiQml;


    Game *m_game;
};

#endif // SHOUPAI_H
