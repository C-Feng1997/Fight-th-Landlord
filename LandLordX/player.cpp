#include "player.h"
#include "game.h"
#include <set>
#include <map>
#include <algorithm>
#include <iostream>

Player::Player(Game &gameNow) : game(gameNow), songXiaJiaZou(false),buChu(false)
{

}

Player::~Player()
{

}

//开始新的一局游戏，做初始化的操作
void Player::NewGame()
{
    buChu = false;
    songXiaJiaZou = false;
    shouPai.clear();
    ClearChaiFenPai();
    xuanZePai.Clear();
    daChuPai.Clear();
}

//清空拆分牌的集合
void Player::ClearChaiFenPai()
{
    if(chaiFenPai.empty())  //若拆分牌的集合为空则返回
    {
        return;
    }

    for (auto pai : chaiFenPai)
    {  //析构 拆分牌集合
        delete pai;
        pai = nullptr;
    }

    chaiFenPai.clear();     //清空 拆分牌集合

}

bool Player::CompareMyself(PokersZuHe *p1, PokersZuHe *p2)
{
    if(p1->type != p2->type )
    {
        //牌组类型不同
        //比较类型自身大小
        return p1->type < p2->type;
    }
    else
    {
        //牌组类型相同
        //比较牌组权值大小
        return p1->quanZhi < p2->quanZhi;
    }
}

//AI选牌
void Player::AiXuanPai()
{
    //是否需要重新分析手牌
    if(chaiFenPai.empty())
    {
        FenXiChaiFenZuHe();
    }

    SanDaiYiAndFeiJi();
    DeleteWeiZhi();
    sort(chaiFenPai.begin(),chaiFenPai.end(),CompareMyself);

    if(chaiFenPai.size() == 2)
    {
        //手数为2，且有合适的炸弹直接出
        for(auto zhaDan : chaiFenPai)
        {
            if(zhaDan->type == ZhaDan)
            {
                if(game.zuiHou != nullptr && //自己是接别人的牌
                        game.zuiHou->daChuPai.type == ZhaDan && //别人最后出的时 炸弹
                        zhaDan->quanZhi <= game.zuiHou->daChuPai.quanZhi)   //自己的炸弹权值小于对方
                    continue;   //不能选择改牌
                xuanZePai = *zhaDan;
                return;
            }
        }
    }

    if(game.zuiHou == nullptr)
    {
        zhijieChuPai(); //直接出牌
    }else if(this != game.diZhu && game.zuiHou != game.diZhu)
    {
        genYouFangPai();//跟友方牌：最后出牌的是友方,并且不是提示
    }else {
        genDiFangPai();//跟敌方的牌
    }

}

