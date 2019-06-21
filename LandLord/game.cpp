#include "game.h"
#include <QRandomGenerator>
#include <iostream>

Game::Game()
{
    diZhu = nullptr;
    dangQian = nullptr;
    zuiHou = nullptr;
    status = WEIKAISHI;
    for (int i = 0; i < 3; ++i){
        player[i] = new Player(*this);
    }
}

Game::~Game()
{
    for (int i = 0; i < 3; ++i)
        delete player[i];
}

void Game::GameStart()
{
    GameChuShi();
    FaPai();
    status = JIAODIZHU;
}

//游戏初始化
void Game::GameChuShi()
{
    //初始化Game的属性
    diZhu = dangQian = zuiHou = nullptr;

    //三个玩家分别开始新的一局游戏
    for(int i = 0; i != 3; i++)
    {
        player[i]->NewGame();
    }

    //发牌堆洗牌
    faPaiDui.XiPai();

    //洗牌后进入叫地主阶段
    status = JIAODIZHU;
}

//发牌
//模拟实物发牌
void Game::FaPai()
{
    std::cout << "----faPaiDui-----" << std::endl;
    std::cout << faPaiDui.GetShengYu() << std::endl;
//    for(auto me:faPaiDui.pokers)
//        std::cout << me << std::endl;

    //当发牌堆的牌大于3张时分别给3个玩家依次轮流发牌
    while(faPaiDui.GetShengYu() > 3 && faPaiDui.GetShengYu() <= 54)
    {
        player[0]->DePai(faPaiDui.MoPai());
        player[1]->DePai(faPaiDui.MoPai());
        player[2]->DePai(faPaiDui.MoPai());
    }

    std::cout << "----player[0]-----" << std::endl;
    for(auto me: player[0]->shouPai)
        std::cout << me << std::endl;
    std::cout << "----player[1]-----" << std::endl;
    for(auto me: player[1]->shouPai)
        std::cout << me << std::endl;
    std::cout << "----player[2]-----" << std::endl;
    for(auto me: player[2]->shouPai)
        std::cout << me << std::endl;
    //将发牌堆最后3张牌放入地主牌区
    while(faPaiDui.GetShengYu() <= 3 && faPaiDui.GetShengYu() > 0)
    {
        diZhuPaiQu[0] = faPaiDui.MoPai();
        diZhuPaiQu[1] = faPaiDui.MoPai();
        diZhuPaiQu[2] = faPaiDui.MoPai();
    }
}

//叫地主阶段
void Game::JiaoDiZhu()
{
    firstJiaoDiZhu=QRandomGenerator::global()->bounded(0,2);
    status = JIAODIZHU;
    dangQian = player[firstJiaoDiZhu];
    diZhu = dangQian;
    zuiHou = nullptr;
    if(diZhu)
    {
        status = FADIZHUPAI;
    }
}

//发地主牌阶段
void Game::FaDiZhuPai()
{
    //将地主牌区的牌发给地主
    for(auto poker : diZhuPaiQu)
    {
        diZhu->DePai(poker);
    }

    //未实现伪代码：地主牌由背面到正面显示

    status = CHUPAI;
}

void Game::ChuPai()
{
    if(zuiHou == dangQian)
    {
        //没有玩家出牌比当前玩家所出的牌大，
        //新一轮出牌开始
        zuiHou = nullptr;      //重置最后"出牌玩家"
        for (int i = 0; i != 3; ++i)
        {
            player[i]->buChu = false;
            player[i]->daChuPai.Clear();
        }

    }
    else
    {   //如果存在玩家出牌比当前玩家大
        //清空当前玩家的出牌区
        dangQian->buChu = false;
        dangQian->daChuPai.Clear();
    }

    if(dangQian == player[0])
    {
        //当前玩家为人
        if(dangQian->xuanZePai.yuanSuNum
                && dangQian->WanJiaChuPai())
        {
            //玩家已选牌并且符合规定
            zuiHou = dangQian;
            //            if(dangQian->daChuPai.type == ZhaDan)
            // 加倍
        }
        else{
            //继续等待玩家选牌
            return;
        }
    }else {
        //当前出牌方为电脑;
        dangQian->AiXuanPai();
        if (dangQian->AiChuPai())
            zuiHou = dangQian;
        //		if (dangQian->daChuPai.type == ZhaDan)//炸弹
        //        {}
    }

    if(zuiHou->shouPai.empty())
    {
        status = JIESHU;
    }else {
        dangQian = XiaJia();
    }
}

//获取当前玩家的上家
Player *Game::ShangJia()
{
    int i;
    for(i=0; i<3; ++i)
    {
        if(player[i] == dangQian)
            break;
    }
    return player[(i+2) %3];
}

//获取当前玩家的下家
Player *Game::XiaJia()
{
    return player[XiaJiaNum()];
}

int Game::XiaJiaNum()
{
    int i;
    for(i=0; i<3; ++i)
    {
        if(player[i] == dangQian)
            if(player[i] == dangQian)
                break;
    }
    return (i+1) % 3;
}

void Game::GameOver()
{
    //    int score = basescore * times;
    bool IsPeopleWin = false;

    dangQian = diZhu;//把地主设为当前玩家，方便获取上家和下家
    if (diZhu->shouPai.size()){//农民胜利
        //		diZhu->score -= score * 2;
        //		ProPlayer()->score += score;
        //		NextPlayer()->score += score;
        if (player[0] != diZhu)
            IsPeopleWin = true;
    }
    else{//地主胜利
        //		diZhu->score += score * 2;
        //		ProPlayer()->score -= score;
        //		NextPlayer()->score -= score;
        if (player[0] == diZhu)
            IsPeopleWin = true;
    }

    GameStart();
}




