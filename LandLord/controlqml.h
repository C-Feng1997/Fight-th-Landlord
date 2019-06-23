#ifndef CONTROLQML_H
#define CONTROLQML_H

#include <QObject>
#include <QString>
#include "player.h"
#include  "game.h"
#include <json/json.h>

class ControlQml :public QObject
{
    Q_OBJECT
//    Q_PROPERTY(void setShouPai READ setShouPai WRITE setShouPai)
    Q_PROPERTY(QList <int> DiZhuPaiQml READ DiZhuPaiQml)


public:
    Q_INVOKABLE QString showShouPai();
    Q_INVOKABLE QString showDiZhuPaiQu();
    Q_INVOKABLE QString showChuPaiQu0();
    Q_INVOKABLE QString showChuPaiQu1();
    Q_INVOKABLE QString showChuPaiQu2();
    Q_INVOKABLE int  showShouPaiNum();
    Q_INVOKABLE void setXuanZePai(int xuHao);
    Q_INVOKABLE void rmXuanZePai(int xuHao);
    Q_INVOKABLE void chuPai();
    Q_INVOKABLE void pcChuPai();


    void shuaXinShouPai();
    void shuaXinChuPaiQu0();
    void shuaXinChuPaiQu1();
    void shuaXinChuPaiQu2();

    ControlQml();
    QList<int> ShouPaiQml();
    QList<int> DiZhuPaiQml();

private:
    QList<int> shouPaiQml;
    QList<int> diZhuPaiQml;

    QString m_shouPai;
    QString m_chuPaiQu0;
    QString m_chuPaiQu1;
    QString m_chuPaiQu2;
    Game *m_game;
};

#endif // CONTROLQML_H
