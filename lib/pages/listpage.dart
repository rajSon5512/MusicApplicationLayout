import 'package:app_music_player/core/const.dart';
import 'package:app_music_player/pages/details_page.dart';
import 'package:app_music_player/models/music_model.dart';
import 'package:app_music_player/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<MusicModel> _list;
  int _playid;


  @override
  void initState() {
    // TODO: implement initState
    _list=MusicModel.list;
    _playid=3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Skin - Flum',style: TextStyle(
          color: AppColors.styleColor
          ),
        ),
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
      ),
      backgroundColor: AppColors.mainColor,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonWidget(child: Icon(Icons.favorite),
                    size: 50,
                    onTap: (){},),
                    CustomButtonWidget(image: 'assets/logo.jpg',
                    size: 150,
                    borderwidth: 6,
                        onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder:(_)=>DetailsPage() ),
                            );
                        }),
                    CustomButtonWidget(child: Icon(Icons.menu),
                    size: 50,
                        onTap: (){})
                  ],
                ),

              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return AnimatedContainer(
                      padding: EdgeInsets.all(10),
                      duration: Duration(milliseconds: 500),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color:_list[index].id==_playid?AppColors.activeColor:AppColors.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_list[index].title,
                                  style: TextStyle(
                                    color: AppColors.styleColor,
                                    fontSize: 16,
                                  ),),
                                Text(_list[index].album
                                  ,style: TextStyle(
                                      color: AppColors.styleColor.withAlpha(98),
                                      fontSize: 16
                                  ),)
                              ],
                            ),
                            CustomButtonWidget(
                              child: Icon(_list[index].id==_playid?Icons.pause:Icons.play_arrow
                              ,color: Colors.black,),
                              size: 50,
                              asAction: _list[index].id==_playid,
                                onTap: (){
                                  setState(() {
                                    _playid=_list[index].id;
                                  });
                                }
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: _list.length,),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 20,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  AppColors.mainColor.withAlpha(0),
                  AppColors.mainColor
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

              )
            ),
          )
        ],
      )
    );
  }
}
