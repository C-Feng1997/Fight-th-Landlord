#include "pokers.h"
#include <QRandomGenerator>

#include <stdexcept>

Pokers::Pokers()
{
    for(int bianHao = 0; bianHao!= 54; ++bianHao)
    {
        pokers[bianHao] = bianHao;  //将牌编号组内元素依次初始化为0-53
        qPokers[bianHao] = bianHao;
    }
    XiPai();
}

//洗牌
void Pokers::XiPai()
{
    //QRandomGenerator::global()->bounded(0,53)
    //Qt随机数引擎生成在0-53范围内的随机整数

     for(int i = 0; i< 54; i++)
     {
         //交换两张牌顺序
         int meiJie = pokers[i];
         pokers[i] = pokers[QRandomGenerator::global()->bounded(0,53)];
         pokers[QRandomGenerator::global()->bounded(0,53)] = meiJie;
     }
     //重置牌堆剩余牌数量
     shengYu = 54;
}


//抹牌
int Pokers::MoPai()
{
    //检测牌堆没有剩余牌情况
    if(!shengYu)
        throw std::runtime_error("没有更多的牌在牌堆!");

    //摸1张牌从牌堆pokers中抹掉1张牌
    //并在牌堆中将牌堆数目减1
    return pokers[--shengYu];
}

//int Pokers::QmlBangDing()
//{
//    for(int i=0; i!=54; i++)
//    {
//        for (;;) {

//        }
//    }

//}

//int Pokers::FindXuhao()
//{
//    for (;;) {

//    }
//}