//拆分手牌牌型并组成基本牌集合
void Player::FenXiChaiFenZuHe()
{
    if(chaiFenPai.size())
    {
        //拆分牌集合非空，返回
        return;
    }

    std::set<int> shouPaiFuBen(shouPai);    //手牌副本
    std::map<int, int> quanZhi_shuLiang;    //便于分析的 权值_数量 集合

    for(auto xuHao : shouPaiFuBen)
    {
        //遍历手牌副本
        //先将序号装换为权值，将其添加进quanZhi_shuLiang中的quanZhi;
        //然后quanZhi对应数目++；（牌的数目++）
        ++ quanZhi_shuLiang[PokersZuHe::ZhuanQuanZhi(xuHao)];
    }

    //存在王炸
    if(quanZhi_shuLiang.find(16) != quanZhi_shuLiang.end()
            &&  quanZhi_shuLiang.find(17) != quanZhi_shuLiang.end())
    {
        //创建炸弹牌型对象“王炸”
        PokersZuHe *wangZha = new PokersZuHe(ZhaDan, 17);

        //在对象“王炸”中加入 牌大王 牌小王
        wangZha->AddPokersXuhao(FindXuHao(shouPaiFuBen,16));
        wangZha->AddPokersXuhao(FindXuHao(shouPaiFuBen,17));
        //从 权值_数量 集合中抹掉 小王 大王
        quanZhi_shuLiang.erase(16);
        quanZhi_shuLiang.erase(17);

        //在拆分牌集合中加入 "王炸" 对象
        chaiFenPai.push_back(wangZha);
    }

    //遍历 权值_数量 集合
    for(auto qzxh : quanZhi_shuLiang)
    {
        //如果存在“普通炸弹”
        if(qzxh.second == 4)
        {
            //创建炸弹牌型对象“普通炸弹”
            PokersZuHe *ptZhanDan = new PokersZuHe(ZhaDan, qzxh.first);
            for (int i = 0; i != 4; i++)
            {
                //向 普通炸弹 对象中添加权值为 qzxh.first 的4张牌
                ptZhanDan->AddPokersXuhao(FindXuHao(shouPaiFuBen,qzxh.first));
            }

            //在拆分牌集合中加入 “普通炸弹” 对象
            chaiFenPai.push_back(ptZhanDan);
            //该权值对应牌的数量在 权值_数量 集合中变为0
            quanZhi_shuLiang[qzxh.first] = 0;
        }
    }

    //删除 权值_集合 中数量为零的元素
    DeleteZeroQuanZhi_shuLiang(quanZhi_shuLiang);

    //如果存在 牌2
    if(quanZhi_shuLiang.find(15) != quanZhi_shuLiang.end())
    {
        PokersZuHe *two = new PokersZuHe(WeiZhi, 15);

        if(quanZhi_shuLiang[15] == 3)
        {
            //三个2
            two->type = SanTiao;
            two->AddPokersXuhao(FindXuHao(shouPaiFuBen,15));
            two->AddPokersXuhao(FindXuHao(shouPaiFuBen,15));
            two->AddPokersXuhao(FindXuHao(shouPaiFuBen,15));
        }else if(quanZhi_shuLiang[15] == 2)
        {
            //对2
            two->type = DuiZi;

            //向 two 对象中添加权值为 15 的2张牌
            two->AddPokersXuhao(FindXuHao(shouPaiFuBen,15));
            two->AddPokersXuhao(FindXuHao(shouPaiFuBen,15));
        }else if(quanZhi_shuLiang[15] ==1 )
        {
            //单张2
            two->type = DanZhang;
            //向 two 对象中添加权值为 15 的1张牌
            two->AddPokersXuhao(FindXuHao(shouPaiFuBen,15));
        }

        //从 权值_数量 集合中抹掉 牌2
        quanZhi_shuLiang.erase(15);
        //在拆分牌集合中加入 “对2” 或者 ”单张2“ 对象
        chaiFenPai.push_back(two);
    }

    //查找顺子
    int begin, n;
    bool exist = true;

    //当权值_数量 集合中存在元素时
    while (exist && quanZhi_shuLiang.size())
    {
        begin = 0;
        n = 0;

        //遍历 权值_数量 集合
        for(auto b = quanZhi_shuLiang.begin(); b != quanZhi_shuLiang.end(); ++b)
        {
            //跳过数目为0的元素
            //begin表示当前还未成型的 顺子 的最后1张牌的权值
            //n 表示当前还未成型的 顺子 已达到多少张牌
            //b 表示当前遍历所到位置
            if(b->second > 0)
            {
                if(!begin)
                {
                    //begin 绑定到第一个元素权值上
                    begin = b->first;
                }
                if(begin == b->first)
                {
                    ++n;
                }

                ++begin;
            }


            //如果存在顺子的 牌数等于5张
            if(n == 5)
            {
                auto p = b; //p:当前迭代器所在位置（当前所遍历到的位置）

                //创建 顺子 牌型对象“顺子”
                PokersZuHe *shunZi = new PokersZuHe(ShunZi, p->first);

                //向 "顺子" 中加入这张牌
                //shunZiFirst:顺子中第1张牌
                for(int shunZiFirst = p->first - 4; shunZiFirst <= p->first; ++shunZiFirst)
                {
                    shunZi->AddPokersXuhao(FindXuHao(shouPaiFuBen,shunZiFirst));
                    --quanZhi_shuLiang[shunZiFirst];  //对应牌在 权值_集合 中的数目减一
                }

                //将对象 "顺子" 压入 拆分牌 集合
                chaiFenPai.push_back(shunZi);
                exist = true;
                break;   //从开始重新查找
            }

            //连续的牌面数量小于5个，重新计数；或者已经到集合末尾仍然数量小于5个
            if(n<5)
            {
                auto end = quanZhi_shuLiang.end();
                //begin - 1 != b->first : 最后1张牌的权值 不等于 当前遍历所在位置的权值
                if(begin - 1 != b->first || b == --end)
                {
                    if(b->second > 0)
                    {
                        begin = b->first;
                        ++begin;
                        n = 1;
                    }
                    else
                    {
                        begin = 0;
                        n = 0;
                    }
                    exist = false;
                }
            }
        }
    }

    //删除 权值_集合 中数量为零的元素
    DeleteZeroQuanZhi_shuLiang(quanZhi_shuLiang);

    //如果可可能，继续往"顺子"中添加剩余牌
    //遍历 拆分牌 集合
    for(auto cfp:chaiFenPai)
    {
        if(cfp->type == DanZhang)   //针对于每一个 顺子
        {
            //遍历 权值_数量 集合
            for(auto qzsl : quanZhi_shuLiang)
            {
                if (qzsl.second > 0 && qzsl.first == cfp->quanZhi + 1) {
                    //剩余牌中还有比当前 顺子 最大大1的牌
                    cfp->AddPokersXuhao(FindXuHao(shouPaiFuBen, qzsl.first));
                    //当前 顺子 权值加1
                    ++cfp->quanZhi;
                    //对应牌数目减1
                    --quanZhi_shuLiang[qzsl.first];
                }
            }
        }
    }

    //删除 权值_集合 中数量为零的元素
    DeleteZeroQuanZhi_shuLiang(quanZhi_shuLiang);

    //如果顺子中有可以对接更长的顺子；或者两个顺子相同，组合成双顺
    for(auto sunZhi1 : chaiFenPai)
    {
        if(sunZhi1->type == ShunZi)    //顺子1
        {
            for(auto sunZhi2 : chaiFenPai)
            {
                if(sunZhi2->type == ShunZi && sunZhi1 != sunZhi2)        //顺子2，且与顺子1不为同一个
                {
                    if(sunZhi1->quanZhi < sunZhi2->quanZhi)   //顺子1 在 顺子2 前
                    {
                        //顺子1的末尾牌等于顺子2的第一张牌则可以拼接
                        if(sunZhi1->quanZhi == sunZhi2->quanZhi - sunZhi2->yuanSuNum)
                        {
                            for(auto xuHao : sunZhi2->pokersXuhao)
                                sunZhi1->AddPokersXuhao(xuHao);
                            sunZhi1->quanZhi = sunZhi2->quanZhi;
                            sunZhi2->type = WeiZhi;
                        }
                    }
                    else if(sunZhi1->quanZhi > sunZhi2->quanZhi)   //顺子2 在 顺子1 前
                    {
                        //顺子2的末尾牌等于顺子1的第一张牌则可以拼接
                        if(sunZhi2->quanZhi == sunZhi1->quanZhi - sunZhi1->yuanSuNum)
                        {
                            for(auto xuHao : sunZhi1->pokersXuhao)
                                sunZhi2->AddPokersXuhao(xuHao);
                            sunZhi2->quanZhi = sunZhi1->quanZhi;
                            sunZhi1->type = WeiZhi;
                        }
                    }
                    else
                    {
                        if(sunZhi1->yuanSuNum == sunZhi2->yuanSuNum)
                        {
                            for(auto xuHao : sunZhi2->pokersXuhao)
                                sunZhi2->AddPokersXuhao(xuHao);
                            sunZhi1->type = ShuangShun;
                            sunZhi2->type = WeiZhi;
                        }
                    }
                }
            }
        }
    }

    if(quanZhi_shuLiang.empty())
    {
        //分析集合已空，返回
        //删除所有 拆分牌 中 未知 类型的牌型
        DeleteWeiZhi();
        sort(chaiFenPai.begin(),chaiFenPai.end(),CompareMyself);
        return;
    }

    //双顺，只查找数量大于2的连续牌，并且3个以上相连
    begin = 0;
    n = 0;
    auto last = --quanZhi_shuLiang.end();   //last:权值_数量 集合的最后一个元素
    //遍历 权值_数量 集合
    for(auto b = quanZhi_shuLiang.begin(); b != quanZhi_shuLiang.end(); ++b)
    {
        if(b->second >= 2)
        {
            if(!begin)
                begin = b->first;
            if(begin == b->first)
                ++n;
            ++begin;
        }
        if(begin && begin - 1 != b->first || b == last)
        {
            //出现与之前不连续的牌，或者已经到了最后
            if(n >= 3)
            {
                auto p = b;
                if(begin - 1 != b->first)
                    --p;
                PokersZuHe *shuangShun = new PokersZuHe(ShuangShun, p->first);
                for(int i = n; i>0; --i, --p)
                {
                    for(int j = 0; j < 2; ++j)
                    {
                        shuangShun->AddPokersXuhao(FindXuHao(shouPaiFuBen,p->first));
                        --p->second;
                    }
                }
                chaiFenPai.push_back(shuangShun);
            }
            if(b->second >= 2)
            {
                n = 1;
                begin = b->first;
                ++begin;
            }
            else {
                n = 0;
                begin = 0;
            }
        }
    }

    DeleteZeroQuanZhi_shuLiang(quanZhi_shuLiang);

    //三顺
    //查找是否有重合的单顺和双顺组合成三顺
    for(auto danShun : chaiFenPai)
    {
        if(danShun -> type == ShunZi)
        {
            for(auto shuangShun : chaiFenPai)
            {
                if(shuangShun->type == ShuangShun)
                {
                    if(danShun->quanZhi == shuangShun->quanZhi &&
                            danShun->yuanSuNum*2 == shuangShun->yuanSuNum)
                    {
                        for(auto xuHao:danShun->pokersXuhao)
                            shuangShun->AddPokersXuhao(xuHao);
                        shuangShun->type = SanShun;
                        danShun->type = WeiZhi;
                    }
                }
            }
        }
    }

    if(quanZhi_shuLiang.empty())
    {
        //分析集合已空，返回
        //删除所有 拆分牌 中 未知 类型的牌型
        DeleteWeiZhi();
        sort(chaiFenPai.begin(),chaiFenPai.end(),CompareMyself);
        return;
    }

    //剩余牌中查找三顺
    begin = 0;
    n = 0;
    last = --quanZhi_shuLiang.end();
    for (auto b = quanZhi_shuLiang.begin(); b != quanZhi_shuLiang.end(); ++b)
    {
        if(b->second == 3)
        {
            if(!begin)
                begin = b->first;
            if(begin == b->first)
                ++n;
            ++begin;
        }
        if(begin && begin - 1 != b->first || b == last) //出现与之前不连续的,或已到集合最后
            if (n >= 2)
            {//存在2组及以上
                {
                    if(n >= 2)  //存在2组级以上
                    {
                        auto p = b;
                        if(begin -1 != b->first)
                            --p;
                        PokersZuHe *sanShun = new PokersZuHe(SanShun, p->first);
                        for(int i = n; i > 0; --i, --p)
                        {
                            for(int j = 0; j < 3; ++j)
                            {
                                sanShun->AddPokersXuhao(FindXuHao(shouPaiFuBen,p->first));
                                --p->second;
                            }
                        }
                        chaiFenPai.push_back(sanShun);
                        if(b->second == 3)  //当前分析牌为3张，
                        {
                            n = 1;
                            begin = b->first;
                            ++b;
                            ++begin;
                        }
                        else {
                            n = 0;
                            begin = 0;
                        }
                    }
                }
            }
    }

    //三条
    for(auto qzsl : quanZhi_shuLiang)
    {
        if(qzsl.second == 3)
        {
            PokersZuHe *sanTiao = new PokersZuHe(SanTiao, qzsl.first);
            for(int i=0; i<3; i++)
                sanTiao->AddPokersXuhao(FindXuHao(shouPaiFuBen, qzsl.first));
            quanZhi_shuLiang[qzsl.first] = 0;
            chaiFenPai.push_back(sanTiao);
        }
    }

    //对子
    for(auto qzsl:quanZhi_shuLiang)
    {
        if(qzsl.second == 2)
        {
            PokersZuHe *duiZhi = new PokersZuHe(DuiZi, qzsl.first);

            duiZhi->AddPokersXuhao(FindXuHao(shouPaiFuBen, qzsl.first));
            duiZhi->AddPokersXuhao(FindXuHao(shouPaiFuBen, qzsl.first));

            quanZhi_shuLiang[qzsl.first] = 0;
            chaiFenPai.push_back(duiZhi);
        }
    }
    //删除 权值_集合 中数量为零的元素
    DeleteZeroQuanZhi_shuLiang(quanZhi_shuLiang);

    //单牌
    for(auto qzsl : quanZhi_shuLiang)
    {
        if(qzsl.second != 1){
            throw std::runtime_error("仍然还有非单张牌");
        }
        PokersZuHe *danZhang = new PokersZuHe(DanZhang, qzsl.first);
        danZhang->AddPokersXuhao(FindXuHao(shouPaiFuBen, qzsl.first));
        quanZhi_shuLiang[qzsl.first] = 0;
        chaiFenPai.push_back(danZhang);
    }

    //删除 权值_集合 中数量为零的元素
    DeleteZeroQuanZhi_shuLiang(quanZhi_shuLiang);

    DeleteWeiZhi();
    sort(chaiFenPai.begin(),chaiFenPai.end(),CompareMyself);
}

