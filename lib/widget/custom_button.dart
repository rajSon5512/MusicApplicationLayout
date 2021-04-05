import 'package:app_music_player/core/const.dart';
import 'package:flutter/material.dart';


class CustomButtonWidget extends StatelessWidget {

  final double size;
  final Widget child;
  final String image;
  final double borderwidth;
  final bool asAction;

  CustomButtonWidget({this.child,this.size,this.borderwidth=2,this.image,this.asAction=false});

  var boxdecoration=BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(200)),
    border: Border.all(
        width: 2,
        color: AppColors.darkBlue
    ),
    boxShadow:
    [BoxShadow(
      color: AppColors.lightBlueShadow,
      blurRadius: 10,
      offset: Offset(5,6),
      spreadRadius: 3,
    ),
      BoxShadow(
        color: Colors.white,
        blurRadius: 5,
        offset: Offset(-5,-5),
        spreadRadius: 3,
      )
      ,],
    gradient: RadialGradient(
        colors: [
          AppColors.mainColor,
          AppColors.mainColor,
          AppColors.mainColor,
          Colors.white
        ]
    ),
  );



  @override
  Widget build(BuildContext context) {

    if(image!=null) {
      boxdecoration = boxdecoration.copyWith(
        image: DecorationImage(
            image: ExactAssetImage(image),
            fit: BoxFit.cover
        ),
      );
    }

    if(asAction){

      boxdecoration=boxdecoration.copyWith(
        gradient: RadialGradient(
            colors:[
              AppColors.lightBlue,
              AppColors.darkBlue,
            ])
      );
    }else{

      boxdecoration=boxdecoration.copyWith(
          gradient: RadialGradient(
              colors:[
                AppColors.mainColor,
                AppColors.mainColor,
                AppColors.mainColor,
                Colors.white
              ])
      );

    }


    return Container(
        width: size,
        height: size,
        decoration:boxdecoration ,
        child: child);
  }
}
