#include "game.h"
#include <QRandomGenerator>

Game::Game()
{

}

void Game::GameStart()
{

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
    //当发牌堆的牌大于3张时分别给3个玩家依次轮流发牌
    while(faPaiDui.GetShengYu() > 3)
    {
        player[0]->DePai(faPaiDui.MoPai());
        player[1]->DePai(faPaiDui.MoPai());
        player[2]->DePai(faPaiDui.MoPai());
    }
    //将发牌堆最后3张牌放入地主牌区
    while(faPaiDui.GetShengYu() <= 3)
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
        dangQian->buChu = false;
        dangQian->daChuPai.Clear();
    }

    zuiHou->AiXuanPai();
}