//删除 权值_集合 中数量为零的元素
void Player::DeleteZeroQuanZhi_shuLiang(std::map<int, int> &quanZhi_shuLiang)
{

    /*
     * 关于设置notComplete的原因，删除元素后再从此处位置遍历会出现问题，需要从头再遍历
     * 测试代码：
     * #include <iostream>
     * #include <map>
     * using namespace std;
     * //void DeleteZeroQuanZhi_ShuLiang(std::map<int, int> &quanZhi_ShuangLiang)
     * {

    //    bool notComplete = true;
    //    cout << "-------in delete------"<<endl;
    //    while (notComplete)
    //    {
    //        notComplete = false;

    //        for (auto b = quanZhi_ShuangLiang.begin();b != quanZhi_ShuangLiang.end(); ++b)
    //        {
    //            cout << b->first << "-----" << b->second << endl;
    //            if(b->second == 0)
    //            {
    //                quanZhi_ShuangLiang.erase(b);
    //                notComplete = true;
    //                break;
    //            }
    //        }
    //    }
    //}

    void DeleteZeroQuanZhi_ShuLiang(std::map<int, int> &quanZhi_ShuangLiang)
    {
        cout << "-------in delete------"<<endl;


        for (auto b = quanZhi_ShuangLiang.begin();b != quanZhi_ShuangLiang.end(); ++b)
        {
            cout << b->first << "-----" << b->second << endl;
            if(b->second == 0)
            {
                quanZhi_ShuangLiang.erase(b);
            }
        }
    }


    int main()
    {
        map<int,int>  qzsl{ {1,5}, {2,6}, {5,0}, {9,4}, {10,0}, {7,7}};
        cout << "----------------"<<endl;
        for(auto q: qzsl)
        {
            cout << q.first << "-----" << q.second << endl;
        }
        DeleteZeroQuanZhi_ShuLiang(qzsl);
        cout << "----------------"<<endl;
        for(auto q: qzsl)
        {
            cout << q.first << "-----" << q.second << endl;
        }
        return 0;
    }
    */
    bool notComplete = true;
    while (notComplete)
    {
        notComplete = false;

        //遍历 权值_数量 集合
        for (auto b = quanZhi_shuLiang.begin(); b != quanZhi_shuLiang.end(); ++b)
        {
            //若元素数目为0
            if(b->second == 0)
            {
                //从 权值_数量 集合中抹去该元素
                quanZhi_shuLiang.erase(b);
                notComplete = true;
                break;
            }
        }
    }
}

