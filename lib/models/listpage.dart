import 'package:app_music_player/core/const.dart';
import 'package:app_music_player/models/music_model.dart';
import 'package:app_music_player/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<MusicModel> _list;

  @override
  void initState() {
    // TODO: implement initState
    _list=MusicModel.list;
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
                    size: 50,),
                    CustomButtonWidget(image: 'assets/logo.jpg',
                    size: 150,
                    borderwidth: 6,),
                    CustomButtonWidget(child: Icon(Icons.menu),
                    size: 50,)
                  ],
                ),

              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
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
                              child: Icon(Icons.play_arrow),
                              size: 30,
                              asAction: false,
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
