#include "shoupai.h"
#include <iostream>

ShouPai::ShouPai()
{
    m_game = new Game();
    m_game->GameStart();
}

QList<int> ShouPai::ShouPaiQml()
{

    for(auto s : m_game->player[0]->shouPai)
    {
        shouPaiQml.push_back(s);
    }

//    std::cout << "-----------------"<<std::endl;
    for(auto s:shouPaiQml)
//        std::cout<< s << std::endl;
    return shouPaiQml;
}