//给一个权值，从手牌副本中找到相应的序号，然后从集合中删除并返回该序号；若未找到或无效则返回-1
int Player::FindXuHao(std::set<int> &shouPaiFuBen, int quanZhi)
{
    //若 权值不在3-17范围 或者 手牌副本为空
    if(quanZhi < 3 || quanZhi > 17 || shouPaiFuBen.empty())
    {
        throw std::runtime_error("权值没有在副本中");
    }


    //若 权值等于16(小王) 且 在手牌副本中通过序号找到了小王
    if(quanZhi == 16 && shouPaiFuBen.find(52) != shouPaiFuBen.end())
    {
        //从手牌副本中抹去小王
        shouPaiFuBen.erase(52);
        //返回52(小王）
        return 52;
    }else
        //若 权值等于17(大王) 且 在手牌副本中通过序号找到了大王
        if(quanZhi == 17 && shouPaiFuBen.find(53) != shouPaiFuBen.end())
        {
            //从手牌副本中抹去大王
            shouPaiFuBen.erase(53);
            //返回53(大王）
            return 53;
        }else{
            //若 权值等于非王的牌
            for(int i = (quanZhi - 3)*4, j=0; j<4; ++j)
            {
                //将权值转为序号
                int xuHao = i+j;

                //若在手牌副本中找到了该序号
                if(shouPaiFuBen.find(xuHao) != shouPai.end())
                {
                    //从手牌副本中抹去该序号
                    shouPaiFuBen.erase(xuHao);
                    //返回该序号
                    return xuHao;
                }
            }

            throw std::runtime_error("权值没有在副本中");
        }
}

//删除所有未知类型的牌型
void Player::DeleteWeiZhi()
{
    //遍历 拆分牌 集合，删除”未知“元素
    auto b = chaiFenPai.begin();
    while(b != chaiFenPai.end())
    {
        if((*b)->type == WeiZhi)
        {
            delete *b;
            b = chaiFenPai.erase(b);
        }else {
            ++b;
        }
    }
}

