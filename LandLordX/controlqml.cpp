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


    for(auto xuHao :m_game->player[0]->shouPai)
    {
        Json::Value item;
        item["shouPai"] = xuHao;
        qmlValue.append(item);
    }

    m_shouPai = QString::fromStdString(qmlValue.toStyledString());
    return m_shouPai;
}

void ControlQml::setXuanZePai(int xuHao)
{
    m_game->player[0]->xuanZePai.AddPokersXuhao(xuHao);

    shuaXinShouPai();

}

void ControlQml::rmXuanZePai(int xuHao)
{
    m_game->player[0]->xuanZePai.DeletpokersXuhao(xuHao);

    shuaXinShouPai();
}

void ControlQml::chuPai()
{
    m_game->ChuPai();

    shuaXinShouPai();
    shuaXinChuPaiQu0();

}

void ControlQml::buChu()
{
    m_game->GuoPai();
}

void ControlQml::pc1ChuPai()
{
    m_game->ChuPai();

    shuaXinChuPaiQu1();
}

void ControlQml::pc2ChuPai()
{
    m_game->ChuPai();

    shuaXinChuPaiQu2();
}

bool ControlQml::buchuBiaozhi1()
{
    return m_game->player[1]->buChu;
}

bool ControlQml::buchuBiaozhi2()
{
    return m_game->player[2]->buChu;
}

void ControlQml::shuaXinShouPai()
{
    Json::Value qmlValueShouPai;

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
        qmlValue.append(item);
    }

    QString result = QString::fromStdString(qmlValue.toStyledString());

    return result;
}

QString ControlQml::showChuPaiQu0()
{
    Json::Value qmlValue;

    for(auto xuHao :m_game->player[0]->daChuPai.pokersXuhao)
    {
        Json::Value item;
        item["daChuPai0"] = xuHao;
        qmlValue.append(item);
    }

    m_chuPaiQu0 = QString::fromStdString(qmlValue.toStyledString());

    return m_chuPaiQu0;
}

QString ControlQml::showChuPaiQu1()
{
    Json::Value qmlValue;

    for(auto xuHao :m_game->player[1]->daChuPai.pokersXuhao)
    {
        Json::Value item;
        item["daChuPai1"] = xuHao;
        qmlValue.append(item);
    }

    m_chuPaiQu1 = QString::fromStdString(qmlValue.toStyledString());
    return m_chuPaiQu1;
}

QString ControlQml::showChuPaiQu2()
{
    Json::Value qmlValue;

    for(auto xuHao :m_game->player[2]->daChuPai.pokersXuhao)
    {
        Json::Value item;
        item["daChuPai2"] = xuHao;
        qmlValue.append(item);
    }

    m_chuPaiQu2 = QString::fromStdString(qmlValue.toStyledString());
    return m_chuPaiQu2;
}

QString ControlQml::chongZhiChuPaiQu()
{
    Json::Value qmlValue;

    for(int i=0; i<10; i++)
    {
        int xuHao = -1;
        Json::Value item;
        item["daChuPai"] = xuHao;
        qmlValue.append(item);
    }

    m_chongZhiChuPai = QString::fromStdString(qmlValue.toStyledString());
    return m_chongZhiChuPai;
}

QString ControlQml::chongZhiShouPaiQu()
{
    Json::Value qmlValue;

    for(int i=0; i<20; i++)
    {
        int xuHao = -1;
        Json::Value item;
        item["shouPai"] = xuHao;
        qmlValue.append(item);
    }

    m_chongZhiShouPai = QString::fromStdString(qmlValue.toStyledString());
    return m_chongZhiShouPai;
}

int ControlQml::showShouPaiNum()
{
    return m_game->player[0]->shouPai.size();
}

