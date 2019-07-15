import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import ControlQml 1.0


Item{
    id: item
    visible: false

    property alias bgMusic1: bgMusic1
    property alias gametimer: gametimer
    property alias source: touxiangImage1.source
    property alias text: text1.text
    property var shouPai:JSON.parse(sprites.controlQml.showShouPai())
    property var dzPai:JSON.parse(sprites.controlQml.showDiZhuPaiQu())
    property var cpQu0:JSON.parse(sprites.controlQml.showChuPaiQu0())
    property var cpQu1:JSON.parse(sprites.controlQml.showChuPaiQu1())
    property var cpQu2:JSON.parse(sprites.controlQml.showChuPaiQu2())
    property var czcpQu:JSON.parse(sprites.controlQml.chongZhiChuPaiQu())
    property var czspQu:JSON.parse(sprites.controlQml.chongZhiShouPaiQu())

    BackgroundMusic{
        id: bgMusic1
        //设置此属性以在加载该项时自动播放背景音乐，例如在应用程序启动时。默认情况下，它被设置为true。设置的时候。启用音乐的属性也设置为true，音乐在设置对象初始化后播放。
        autoLoad: true
        //设置此属性以在加载该项时自动播放背景音乐，例如在应用程序启动时。默认情况下，它被设置为true。设置的时候。启用音乐的属性也设置为true，音乐在设置对象初始化后播放
        autoPlay: false
        source: "qrc:/images/audio/bgMusic.mp3"
    }

    BackgroundImage {
        id: bgImage
        //背景精灵
        TexturePackerAnimatedSprite {
            id:texturebg1
            source: "../assets/bgImage-1.json"
            frameNames: "bg02.jpg"
            anchors.fill: parent
        }

        anchors.fill: parent
    }

    Gametimer{
        id:gametimer
    }

    //win
    Image {
        id: win
        visible: false
        source: "qrc:/images/icons/win.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    //fail
    Image {
        id: fail
        visible: false
        source: "qrc:/images/icons/fail.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    //玩家头像”我“
    Image{
        id:touxiangImage1
        scale: 0.7
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        source: "qrc:/images/touxiang/touxiang1.png"
        MouseArea{
            anchors.fill: parent
            onPressed: touxiangImage1.opacity=0.5
            onReleased: touxiangImage1.opacity=1
            onClicked: modifyOperate.dialog2.open()
        }
    }
    //玩家头像”张三“
    Image{
        id:touxiangImage2
        //            width: 50
        //            height: 50
        scale: 1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        anchors.left: parent.left
        anchors.leftMargin: 40

        source: "qrc:/images/touxiang/touxaing2.png"
    }
    //李四
    Image{
        id:touxiangImage3
        //            width: 50
        //            height: 50
        scale: 0.7
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "qrc:/images/touxiang/touxaing3.png"
    }
    //玩家名称"我“
    Image {
        id: nameImage1
        //            width: 100
        //            height: 50
        scale: 0.7
        source: "qrc:/images/icons/Button2.png"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 22
        anchors.left: touxiangImage1.right
        anchors.leftMargin:10
        Text {
            id: text1
            text: qsTr("我")
            anchors.centerIn: parent
            style:Text.Sunken
            styleColor: "red"
            font.pointSize: 20
            color: "white"
            anchors.bottomMargin: 0.3 * height
        }
        MouseArea{
            anchors.fill: parent
            onClicked: modifyOperate.dialog3.open()
        }
    }
    //"张三”名字
    Image {
        id: nameImage2
        //            width: 100
        //            height: 50
        scale: 0.7
        source: "qrc:/images/icons/Button2.png"
        anchors.horizontalCenter: touxiangImage2.horizontalCenter
        anchors.top: touxiangImage2.bottom
        anchors.bottomMargin:10
        Text {
            id: text2
            text: qsTr("张三")
            anchors.centerIn: parent
            color: "white"
            style:Text.Sunken
            styleColor: "red"
            font.pointSize: 20
            anchors.bottomMargin: 0.3 * height
        }
    }
    //李四
    Image {
        id: nameImage3
        //            width: 100
        //            height: 50
        scale: 0.7
        source: "qrc:/images/icons/Button2.png"
        //                 anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: touxiangImage3.bottom
        anchors.bottomMargin:10
        anchors.right: parent.right
        //            anchors.rightMargin:5
        Text {
            id: text3
            //                  scale: 0.5
            text: qsTr("李四")
            anchors.centerIn: parent
            style:Text.Sunken
            styleColor: "red"
            color: "white"
            font.pointSize: 20
            anchors.bottomMargin: 0.3 * height
        }
    }
    //张三牌背面
    Image {
        id: paibeiImage1
        scale: 0.3
        source: "qrc:/images/pukepai/paibei-1.png"
        anchors.left:parent.left
        anchors.leftMargin: parent.height/8
        anchors.verticalCenter: parent.verticalCenter
    }
    //李四牌背面
    Image {
        id: paibeiImage2
        scale: 0.3
        source: "qrc:/images/pukepai/paibei-1.png"
        anchors.right: parent.right
        anchors.rightMargin: parent.height/8
        anchors.verticalCenter: parent.verticalCenter
    }

    Sprites{
        id: sprites
    }

    //叫地主
    Button{
        id:dizhuButton
        anchors.left:parent.left
        anchors.leftMargin: parent.width/3
        anchors.bottom:parent.bottom
        anchors.bottomMargin: parent.height/3
        scale:0.4
        Text {
            id: dizhu
            text: qsTr("叫地主")
            font.pointSize: 20
            color: "white"
            anchors.centerIn: parent
        }
        background:Image {
            id: dizhuImage
            source: "qrc:/images/icons/dizhuButton.bmp"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    chupaiImage.opacity=1
                    buchupaiImage.opacity=1
                    dizhuButton.opacity=0
                    dizhuButton2.opacity=0
                    sprites.dizhupaiqubei.opacity=0
                    sprites.dizhupaiqu.visible=true
                }
            }
        }

    }

    //“不叫地主”
    Button{
        id:dizhuButton2
        anchors.right:parent.right
        anchors.rightMargin: parent.width/3
        anchors.bottom:parent.bottom
        anchors.bottomMargin: parent.height/3
        scale:0.4
        Text {
            id: dizhu2
            text: qsTr("不叫")
            font.pointSize: 20
            color: "white"
            anchors.centerIn: parent
        }
        background:Image {
            id: dizhuImage2
            source: "qrc:/images/icons/dizhuButton.bmp"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    //                        chupaiImage.opacity=1
                    //                         buchupaiImage.opacity=1
                    dizhuButton2.opacity=0
                    dizhuButton.opacity=0
                }
            }
        }
    }

    //不出牌按钮
    Button{
        id:buchupaiButton
        anchors.right: parent.right
        anchors.rightMargin: parent.width/15
        anchors.bottom:parent.bottom
        anchors.bottomMargin:parent.height/7
        scale: 2
        background:Image {
            id:buchupaiImage
            source: "qrc:/images/icons/guopai.bmp"
            opacity: 0
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    sprites.controlQml.buChu();

                    buchuBotton0.visible = true;
                    buchuBotton1.visible = false;
                    buchuBotton2.visible = false;

                    sprites.cpQu1 = JSON.parse(sprites.controlQml.chongZhiChuPaiQu());
                    sprites.cpQu2 = JSON.parse(sprites.controlQml.chongZhiChuPaiQu());
                    jieShu();
                    pc1ChuPai.start();
                    pc2ChuPai.start();
                }
            }
        }
    }


    //“我”不出牌按钮
    Button{
        id:buchuBotton0
        visible: false
        anchors.right:parent.right
        anchors.rightMargin: parent.width/2.5
        anchors.bottom:parent.bottom
        anchors.bottomMargin: parent.height/3
        scale:0.4
        Text {
            text: qsTr("不出")
            font.pointSize: 20
            color: "white"
            anchors.centerIn: parent
        }
        background:Image {
            source: "qrc:/images/icons/dizhuButton.bmp"

        }
    }
    //"李四"不出牌按钮
    Button{
        id:buchuBotton1
        visible: false
        anchors.right:parent.right
        anchors.rightMargin: parent.width/20
        anchors.bottom:parent.bottom
        anchors.bottomMargin: parent.height/1.7
        scale:0.4
        Text {
            text: qsTr("不出")
            font.pointSize: 20
            color: "white"
            anchors.centerIn: parent
        }
        background:Image {
            source: "qrc:/images/icons/dizhuButton.bmp"
        }
    }

    //”张三“不出牌按钮
    Button{
        id:buchuBotton2
        visible: false
        anchors.left: parent.left
        anchors.leftMargin: parent.width/20
        anchors.bottom:parent.bottom
        anchors.bottomMargin:parent.height/1.7
        scale:0.4
        Text {
            text: qsTr("不出")
            font.pointSize: 20
            color: "white"
            anchors.centerIn: parent
        }
        background:Image {
            source: "qrc:/images/icons/dizhuButton.bmp"
        }
    }

    Timer{
        id:pc1ChuPai
        interval:2000
        repeat: false
        onTriggered: {
            sprites.controlQml.pc1ChuPai();
            if(sprites.controlQml.buchuBiaozhi1())
            {
                buchuBotton1.visible=true;
            }else{
                buchuBotton1.visible = false
                sprites.cpQu1 = JSON.parse(sprites.controlQml.showChuPaiQu1());
            }
            jieShu();
        }
    }

    Timer{
        id:pc2ChuPai
        interval:4000
        repeat: false
        onTriggered: {
            sprites.controlQml.pc2ChuPai();
            if(sprites.controlQml.buchuBiaozhi2())
            {
                buchuBotton2.visible=true;
            }else{
                buchuBotton1.visible = false
                sprites.cpQu2 = JSON.parse(sprites.controlQml.showChuPaiQu2());
            }
            jieShu();
            buchuBotton0.visible = false;
            sprites.cpQu0 = JSON.parse(sprites.controlQml.chongZhiChuPaiQu());
        }
    }

    function jieShu()
    {

        switch ( sprites.controlQml.jieGuo() ) {
        case 0:
            ;
            break;
        case 1:
            fail.visible = true;
            break;
        case 2:
            win.visible = true;
            break;
        }
    }

    //出牌按钮
    Button{
        id:chupaiButton
        anchors.right: parent.right
        anchors.rightMargin: parent.width/15
        anchors.bottom:parent.bottom
        anchors.bottomMargin: parent.height/4.2
        scale:2
        background:Image {
            id: chupaiImage
            source: "qrc:/images/icons/chupai.bmp"
            opacity: 0
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    //                    console.log(readJson(0));

                    sprites.controlQml.chuPai();

                    chongZhiShuoPai();

                    sprites.shouPai =  JSON.parse(sprites.controlQml.showShouPai());
                    sprites.cpQu0 = JSON.parse(sprites.controlQml.showChuPaiQu0());
                    buchuBotton1.visible = false;
                    buchuBotton2.visible = false;

                    sprites.cpQu1 = JSON.parse(sprites.controlQml.chongZhiChuPaiQu());
                    sprites.cpQu2 = JSON.parse(sprites.controlQml.chongZhiChuPaiQu());
                    jieShu();
                    pc1ChuPai.start();
                    pc2ChuPai.start();

                }
            }
        }
    }

    //设置
    Image {
        id: setImage
        source: "qrc:/images/icons/set.png"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        MouseArea{
            anchors.fill: parent
            onClicked: setting.dialog1.open()
        }
    }
    //back
    Image{
        id:backImage
        source: "qrc:/images/icons/back.png"
        width:parent.width/10
        height: parent.width/10
        anchors.topMargin: 20
        anchors.right: parent.right
        MouseArea{
            id:backmouse
            anchors.fill: parent
            onClicked: {
                stackView.pop()
                playing.bgMusic1.stop()
                mainScene.bgMusic.play()
                gametimer.re.opacity=0
            }

        }
    }
    //背景切换
    Image {
        id: skin1
        source: "qrc:/images/icons/down.png"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 40
        MouseArea{
            id:skinmouse1
            anchors.fill: parent
            property int count: 0
            onClicked: {
                count++
                if(count==1){
                    texturebg1.source="../assets/bgImage-1.json"
                    texturebg1.frameNames = "bg06.png"
                }
                if(count==2){
                    texturebg1.source= "../assets/bgImage-1.json"
                    texturebg1.frameNames="bg01.jpg"
                }
                if(count==3){
                    texturebg1.source= "../assets/bgImage-2.json"
                    texturebg1.frameNames = "bg03.jpg"
                }
                if(count==4){
                    texturebg1.source= "../assets/bgImage-2.json"
                    texturebg1.frameNames = "bg04.jpg"
                }
                if(count==5){
                    texturebg1.source= "../assets/bgImage-3.json"
                    texturebg1.frameNames = "bg05.jpg"
                    count=0;
                }
                //                if(count>5){
                //                    count=1
                //                }
            }
        }
    }

    Image {
        id: skin2
        source: "qrc:/images/icons/up.png"
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.bottom: skin1.top
        anchors.bottomMargin: 5
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(skinmouse1.count==1){
                    texturebg1.frameNames="bg02.jpg"
                    skinmouse1.count=0
                }
                if(skinmouse1.count==2){
                    texturebg1.frameNames = "bg06.png"
                    skinmouse1.count=1
                }
                if(skinmouse1.count==3){
                    texturebg1.source="../assets/bgImage-1.json"
                    texturebg1.frameNames = "bg01.jpg"
                    skinmouse1.count=2
                }
                if(skinmouse1.count==4){
                    texturebg1.source= "../assets/bgImage-2.json"
                    texturebg1.frameNames = "bg03.jpg"
                    skinmouse1.count=3
                }
                if(skinmouse1.count==5){
                    texturebg1.source= "../assets/bgImage-2.json"
                    texturebg1.frameNames = "bg04.jpg"
                    skinmouse1.count=4
                }

            }
        }
    }




    function chongZhiShuoPai(){
        if(sprites.controlQml.showShouPaiNum() === 0)
        {
            sprites.sprite0.xuHao = -1;
            sprites.sprite1.xuHao =-1;
            sprites.sprite2.xuHao = -1;
            sprites.sprite3.xuHao = -1;
            sprites.sprite4.xuHao = -1;
            sprites.sprite5.xuHao = -1;
            sprites.sprite6.xuHao = -1;
            sprites.sprite7.xuHao = -1;
            sprites.sprite8.xuHao = -1;
            sprites.sprite9.xuHao = -1;
            sprites.sprite10.xuHao = -1;
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===1)
        {
            sprites.sprite1.xuHao = -1;
            sprites.sprite2.xuHao = -1;
            sprites.sprite3.xuHao = -1;
            sprites.sprite4.xuHao = -1;
            sprites.sprite5.xuHao = -1;
            sprites.sprite6.xuHao = -1;
            sprites.sprite7.xuHao = -1;
            sprites.sprite8.xuHao = -1;
            sprites.sprite9.xuHao = -1;
            sprites.sprite10.xuHao = -1;
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===2)
        {
            sprites.sprite2.xuHao = -1;
            sprites.sprite3.xuHao = -1;
            sprites.sprite4.xuHao = -1;
            sprites.sprite5.xuHao = -1;
            sprites.sprite6.xuHao = -1;
            sprites.sprite7.xuHao = -1;
            sprites.sprite8.xuHao = -1;
            sprites.sprite9.xuHao = -1;
            sprites.sprite10.xuHao = -1;
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===3)
        {
            sprites.sprite3.xuHao = -1;
            sprites.sprite4.xuHao = -1;
            sprites.sprite5.xuHao = -1;
            sprites.sprite6.xuHao = -1;
            sprites.sprite7.xuHao = -1;
            sprites.sprite8.xuHao = -1;
            sprites.sprite9.xuHao = -1;
            sprites.sprite10.xuHao = -1;
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===4)
        {
            sprites.sprite4.xuHao = -1;
            sprites.sprite5.xuHao = -1;
            sprites.sprite6.xuHao = -1;
            sprites.sprite7.xuHao = -1;
            sprites.sprite8.xuHao = -1;
            sprites.sprite9.xuHao = -1;
            sprites.sprite10.xuHao = -1;
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===5)
        {
            sprites.sprite5.xuHao = -1;
            sprites.sprite6.xuHao = -1;
            sprites.sprite7.xuHao = -1;
            sprites.sprite8.xuHao = -1;
            sprites.sprite9.xuHao = -1;
            sprites.sprite10.xuHao = -1;
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===6)
        {
            sprites.sprite6.xuHao = -1;
            sprites.sprite7.xuHao = -1;
            sprites.sprite8.xuHao = -1;
            sprites.sprite9.xuHao = -1;
            sprites.sprite10.xuHao = -1;
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===7)
        {
            sprites.sprite7.xuHao = -1;
            sprites.sprite8.xuHao = -1;
            sprites.sprite9.xuHao = -1;
            sprites.sprite10.xuHao = -1;
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===8)
        {
            sprites.sprite8.xuHao = -1;
            sprites.sprite9.xuHao = -1;
            sprites.sprite10.xuHao = -1;
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===9)
        {
            sprites.sprite9.xuHao = -1;
            sprites.sprite10.xuHao = -1;
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===10)
        {
            sprites.sprite10.xuHao = -1;
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===11)
        {
            sprites.sprite11.xuHao = -1;
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===12)
        {
            sprites.sprite12.xuHao = -1;
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===13)
        {
            sprites.sprite13.xuHao = -1;
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===14)
        {
            sprites.sprite14.xuHao = -1;
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===15)
        {
            sprites.sprite15.xuHao = -1;
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===16)
        {
            sprites.sprite16.xuHao = -1;
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===17)
        {
            sprites.sprite17.xuHao = -1;
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===18)
        {
            sprites.sprite18.xuHao = -1;
            sprites.sprite19.xuHao = -1;
        }else if(sprites.controlQml.showShouPaiNum()===19)
        {
            sprites.sprite19.xuHao = -1;
        }
    }

}