//从分析牌中组合三带一和飞机
void Player::SanDaiYiAndFeiJi()
{
    int n;
    int duiZhiNum = 0;  //统计对子的数量，以便于下面的整合
    int danZhangNum = 0;    //统计单张牌数量
    for(auto cfp : chaiFenPai)
    {
        if(cfp->type == DanZhang)
            ++danZhangNum;
        else if(cfp->type == DuiZi)
            ++duiZhiNum;
    }
    for (auto cfp : chaiFenPai)
    {
        //完善飞机
        if(cfp->type == SanShun)
        {
            n = cfp->yuanSuNum / 3;
            if(danZhangNum >= n)
            {
                for(auto danZhang : chaiFenPai)
                {
                    if(danZhang->type == DanZhang)
                    {
                        for(auto xuHao : danZhang->pokersXuhao)
                            cfp->AddPokersXuhao(xuHao);
                        danZhang->type = WeiZhi;
                        --danZhangNum;
                        --n;
                    }
                    if(!n)
                    {
                        cfp->type = FeiJi;
                        break;
                    }
                }
            }
            else if(duiZhiNum >= n)
            {
                for(auto duiZhi : chaiFenPai)
                {
                    if(duiZhi->type == DuiZi)
                    {
                        for(auto xuHao : duiZhi->pokersXuhao)
                            cfp->AddPokersXuhao(xuHao);
                        duiZhi->type = WeiZhi;
                        --duiZhiNum;
                        --n;
                    }
                    if(!n)
                    {
                        cfp->type = FeiJi;
                        break;
                    }
                }
            }
        }
    }
    //完善三带一
    for(auto cfp : chaiFenPai)
    {
        if(cfp->type == SanTiao)
        {
            if(danZhangNum)
            {
                for(auto danZhang : chaiFenPai)
                {
                    if(cfp->type == DanZhang)
                    {
                        for(auto xuHao:danZhang->pokersXuhao)
                            cfp->AddPokersXuhao(xuHao);
                        danZhang->type = WeiZhi;
                        --danZhangNum;
                        cfp->type = SanDaiYi;
                        break;
                    }
                }
            }
            else if(duiZhiNum)
            {
                for(auto duiZi : chaiFenPai)
                {
                    if(duiZi->type == DuiZi)
                    {
                        for(auto xuHao : duiZi->pokersXuhao)
                            cfp->AddPokersXuhao(xuHao);
                        duiZi->type = WeiZhi;
                        --duiZhiNum;
                        cfp->type = SanDaiYi;
                        break;
                    }
                }
            }
        }
    }
}

void Player::XuYaoDanZhang()
{
    auto zuiHouChuPai = game.zuiHou->daChuPai;//敌方出牌

    for (auto mem : chaiFenPai){
        if (mem->type == DanZhang && mem->yuanSuNum > 5){//首先,拆单顺数量大于5的
            if (mem->pokerQuanZhi.begin()->first > zuiHouChuPai.quanZhi){
                xuanZePai.AddPokersXuhao(*mem->pokersXuhao.begin());
                xuanZePai.quanZhi = mem->pokerQuanZhi.begin()->first;
                xuanZePai.type = DanZhang;
                ClearChaiFenPai();//拆牌了，一定要清空
                return;
            }
            else if (mem->pokerQuanZhi.rbegin()->first > zuiHouChuPai.quanZhi){
                xuanZePai.AddPokersXuhao(*(mem->pokersXuhao.rbegin()));
                xuanZePai.quanZhi = mem->quanZhi;
                xuanZePai.type = DanZhang;
                ClearChaiFenPai();//拆牌了，一定要清空
                return;
            }
        }
    }
    for (auto mem : chaiFenPai){
        if (mem->type == SanTiao){//其次,拆三条
            if (mem->pokerQuanZhi.begin()->first > zuiHouChuPai.quanZhi){
                xuanZePai.AddPokersXuhao(*mem->pokersXuhao.begin());
                xuanZePai.quanZhi = mem->pokerQuanZhi.begin()->first;
                xuanZePai.type = DanZhang;
                ClearChaiFenPai();//拆牌了，一定要清空
                return;
            }
        }
    }
    for (auto mem : chaiFenPai){
        if (mem->type == DuiZi){//再者,拆对子
            if (mem->pokerQuanZhi.begin()->first > zuiHouChuPai.quanZhi){
                xuanZePai.AddPokersXuhao(*mem->pokersXuhao.begin());
                xuanZePai.quanZhi = mem->pokerQuanZhi.begin()->first;
                xuanZePai.type = DanZhang;
                ClearChaiFenPai();//拆牌了，一定要清空
                return;
            }
        }
    }
}

void Player::XuYaoDuiZi()
{
    auto zuiHouChuPai = game.zuiHou->daChuPai;//敌方出牌

    for (auto mem : chaiFenPai){
        if (mem->type == SanTiao){//拆三条
            if (mem->pokerQuanZhi.begin()->first > zuiHouChuPai.quanZhi){
                auto b = mem->pokersXuhao.begin();
                for (int i = 0; i < 2; ++i)
                    xuanZePai.AddPokersXuhao(*b++);
                xuanZePai.quanZhi = mem->pokerQuanZhi.begin()->first;
                xuanZePai.type = DuiZi;
                ClearChaiFenPai();//拆牌了，一定要清空
                return;
            }
        }
    }
    for (auto mem : chaiFenPai){
        int i = 0, m = 0;
        if (mem->type == SanShun){//拆三顺
            if (mem->pokerQuanZhi.begin()->first > zuiHouChuPai.quanZhi){
                auto b = mem->pokersXuhao.begin();
                for (int i = 0; i < 2; ++i)
                    xuanZePai.AddPokersXuhao(*b++);
                xuanZePai.quanZhi = mem->pokerQuanZhi.begin()->first;
                xuanZePai.type = DuiZi;
                ClearChaiFenPai();//拆牌了，一定要清空
                return;
            }
            else if (mem->pokerQuanZhi.rbegin()->first > zuiHouChuPai.quanZhi){
                xuanZePai.AddPokersXuhao(*(mem->pokersXuhao.rbegin()));
                xuanZePai.quanZhi = mem->quanZhi;
                xuanZePai.type = DuiZi;
                ClearChaiFenPai();//拆牌了，一定要清空
                return;
            }
        }
    }
}

