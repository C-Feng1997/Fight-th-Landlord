/*
 * Pokers：一副扑克牌。
 * 接口：洗牌、抹牌及剩余牌数。
 */

#ifndef POKERS_H
#define POKERS_H

//发牌堆类
class Pokers
{

    friend class Player;
    friend class Game;
    friend class ControlQml;
public:
    Pokers( );
    void XiPai( );      //洗牌
    int MoPai( ); //抹牌
    inline int GetShengYu( ){return shengYu;}

private:
    int pokers[54]; //牌编号组--牌堆
    int shengYu;    //剩余牌数量
    int qPokers[54];    //牌堆副本用于绑定qm};
};
#endif // POKERS_H
