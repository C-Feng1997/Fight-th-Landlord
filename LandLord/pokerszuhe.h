/*PokersZuHe：一组牌型，如：单张、对子、顺子、炸弹等等。
 * 属性：包含牌序号集合、对应牌的权值集合、该组牌的类型、权值、牌的数量；
 * 接口：添加/删除序号牌、重置结构内属性、静态序号到权值转换。
 *
 */

#ifndef POKERSZUHE_H
#define POKERSZUHE_H

#include <map>
#include <set>

//一组牌的可能类型
enum Type{
    WeiZhi,     //未知牌型
    DanZhang,  //单张
    DuiZi,      //对子
    SanTiao,    //三不带
    ShunZi,     //顺子
    ShuangShun, //双顺
    SanShun,    //三顺
    SanDaiYi,   //三带一
    SiDaiEr,    //四带二
    FeiJi,      //飞机
    ZhaDan,     //炸弹
};


//牌型结构
class PokersZuHe
{


    friend class Player;
    friend class Game;
    friend class ControlQml;
public:
    PokersZuHe();
    PokersZuHe(Type typeNow, int quanZhiNow);
    PokersZuHe& operator =(PokersZuHe &pokersZuHe);
    void AddPokersXuhao(int xuHao);     //添加0-53表示的牌元素
    void DeletpokersXuhao(int xuHao);   //去掉一张牌
    void Clear( );                  //重置此结构,所有属性值情况

    //把0-53转换成3-17权值，
    //    其中牌A为14;
    //    牌2为15;
    //    牌小王为16;
    //    牌大王为17;
    static int ZhuanQuanZhi(int xuHao);


    std::map<int, int>pokerQuanZhi;    //3-17权值集合
    std::set<int> pokersXuhao;    //0-53(序号)组成的集合，主要用于方便画面显示
    Type type;  //牌型类型（单牌、对子等等）
    int quanZhi;    //权值
    int yuanSuNum;  //此结构元素数量（牌张数量）
};

#endif // POKERSZUHE_H