void Player::XuYaoShunZi()
{
    auto zuiHouChuPai = game.zuiHou->daChuPai;//敌方出牌

    for (auto mem : chaiFenPai){
        if (mem->type == DanZhang &&
                mem->quanZhi > zuiHouChuPai.quanZhi &&
                mem->yuanSuNum > zuiHouChuPai.yuanSuNum){//拆更长的单顺
            if (mem->yuanSuNum - (mem->quanZhi - zuiHouChuPai.quanZhi) >= zuiHouChuPai.yuanSuNum){
                //长单顺是从短单顺的开始的元素或更小的元素开始的
                for (int i = zuiHouChuPai.quanZhi - zuiHouChuPai.yuanSuNum + 2, j = 0;
                     j < zuiHouChuPai.yuanSuNum; ++j)
                    xuanZePai.AddPokersXuhao(FindXuHao(mem->pokersXuhao, i + j));
                xuanZePai.quanZhi = zuiHouChuPai.quanZhi + 1;
                xuanZePai.type = DanZhang;
                ClearChaiFenPai();//拆牌了，一定要清空
                return;
            }
            else{//长单顺的开始元素比短单顺的开始元素大
                int i = 0;
                auto b = mem->pokersXuhao.begin();
                for (; i < zuiHouChuPai.yuanSuNum; ++i, ++b)
                    xuanZePai.AddPokersXuhao(*b);
                xuanZePai.quanZhi = PokersZuHe::ZhuanQuanZhi(*--b);
                xuanZePai.type = DanZhang;
                ClearChaiFenPai();//拆牌了，一定要清空
                return;
            }
        }
    }
}

void Player::XuYaoSanDaiYi()
{
    auto b = chaiFenPai.begin();
    for (; b != chaiFenPai.end(); ++b){//查找比对方三张相同牌的牌面大的三条
        if ((*b)->type == SanTiao && (*b)->quanZhi > game.zuiHou->daChuPai.quanZhi){
            break;
        }
    }
    if (b == chaiFenPai.end())//如果没有
        return;//跳出
    if (game.zuiHou->daChuPai.yuanSuNum == 4){//最后出牌为三带一张
        if (chaiFenPai[0]->type == DanZhang){//有单牌
            for (auto m : chaiFenPai[0]->pokersXuhao)
                (*b)->AddPokersXuhao(m);
            (*b)->type = SanDaiYi;
            chaiFenPai[0]->type = WeiZhi;
            xuanZePai = **b;
            return;
        }
        else{//需要拆牌
            for (auto mem : chaiFenPai){
                if (mem->type == DanZhang && mem->yuanSuNum > 5){//首先,拆单顺数量大于5的
                    xuanZePai = **b;
                    xuanZePai.AddPokersXuhao(*mem->pokersXuhao.begin());
                    xuanZePai.type = SanDaiYi;
                    ClearChaiFenPai();//拆牌了，一定要清空zz
                    return;
                }
            }
            for (auto mem : chaiFenPai){
                if (mem->type == SanTiao && mem != *b && mem->quanZhi < 14){//其次,拆三条
                    xuanZePai = **b;
                    xuanZePai.AddPokersXuhao(*mem->pokersXuhao.begin());
                    xuanZePai.type = SanDaiYi;
                    ClearChaiFenPai();//拆牌了，一定要清空
                    return;
                }
            }
            for (auto mem : chaiFenPai){
                if (mem->type == DuiZi && mem->quanZhi < 14){//再者,拆对子
                    xuanZePai = **b;
                    xuanZePai.AddPokersXuhao(*mem->pokersXuhao.begin());
                    xuanZePai.type = SanDaiYi;
                    ClearChaiFenPai();//拆牌了，一定要清空
                    return;
                }
            }
        }
    }
    else{//三带一对
        for (auto mem : chaiFenPai){//先找对子
            if (mem->type == DuiZi && mem->quanZhi < 14){
                for (auto m : mem->pokersXuhao)
                    (*b)->AddPokersXuhao(m);
                (*b)->type = SanDaiYi;
                mem->type = WeiZhi;
                xuanZePai = **b;
                return;
            }
        }
        for (auto mem : chaiFenPai){
            if (mem->type == SanTiao && mem != *b && mem->quanZhi < 14){//其次,拆三条
                xuanZePai = **b;
                for (int i = 0; i < 3; ++i)
                    xuanZePai.AddPokersXuhao(*mem->pokersXuhao.begin());
                xuanZePai.type = SanDaiYi;
                ClearChaiFenPai();//拆牌了，一定要清空
                return;
            }
        }
    }
}

void Player::XuYaoFeiji()
{
    ClearChaiFenPai();
    FenXiChaiFenZuHe();
    sort(chaiFenPai.begin(), chaiFenPai.end(), CompareMyself);

    int wing = 0,//翅膀类型
            n = 0;//单顺中三张牌的个数
    for (auto mem : game.zuiHou->daChuPai.pokerQuanZhi){
        if (mem.second == 3)
            ++n;
    }
    if (game.zuiHou->daChuPai.yuanSuNum == 5 * n)//飞机翅膀为对子
        wing = 2;
    else{//飞机翅膀为单张
        while (game.zuiHou->daChuPai.yuanSuNum != 4 * n)
            --n;
        wing = 1;
    }
    auto b = chaiFenPai.begin();
    for (; b != chaiFenPai.end(); ++b){
        if ((*b)->type == SanShun &&
                (*b)->yuanSuNum == 3 * n &&
                (*b)->quanZhi > game.zuiHou->daChuPai.quanZhi)
            break;
    }
    if (b == chaiFenPai.end())
        return;
    int yuanSuNum = 0;
    for (auto mem : chaiFenPai){
        if (mem->type == (wing == 1 ? DanZhang : DuiZi))
            ++yuanSuNum;
    }
    if (yuanSuNum < n)
        return;
    for (auto mem : chaiFenPai){
        if (mem->type == (wing == 1 ? DanZhang : DuiZi)){
            for (auto m : mem->pokersXuhao)
                (*b)->AddPokersXuhao(m);
            mem->type = WeiZhi;
            --n;
        }
        if (!n)
            break;
    }
    (*b)->type = FeiJi;
    xuanZePai = **b;
    return;
}

bool Player::WanJiaChuPai()
{
    if(!XuanPaiGuiDing())
    {
        xuanZePai.Clear();
        return false;
    }

    return DaChuPaiAndClear();
}

