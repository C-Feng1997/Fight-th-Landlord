#include "pokerszuhe.h"

//初始化所有属性
PokersZuHe::PokersZuHe() : type{WeiZhi}, quanZhi(0), yuanSuNum(0)
{
}

//重载构造函数用来满足参数初始化
PokersZuHe::PokersZuHe(Type typeNow, int quanZhiNow) : type{typeNow}, quanZhi(quanZhiNow), yuanSuNum(0)
{
}

//重载'='运算符来满足PokersZuHe类型复制构造
PokersZuHe &PokersZuHe::operator =(PokersZuHe &pokersZuHe)
{
    pokerQuanZhi = pokersZuHe.pokerQuanZhi;
    pokersXuhao = pokersZuHe.pokersXuhao;
    type = pokersZuHe.type;
    quanZhi = pokersZuHe.quanZhi;
    yuanSuNum = pokersZuHe.yuanSuNum;
}

//添加1张以序号表示的牌
void PokersZuHe::AddPokersXuhao(int xuHao)
{
    ++yuanSuNum;    //该牌型结构的牌数目（元素）加1
    pokersXuhao.insert(xuHao);  //序号集合中加入该牌序号
    ++pokerQuanZhi[ZhuanQuanZhi(xuHao)];     //权值集合中加入该牌的权值
}

//去掉1张以序号表示的牌
void PokersZuHe::DeletpokersXuhao(int xuHao)
{

    if (pokersXuhao.find(xuHao) == pokersXuhao.end())
    {
        //若没找到该序号的牌则返回
        return;
    } else {

        //若找到了该序号的牌
        //则从序号集合中抹去该牌序号
        //且该牌型结构的数目（元素）减1
        pokersXuhao.erase(xuHao);
        --yuanSuNum;

        //如果该序号对应权值集合的牌数目为1
        //则在权值集合中抹掉该牌权值（元素）
        if(pokerQuanZhi[ZhuanQuanZhi(xuHao)] == 1)//获取该序号对应权值集合中该牌数目,若等于1；
        {
            //直接从权值集合中抹掉该权值对应牌
            pokerQuanZhi.erase(ZhuanQuanZhi(xuHao));
        } else {
            //若不等于1则在该权值集合中，将对应权值的牌的数目减1
            --pokerQuanZhi[ZhuanQuanZhi(xuHao)];
        }
    }


}

//重置此结构,所有属性值情况
void PokersZuHe::Clear()
{
    pokersXuhao.clear();
    pokerQuanZhi.clear();
    type = WeiZhi;
    quanZhi = 0;
    yuanSuNum = 0;
}

//权值转换函数，把0-53转换成3-17权值
int PokersZuHe::ZhuanQuanZhi(int xuHao)
{
    //当牌序号小于52时（不是小王，大王）
    if(xuHao < 52)
    {
        return xuHao/4 + 3;
    }else{
        //当牌序号是52和53时（大王和小王）
        return xuHao - 36;
    }
}

