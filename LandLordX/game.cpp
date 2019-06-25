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
    JiaoDiZhu();
    FaDiZhuPai();
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
    while(faPaiDui.GetShengYu() > 3 && faPaiDui.GetShengYu() <= 54)
    {
        player[0]->DePai(faPaiDui.MoPai());
        player[1]->DePai(faPaiDui.MoPai());
        player[2]->DePai(faPaiDui.MoPai());
    }

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

    //    dangQian = player[firstJiaoDiZhu];
    dangQian = player[0];
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

    for(auto poker : diZhuPaiQu)
    {
        diZhu->DePai(poker);
    }

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
    //刷新

    if(dangQian == player[0])
    {
        //当前玩家为人
        printShouPai(0);
        //        std::cout << "请输入你选择的手牌"<<std::endl;
        //        int x;
        //        while(std::cin >> x)
        //        {
        //            player[0]->xuanZePai.AddPokersXuhao(x);
        //        }

//        std::vector<int> vec;
//        for(auto c : player[0]->shouPai)
//            vec.push_back(c);
//        player[0]->xuanZePai.AddPokersXuhao(vec[vec.size()-1]);

        if(dangQian->xuanZePai.yuanSuNum
                && dangQian->WanJiaChuPai())
        {
            //玩家已选牌并且符合规定
            zuiHou = dangQian;
            printDaChuPai(0);
        }
    }else {
        dangQian->AiXuanPai();
        if (dangQian->AiChuPai())
        {
            if(dangQian == player[1])
            {
                printDaChuPai(1);
            }else if(dangQian == player[2])
            {
                printDaChuPai(2);
            }

            zuiHou = dangQian;
        }

    }

    if(zuiHou->shouPai.empty())
    {
        status = JIESHU;
    }else {
        dangQian = XiaJia();
        status = CHUPAI;
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
            break;
    }
    return (i+1) % 3;
}

Status Game::GameStatus()
{
    return status;
}

void Game::printShouPai(int i)
{
    std::cout << "----------player[" << i << "]手牌----------------"<< std::endl;
    for(auto c : player[i]->shouPai)
        std::cout << c << std::endl;
    std::cout << "------------------------------------------------"<< std::endl;
}

void Game::printDaChuPai(int i)
{
    std::cout << "----------player[" << i << "]打出牌--------------"<< std::endl;
    for(auto c : player[i]->daChuPai.pokersXuhao)
        std::cout << c << std::endl;
    std::cout << "------------------------------------------------"<< std::endl;
}

void Game::GameOver()
{
    bool IsPeopleWin = false;

    dangQian = diZhu;//把地主设为当前玩家，方便获取上家和下家
    if (diZhu->shouPai.size()){//农民胜利
        if (player[0] != diZhu)
            IsPeopleWin = true;
        std::cout << "农民胜利" << std::endl;
    }
    else{//地主胜利
        std::cout << "地主胜利" <<std::endl;
        if (player[0] == diZhu)
            IsPeopleWin = true;
    }

//    GameStart();
}

void Game::GuoPai()
{
    player[0]->GuoPai();
    dangQian = XiaJia();
}


