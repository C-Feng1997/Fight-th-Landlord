#include "player.h"
#include "game.h"
#include <set>
#include <map>
#include <algorithm>

Player::Player(Game &gameNow) : game(gameNow), buChu(false)
{
}

//开始新的一局游戏，做初始化的操作
void Player::NewGame()
{
    buChu = false;
    shouPai.clear();
    xuanZePai.Clear();
    daChuPai.Clear();
    clearChaiFenPai();
}

//清空拆分牌的集合
void Player::clearChaiFenPai()
{
    if(chaiFenPai.empty())  //若拆分牌的集合为空则返回
    {
        return;
    } else {
        for (auto pai : chaiFenPai) {  //析构 拆分牌集合
            delete pai;
            pai = nullptr;
        }
        chaiFenPai.clear();     //清空 拆分牌集合
    }
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
    if(chaiFenPai.empty())
    {

    }
}

//拆分手牌牌型并组成基本牌集合
void Player::FenXiChaiFenZuHe()
{
    if(chaiFenPai.size())
    {
        //拆分牌集合非空，返回
        return;
    }else
    {
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
            wangZha->AddpokersXuhao(FindXuHao(shouPaiFuBen,16));
            wangZha->AddpokersXuhao(FindXuHao(shouPaiFuBen,17));
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
                    ptZhanDan->AddpokersXuhao(FindXuHao(shouPaiFuBen,qzxh.first));
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

            if(quanZhi_shuLiang[15] == 2)
            {
                //对2
                two->type = DuiZi;

                //向 two 对象中添加权值为 15 的2张牌
                two->AddpokersXuhao(FindXuHao(shouPaiFuBen,15));
                two->AddpokersXuhao(FindXuHao(shouPaiFuBen,15));
            }else if(quanZhi_shuLiang[15] ==1 )
            {
                //单张2
                two->type = DanZhang;
                //向 two 对象中添加权值为 15 的1张牌
                two->AddpokersXuhao(FindXuHao(shouPaiFuBen,15));
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
            begin = n = 0;

            //遍历 权值_数量 集合中
            for(auto b = quanZhi_shuLiang.begin(); b != quanZhi_shuLiang.end(); ++b)
            {
                //跳过数目为0的元素
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
                //如果存在牌数等于5张
                if(n == 5)
                {
                    auto p = b;
                    int first = p->first - 4; //顺子中第一个

                    //创建 顺子 牌型对象“顺子”
                    PokersZuHe *shunZi = new PokersZuHe(ShunZi, p->first);

                    //向 "顺子" 中加入这张牌
                    for(; first <= p->first; ++first)
                    {
                        shunZi->AddpokersXuhao(FindXuHao(shouPaiFuBen,first));
                        --quanZhi_shuLiang[first];  //减一
                    }
                    chaiFenPai.push_back(shunZi);
                    exist = true;
                    break;   //从开始重新查找
                }

                //连续的牌面数量小于5个，重新计数；或者已经到集合末尾仍然数量小于5个
                auto end = quanZhi_shuLiang.end();
                if(begin - 1 != b->first || b== --end)
                {
                    if(b->second > 0)
                    {
                        begin = b->first;
                        ++begin;
                        n = 1;
                    }
                    else {
                        begin = n = 0;
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
                        cfp->AddpokersXuhao(FindXuHao(shouPaiFuBen, qzsl.first));
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

        if(quanZhi_shuLiang.empty())
        {
            //分析集合已空，返回
            //删除所有 拆分牌 中 未知 类型的牌型
            DeleteWeiZhi();
            sort(chaiFenPai.begin(),chaiFenPai.end(),CompareMyself);
        }

        //对子
        for(auto qzsl:quanZhi_shuLiang)
        {
            if(qzsl.second == 2)
            {
                PokersZuHe *duiZhi = new PokersZuHe(DuiZi, qzsl.first);

                duiZhi->AddpokersXuhao(FindXuHao(shouPaiFuBen, qzsl.first));
                duiZhi->AddpokersXuhao(FindXuHao(shouPaiFuBen, qzsl.first));

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
            danZhang->AddpokersXuhao(FindXuHao(shouPaiFuBen, qzsl.first));
            quanZhi_shuLiang[qzsl.first] = 0;
            chaiFenPai.push_back(danZhang);
        }
        //删除 权值_集合 中数量为零的元素
        DeleteZeroQuanZhi_shuLiang(quanZhi_shuLiang);
        DeleteWeiZhi();
        sort(chaiFenPai.begin(),chaiFenPai.end(),CompareMyself);
    }
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
    }else


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

