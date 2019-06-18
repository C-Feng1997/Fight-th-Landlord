/*Player：玩家
 * 属性：手牌集合、手牌牌型集合、选牌集合、出牌集合、是否不出牌、玩家总分数；
 * 接口：包括分析叫地主分数、分析手牌、选牌、分析是否出牌（或跟牌）等。
*/
#ifndef PLAYER_H
#define PLAYER_H


#include <set>
#include <vector>
#include "pokerszuhe.h"

class Game;

class Player
{
    friend class Game;
public:
    Player(Game &gameNow);

    void NewGame(); //开始新的一局游戏，做一些初始化Player的操作
    void clearChaiFenPai(); //清空拆分牌的集合
    inline void DePai(int xuHao) {shouPai.insert(xuHao);}   //用户得对应序号的牌
    bool CompareMyself(PokersZuHe *p1, PokersZuHe*p2);  //AI由场上牌比较自己的牌，查看是否有可以出的牌
    void AiXuanPai();  //AI选牌
    void FenXiChaiFenZuHe();    //分析并拆分牌型
    void DeleteZeroQuanZhi_shuLiang(std::map<int,int> &quanZhi_shuLiang);   //删除 权值_集合 中数量为零的元素

    //给一个权值，从手牌副本中找到相应的序号，然后从集合中删除并返回该序号；若未找到或无效则返回-1
    int FindXuHao(std::set<int> &shouPaiFuBen, int quanZhi);

private:
    Game &game;                             //游戏对象
    bool buChu;                             //不出标志
    std::set<int> shouPai;                  //手牌
    std::vector<PokersZuHe*> chaiFenPai;    //分析手牌后拆分的牌的集合
    PokersZuHe xuanZePai;                   //选择的牌的集合
    PokersZuHe daChuPai;                    //打出的牌的集合
};

#endif // PLAYER_H
