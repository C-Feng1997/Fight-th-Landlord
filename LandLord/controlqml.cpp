#include "controlqml.h"

#include <string>
#include <vector>
#include <QList>
#include <qdebug.h>
#include <iostream>

ControlQml::ControlQml()
{
    m_game = new Game();
    m_game->GameStart();
}

QList<int> ControlQml::ShouPaiQml()
{


    for(auto s : m_game->player[0]->shouPai)
    {
        shouPaiQml.push_back(s);
    }

    return shouPaiQml;
}

QList<int> ControlQml::DiZhuPaiQml()
{
    for(auto s :m_game->diZhuPaiQu)
        diZhuPaiQml.push_back(s);
    return diZhuPaiQml;
}

QString ControlQml::showShouPai()
{
    Json::Value qmlValue;
    Json::Value root;
    Json::Value arry;


    for(auto xuHao :m_game->player[0]->shouPai)
    {
        Json::Value item;
        item["shouPai"] = xuHao;
        arry.append(item);
    }

    qmlValue = arry;
    m_shouPai = QString::fromStdString(qmlValue.toStyledString());
    return m_shouPai;
}

void ControlQml::setXuanZePai(int xuHao)
{
    std::cout << "xuHaoset:"<< xuHao <<std::endl;
    m_game->player[0]->xuanZePai.AddPokersXuhao(xuHao);
    //    for(auto xuHao :m_game->player[0]->xuanZePai.pokersXuhao)
    //    {

    //        std::cout << "pokers:"<< xuHao <<std::endl;
    //    }

    shuaXinShouPai();

}

void ControlQml::rmXuanZePai(int xuHao)
{
    std::cout << "xuHaorm:"<< xuHao <<std::endl;
    m_game->player[0]->xuanZePai.DeletpokersXuhao(xuHao);
    //    for(auto xuHao :m_game->player[0]->xuanZePai.pokersXuhao)
    //    {

    //        std::cout << "pokersrm:"<< xuHao <<std::endl;
    //    }
    shuaXinShouPai();
}

void ControlQml::chuPai()
{
    m_game->dangQian = m_game->player[0];
    m_game->ChuPai();

    shuaXinShouPai();
    shuaXinChuPaiQu0();

}

void ControlQml::pcChuPai()
{
    m_game->dangQian = m_game->player[1];
    m_game->ChuPai();

    shuaXinChuPaiQu1();

    m_game->dangQian = m_game->player[2];
    m_game->ChuPai();

    shuaXinChuPaiQu2();
}

void ControlQml::shuaXinShouPai()
{
    Json::Value qmlValueShouPai;

    //    Json::Value arry;
    m_shouPai = "";

    for(auto xuHao :m_game->player[0]->shouPai)
    {
        Json::Value item;
        item["shouPai"] = xuHao;
        qmlValueShouPai.append(item);

    }

    m_shouPai = QString::fromStdString(qmlValueShouPai.toStyledString());
}

void ControlQml::shuaXinChuPaiQu0()
{

    Json::Value qmlValuecpQu0;

    m_chuPaiQu0 = "";

    for(auto xuHao :m_game->player[0]->daChuPai.pokersXuhao)
    {
        Json::Value item;
        item["daChuPai0"] = xuHao;
        qmlValuecpQu0.append(item);

    }

    m_chuPaiQu0 = QString::fromStdString(qmlValuecpQu0.toStyledString());

}

void ControlQml::shuaXinChuPaiQu1()
{
    Json::Value qmlValuecpQu1;

    m_chuPaiQu1 = "";

    for(auto xuHao :m_game->player[1]->daChuPai.pokersXuhao)
    {
        Json::Value item;
        item["daChuPai1"] = xuHao;
        qmlValuecpQu1.append(item);

    }

    m_chuPaiQu1 = QString::fromStdString(qmlValuecpQu1.toStyledString());
}

void ControlQml::shuaXinChuPaiQu2()
{
    Json::Value qmlValuecpQu2;

    m_chuPaiQu2 = "";

    for(auto xuHao :m_game->player[2]->daChuPai.pokersXuhao)
    {
        Json::Value item;
        item["daChuPai2"] = xuHao;
        qmlValuecpQu2.append(item);

    }

    m_chuPaiQu2 = QString::fromStdString(qmlValuecpQu2.toStyledString());
}


QString ControlQml::showDiZhuPaiQu()
{
    Json::Value qmlValue;
    Json::Value root;
    Json::Value arry;

    for(auto xuHao :m_game->diZhuPaiQu)
    {
        Json::Value item;
        item["diZhuPaiQu"] = xuHao;
        arry.append(item);
    }
    qmlValue = arry;
    //    QString result = QString::fromStdString(qmlValue.toStyledString());
    QString result = QString::fromStdString(qmlValue.toStyledString());
    //    qDebug() << result;
    return result;
}

QString ControlQml::showChuPaiQu0()
{
    Json::Value qmlValue;
    Json::Value root;
    Json::Value arry;
    for(auto xuHao :m_game->player[0]->daChuPai.pokersXuhao)
    {
        Json::Value item;
        item["daChuPai0"] = xuHao;
        arry.append(item);
    }
    qmlValue = arry;
    QString result = QString::fromStdString(qmlValue.toStyledString());

    m_chuPaiQu0 = result;
    return m_chuPaiQu0;
}

QString ControlQml::showChuPaiQu1()
{
    Json::Value qmlValue;
    Json::Value root;
    Json::Value arry;
    for(auto xuHao :m_game->player[1]->daChuPai.pokersXuhao)
    {
        Json::Value item;
        item["daChuPai1"] = xuHao;
        arry.append(item);
        std::cerr << "chuPai1:" <<std::endl;
        //        std::cout << xuHao <<std::endl;
    }
    qmlValue = arry;
    QString result = QString::fromStdString(qmlValue.toStyledString());
    m_chuPaiQu1 = result;
    return m_chuPaiQu1;
}

QString ControlQml::showChuPaiQu2()
{
    Json::Value qmlValue;
    Json::Value root;
    Json::Value arry;
    for(auto xuHao :m_game->player[2]->daChuPai.pokersXuhao)
    {
        Json::Value item;
        item["daChuPai2"] = xuHao;
        arry.append(item);
    }
    qmlValue = arry;
    QString result = QString::fromStdString(qmlValue.toStyledString());
    m_chuPaiQu2 = result;
    return m_chuPaiQu2;
}

int ControlQml::showShouPaiNum()
{
    //    std::cout << m_game->player[0]->shouPai.size() << std::endl;
    return m_game->player[0]->shouPai.size();
}