bool Player::XuanPaiGuiDing()
{
    if(game.zuiHou && game.zuiHou->daChuPai.yuanSuNum != xuanZePai.yuanSuNum
            && xuanZePai.yuanSuNum != 4 && xuanZePai.yuanSuNum != 2)
        return false;

    xuanZePai.type = WeiZhi;
    FenXiXuanPai();//分析所选牌的类型及权值

    if (xuanZePai.type == WeiZhi)//所选牌不符合规定
        return false;

    if (game.zuiHou){
        if (xuanZePai.type == ZhaDan &&
                (game.zuiHou->daChuPai.type != ZhaDan ||
                 xuanZePai.quanZhi > game.zuiHou->daChuPai.quanZhi))
            return true;
        if (xuanZePai.type != game.zuiHou->daChuPai.type ||
                xuanZePai.yuanSuNum != game.zuiHou->daChuPai.yuanSuNum)//类型不符或数量不符
            return false;
        if (xuanZePai.quanZhi <= game.zuiHou->daChuPai.quanZhi)//选牌不大于上家牌
            return false;
    }
    return true;
}

void Player::FenXiXuanPai()
{
    int NumMax = 0; //同牌面真的最大数量
    int QuanZhiMax = 0; //最大数量的最大权值
    //判断是否为王炸
    if (xuanZePai.yuanSuNum == 2 &&
            xuanZePai.pokerQuanZhi.find(16) != xuanZePai.pokerQuanZhi.end() &&
            xuanZePai.pokerQuanZhi.find(17) != xuanZePai.pokerQuanZhi.end()){
        xuanZePai.type = ZhaDan;
        xuanZePai.quanZhi = 17;
        return;
    }
    //找出相同牌面的最大数量，和最大权值
    for (auto mem : xuanZePai.pokerQuanZhi){
        if (mem.second >= NumMax && mem.first > QuanZhiMax){
            NumMax = mem.second;
            QuanZhiMax = mem.first;
        }
    }
    //根据牌面相同的最大数量判断类型
    switch (NumMax){
    case 4:
        if (xuanZePai.yuanSuNum == 4){//炸弹
            xuanZePai.type = ZhaDan;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        if (xuanZePai.yuanSuNum == 6){//四带两张
            xuanZePai.type = SiDaiEr;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        if (xuanZePai.yuanSuNum == 8){//四带两对
            for (auto mem : xuanZePai.pokerQuanZhi){
                if (mem.second != 2 && mem.second != 4)//牌面不合规
                    return;
            }
            xuanZePai.type = SiDaiEr;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        return;//牌面不合规
    case 3:
    {
        if (xuanZePai.yuanSuNum == 3){//三条
            xuanZePai.type = SanTiao;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        if (xuanZePai.yuanSuNum == 4){//三带一张
            xuanZePai.type = SanDaiYi;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        if (xuanZePai.yuanSuNum == 5){//三带两张
            for (auto mem : xuanZePai.pokerQuanZhi){
                if (mem.second != 3 && mem.second != 2)
                    return;
            }
            xuanZePai.type = SanDaiYi;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        int begin = 0, n = 0;
        for (auto mem : xuanZePai.pokerQuanZhi){//判断连续的3张牌面的最大数量
            if (mem.second == 3){
                if (!begin || begin == mem.first)
                    ++n;
                if (!begin)
                    begin = mem.first;
                if (begin != mem.first && n == 1){
                    n = 1;
                    begin = mem.first;
                }
                ++begin;
            }
        }
        if (xuanZePai.yuanSuNum == 3 * n){//三顺
            xuanZePai.type = SanShun;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        if (xuanZePai.yuanSuNum == 4 * n){//飞机带单张的翅膀
            xuanZePai.type = FeiJi;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        if (xuanZePai.yuanSuNum == 5 * n){//飞机带对子翅膀
            for (auto mem : xuanZePai.pokerQuanZhi){
                if (mem.second != 2 && mem.second != 3)//牌不合规
                    return;
            }
            xuanZePai.type = FeiJi;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        return;//牌不合规
    }
    case 2:
        if (xuanZePai.yuanSuNum == 2){//一对
            xuanZePai.type = DuiZi;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        if (xuanZePai.yuanSuNum >= 6 && !(xuanZePai.yuanSuNum % 2)){//连对
            int begin = 0;
            for (auto mem : xuanZePai.pokerQuanZhi){//确定牌是连续的，并且都是成对的
                if (!begin)
                    begin = mem.first;
                if (begin++ != mem.first || mem.second != 2)//牌不符合规定
                    return;
            }
            xuanZePai.type = ShuangShun;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        return;//牌不符合规定
    case 1:
        if (xuanZePai.yuanSuNum == 1){//单张
            xuanZePai.type = DanZhang;
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
        else if (xuanZePai.yuanSuNum >= 5){//判断是否为顺子
            int begin = 0;
            for (auto mem : xuanZePai.pokerQuanZhi){
                if (!begin)
                    begin = mem.first;
                if (begin++ != mem.first || mem.first >= 15)//牌不是连续的或者带了2及以上的牌
                    return;
            }
            xuanZePai.type = ShunZi;//单顺
            xuanZePai.quanZhi = QuanZhiMax;
            return;
        }
    default://下落，不符合规定
        return;
    }

}

bool Player::DaChuPaiAndClear()
{
    daChuPai = xuanZePai;//把选牌放入出牌区：打出选牌

    bool needclear = true;//本次出牌是否为拆牌，需要更新分析牌堆
    for (auto b = chaiFenPai.begin(); b != chaiFenPai.end(); ++b){
        if (
                (*b)->type == xuanZePai.type &&
                (*b)->quanZhi == xuanZePai.quanZhi &&
                (*b)->yuanSuNum == xuanZePai.yuanSuNum
                )
        {
            //不是拆牌
            delete (*b);
            chaiFenPai.erase(b);
            needclear = false;//不需要清空
            break;
        }
    }

    if (needclear)//需要清空，下次出牌要重新分析
        ClearChaiFenPai();

    for (auto mem : xuanZePai.pokersXuhao){
        shouPai.erase(mem);//从手牌中删除打出牌
    }
    xuanZePai.Clear();//清空选牌区
    return true;
}

bool Player::AiChuPai()
{

    if (xuanZePai.yuanSuNum == 0){//电脑选牌区为空，说明不出
        buChu = true;
        return false;
    }
    //否则正常打出
    return DaChuPaiAndClear();
}

void Player::GuoPai()
{
    buChu = false;
    xuanZePai.Clear();
}

//直接出牌
void Player::zhijieChuPai()
{
    if(chaiFenPai.size() == 1)//剩最后一手牌
    {
        xuanZePai = *chaiFenPai[0];
        return;
    }

    if(chaiFenPai.size() == 2)
    {
        //剩两手牌，出最大的那组

        //“查看”其它玩家手牌，只为分析剩余牌中的最大的
        int maxNum = 0;
        Player *p = game.ShangJia();
        if(*p->shouPai.rbegin() > maxNum)
            maxNum = *p->shouPai.rbegin();
        p = game.XiaJia();
        if(*p->shouPai.rbegin() > maxNum)
            maxNum = *p->shouPai.rbegin();
        for(auto cfp : chaiFenPai)
        {
            //如果手中有比剩余牌还大的一手牌，就先打出该牌
            if(cfp->quanZhi > PokersZuHe::ZhuanQuanZhi(maxNum))
            {
                xuanZePai = *cfp;
                return;
            }
        }

        //否则，打出牌类型最大的牌
        xuanZePai = *chaiFenPai[1];
        return;
    }
    if(game.XiaJia()->shouPai.size() == 1)  //下家手牌为1
    {
        if(this != game.diZhu && game.zuiHou != game.diZhu) //下家为友方
        {
            //没试验过下家牌，就打出最小的一张；否则就正常出牌
            if(!songXiaJiaZou)
            {
                if(chaiFenPai[0]->type == DanZhang &&
                        chaiFenPai[0]->quanZhi == PokersZuHe::ZhuanQuanZhi(*(shouPai.begin())))
                {
                    xuanZePai = *chaiFenPai[0];
                    return;
                }
                else {
                    xuanZePai.AddPokersXuhao(*(shouPai.begin()));
                    xuanZePai.type = DanZhang;
                    xuanZePai.quanZhi = xuanZePai.pokerQuanZhi.begin()->first;
                    //拆牌了！要重新分析牌
                    ClearChaiFenPai();
                    return;
                }
            }
        }   else {
            //下家为地方剩余1牌
            //未实现
        }
    }
    //正常顺序出牌：(A以上的牌尽量不直接出、炸弹不直接出)
    //单牌→对子→双顺→单顺→三条、三带一、飞机
    for (auto mem : chaiFenPai){
        if ((mem->type == DanZhang || mem->type == DuiZi) &&
                mem->quanZhi >= 15 || mem->type == ZhaDan)
            continue;
        xuanZePai = *mem;
        return;
    }
    xuanZePai = *chaiFenPai[0];
    return;
}

void Player::genYouFangPai()
{
    if(game.zuiHou != game.diZhu && game.ShangJia() == game.diZhu)
    {
        return; //上家为地主，但最后出牌方为友方，则不出牌
    }
    for (auto cfp : chaiFenPai)
    {
        //查找相应牌
        if(cfp->type == game.zuiHou->daChuPai.type
                &&  cfp->yuanSuNum == game.zuiHou->daChuPai.yuanSuNum
                &&  cfp->quanZhi > game.zuiHou->daChuPai.quanZhi)
        {
            daChuPai = *cfp;
            break;
        }
    }
    if(chaiFenPai.size() >2 && xuanZePai.quanZhi > 14)
        xuanZePai.Clear();  //手牌数大于2，并且所选择的牌权值大于14（A)，则不出牌
    return;
}

void Player::genDiFangPai()
{
    auto zuiHouChuPai = game.zuiHou->daChuPai;//地方出牌

    //拆成基本牌
    ClearChaiFenPai();
    FenXiChaiFenZuHe();
    sort(chaiFenPai.begin(), chaiFenPai.end(), CompareMyself);

    for(auto cfp : chaiFenPai)
    {
        if(cfp->type == zuiHouChuPai.type
                && cfp->yuanSuNum == zuiHouChuPai.yuanSuNum
                && cfp->quanZhi > cfp->quanZhi)
        {
            xuanZePai = *cfp;
            return;
        }
    }

    //需要拆牌
    switch (zuiHouChuPai.type){
    case DanZhang:  //敌方出的是单牌
        XuYaoDanZhang();
        break;
    case DuiZi:
        XuYaoDuiZi();
        break;
    case ShunZi:
        XuYaoShunZi();
        break;
    case SanTiao:
        break;
    case SanDaiYi:
        XuYaoSanDaiYi();
    case FeiJi:     //飞机，需要组合
        XuYaoFeiji();
        break;
    default:
        break;
    }

    if(xuanZePai.yuanSuNum)
        return;
    //敌方剩一张牌，或有适合的炸弹，就出炸弹
    if(zuiHouChuPai.yuanSuNum > 3 || zuiHouChuPai.quanZhi > 14)
    {
        for(auto cfp:chaiFenPai)
        {
            if(cfp->type == ZhaDan)
            {
                if(game.zuiHou->daChuPai.type == ZhaDan     //如果别人最后出牌为炸弹
                        && cfp->quanZhi <= game.zuiHou->daChuPai.quanZhi)   //且自己的炸弹不大于对方时，
                    continue;   //不能选择改牌
                xuanZePai = *cfp;
                return;
            }
        }
    }
    return;
}
