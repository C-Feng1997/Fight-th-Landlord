/*Player：玩家
 * 属性：手牌集合、手牌牌型集合、选牌集合、出牌集合、是否不出牌、玩家总分数；
 * 接口：包括分析叫地主分数、分析手牌、选牌、分析是否出牌（或跟牌）等。
*/
#ifndef PLAYER_H
#define PLAYER_H


#include <set>
#include <vector>
//#include <QObject>
#include "pokerszuhe.h"

class Game;

class Player
{

    friend class Game;

    friend class ControlQml;
public:
    Player();
    ~Player();
    Player(Game &gameNow);

    void NewGame(); //开始新的一局游戏，做一些初始化Player的操作
    void ClearChaiFenPai(); //清空拆分牌的集合
    inline void DePai(int xuHao) {shouPai.insert(xuHao);}   //用户得对应序号的牌
    static bool CompareMyself(PokersZuHe *p1, PokersZuHe*p2);  //AI由场上牌比较自己的牌，查看是否有可以出的牌
    void AiXuanPai();  //AI选牌
    void FenXiChaiFenZuHe();    //分析并拆分牌型
    void DeleteZeroQuanZhi_shuLiang(std::map<int,int> &quanZhi_shuLiang);   //删除 权值_集合 中数量为零的元素

    //给一个权值，从手牌副本中找到相应的序号，然后从集合中删除并返回该序号；若未找到或无效则返回-1
    int FindXuHao(std::set<int> &shouPaiFuBen, int quanZhi);
    void DeleteWeiZhi();    //从拆分牌中删除所有未知类型的牌型
    void SanDaiYiAndFeiJi();    //从分析牌中组合三带一和飞机
    void zhijieChuPai();        //直接出牌
    void genYouFangPai();       //跟右方牌
    void genDiFangPai();        //跟敌方牌
    void XuYaoDanZhang();       //需要单张则拆出单张
    void XuYaoDuiZi();          //需要对子则拆出对子
    void XuYaoShunZi();         //需要顺子则拆出顺子
//    void XuYaoSanTiao();        //需要三条则拆出三条
    void XuYaoSanDaiYi();       //需要三带一则拆出三带一
    void XuYaoFeiji();          //需要飞机
    bool WanJiaChuPai();        //玩家出牌
    bool XuanPaiGuiDing();   //判断所选择的牌是否合规
    void FenXiXuanPai();     //对选牌进行分析
    bool DaChuPaiAndClear();    //打出牌并重置该结构
    bool AiChuPai();            //AI出牌
    std::set<int> GetShouPai() const {return shouPai;}

//    std::vector<int> ShouPaiQml();
private:
    Game &game;                             //游戏对象
    bool songXiaJiaZou;                     //是否送下家走
    bool buChu;                             //不出标志
    std::set<int> shouPai;                  //手牌
//    std::vector<int>shouPaiqml;

    std::vector<PokersZuHe*> chaiFenPai;    //分析手牌后拆分的牌的集合
    PokersZuHe xuanZePai;                   //选择的牌的集合
    PokersZuHe daChuPai;                    //打出的牌的集合
};

#endif // PLAYER_H
