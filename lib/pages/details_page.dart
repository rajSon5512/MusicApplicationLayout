import 'package:app_music_player/core/const.dart';
import 'package:app_music_player/pages/custom_progress_widget.dart';
import 'package:app_music_player/widget/custom_button.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Application',style: TextStyle(color: AppColors.lightBlue),),
        backgroundColor: AppColors.mainColor,
      ),
      backgroundColor: AppColors.mainColor,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWidget(size: 50,
                  onTap:(){
                   Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back,
                  color: AppColors.styleColor,),
                ),
                Text('Playing Now',
                  style: TextStyle(
                    color: AppColors.styleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 26
                  ),),
                CustomButtonWidget(size: 50,
                  onTap:(){
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.menu,
                    color: AppColors.styleColor,),
                )
              ],
            ),
            SizedBox(height: 25,),
            CustomButtonWidget(image: 'assets/logo.jpg',
                size: MediaQuery.of(context).size.width*0.7,
                borderwidth: 6,
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder:(_)=>DetailsPage() ),
                  );
                }),
              
            Text('Ram',style: TextStyle(color: AppColors.styleColor,
                fontSize: 32,fontWeight: FontWeight.bold),),
            Text('Rocky',style: TextStyle(color: AppColors.styleColor,
                fontSize: 19,height: 2),),
            SizedBox(height: 50,),
            LinearProgressIndicator(
              value: 0.1,
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(
                    size: 80,
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.fast_rewind,
                      color: AppColors.styleColor,
                    ),
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                    asAction: true,

                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.fast_forward,
                      color: AppColors.styleColor,
                    ),
                    asAction: false,

                  )
                ],
              ),
            ),
            SizedBox(height: 25,)
          ],

        ),
      ),
    );
  }
}
