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
    Q_INVOKABLE QString chongZhiChuPaiQu();
    Q_INVOKABLE QString chongZhiShouPaiQu();

    Q_INVOKABLE int  showShouPaiNum();
    Q_INVOKABLE void setXuanZePai(int xuHao);
    Q_INVOKABLE void rmXuanZePai(int xuHao);
    Q_INVOKABLE void chuPai();
    Q_INVOKABLE void buChu();
    Q_INVOKABLE void pc1ChuPai();
    Q_INVOKABLE void pc2ChuPai();
    Q_INVOKABLE bool buchuBiaozhi1();
    Q_INVOKABLE bool buchuBiaozhi2();
    Q_INVOKABLE int  jieGuo() {return m_game->m_jieGuo;}

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
    QString m_chongZhiChuPai;
    QString m_chongZhiShouPai;

    Game *m_game;

};

#endif // CONTROLQML_H
