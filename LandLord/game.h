/*
 * Game：游戏主程序
 * 功能：
 * 游戏类，控制整个游戏的进行。
 * 包含游戏进行除界面以外的所有元素
 * 属性：玩家、地主方、当前出牌方、地主专属牌集合等；
 * 接口：相关控制游戏进行函数，及每个个步骤通知界面更新。
 */

#ifndef GAME_H
#define GAME_H

#include "pokers.h"
#include "player.h"
//class Player;

enum Status{
    WEIKAISHI,  //游戏未开始
    JIAODIZHU,  //叫地主阶段
    FADIZHUPAI, //发地主牌阶段
    CHUPAI,     //出牌阶段
    JIESHU      //游戏结束
};

class Game
{
    friend class Player;
    friend class ShouPai;
public:
    Game();
    ~Game();
    void GameStart(); //开始新游戏
    void GameChuShi();  //初始化游戏
    void FaPai();       //发牌
    void JiaoDiZhu();   //叫地主阶段
    void FaDiZhuPai();  //发地主牌阶段
    void ChuPai();      //出牌阶段
    Player *ShangJia();            //上家
    Player *XiaJia();              //下家
    int XiaJiaNum();         //当前玩家的下家在玩家指针数组中的下标

    void GameOver();        //游戏结束
private:
    Status status;      //游戏当前状态
    Pokers faPaiDui;    //发牌堆
//    Pokers *faPaiDui2;
    Player *diZhu;      //地主玩家
    Player *dangQian;   //当前玩家
    Player *zuiHou;     //最后出牌玩家
    Player *player[3];
    int diZhuPaiQu[3];     //地主牌存放区
    int firstJiaoDiZhu;
};

#endif // GAME_H
