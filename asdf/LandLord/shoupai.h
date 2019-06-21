#ifndef SHOUPAI_H
#define SHOUPAI_H

#include <QObject>
#include "player.h"
#include  "game.h"

class ShouPai : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList <int> ShouPaiQml READ ShouPaiQml)
//    Q_PROPERTY(QList <int> DiZhuPaiQml READ DiZhuPaiQml)
public:
    ShouPai();
    QList<int> ShouPaiQml();
    QList<int> DiZhuPaiQml();

private:
    QList<int> shouPaiQml;
    QList<int> diZhuPaiQml;

    Game *m_game;
};

#endif // SHOUPAI_H
