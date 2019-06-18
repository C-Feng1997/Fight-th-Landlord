//#include <QApplication>
#include "pokers.h"
#include "pokerszuhe.h"
#include "player.h"
//int main(int argc, char *argv[])
//{
//    QApplication a(argc, argv);

//    return a.exec();
//}

#include <iostream>
#include<QTime>
#include <QtGlobal>
#include <qdebug.h>
#include <QRandomGenerator>

using namespace std;

//void DeleteZeroQuanZhi_ShuLiang(std::map<int, int> &quanZhi_ShuangLiang)
//{

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
    set<int> shouPaiFuBen = {{3},{4},{5},{6},{9},{12},{13},{24},{25},{28},{29},{32},{36},{37},{40},{44},{45}};
    for(auto p: shouPaiFuBen){
        cout<< p << endl;
    }
    cout << "手牌"<<endl;
    map<int,int>  quanZhi_shuLiang{
        {3,1}, {4,3}, {5,1}, {6,1}, {7,1},
        {9,2},{10,1},{11,2}, {12,1}, {13,2},
        {14,2}};
    std::vector<PokersZuHe*> chaiFenPai;

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
//                   shunZi->AddpokersXuhao(FindXuHao(shouPaiFuBen,first));
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

        //删除

    }

    for (auto p: shouPaiFuBen) {
        cout << p << endl;
    }

    for (auto p: chaiFenPai) {
        cout << p->type << "-------" << p->quanZhi << endl;
        for(auto q:p->pokersXuhao)
            cout << q << endl;
        cout << "--------------------------------"<<endl;
    }
    return 0;
}
