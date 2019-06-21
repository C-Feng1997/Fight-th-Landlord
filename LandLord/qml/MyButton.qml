import QtQuick 2.0
import QtQuick.Controls 2.0
import Felgo 3.0
Scene{
    anchors.fill:parent
    id: scene
//    property alias stack: stackview
    property alias fightoptionview: fightoptionview
    property alias gameingview: gameingview
//    property alias mainPageView: mainPageView


//    StackView {
//        //栈视图实现页面的切换
//        id: stackview
//        anchors.fill: parent
//        initialItem:mainPageView
//    }
//    Component{
//        id:mainPageView
//        MainPage{
//            id:mainPage
//        }

//    }

    Component{
        id:fightoptionview
        FightOption{
            id:fightoption
        }
    }
    Component{
        id:gameingview
        Gameing{
            id:gameing
        }
    }

}
