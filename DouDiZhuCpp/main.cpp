//#include <QApplication>
#include "pokers.h"

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

    //    int num = QRandomGenerator::global()->bounded(0,53);
    //    for(int i = 0; i!=54; i++)
    //        cout << QRandomGenerator::global()->bounded(0,53) << endl;
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
