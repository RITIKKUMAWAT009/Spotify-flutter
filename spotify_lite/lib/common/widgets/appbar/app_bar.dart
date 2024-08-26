import 'package:flutter/material.dart';
import 'package:spotify_lite/common/helpers/is_dark_mode.dart';
import 'package:velocity_x/velocity_x.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget? title;
  final bool hideBackButton;
  final Widget?action;
  const BasicAppBar({super.key, this.title,  this.hideBackButton=false, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [action??const SizedBox()],
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title??"".text.white.make(),
      leading:hideBackButton?null: IconButton(
        onPressed:(){
          Navigator.pop(context);
        }, icon:Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color:context.isDarkOrNot? Colors.white.withOpacity(0.1):Colors.black.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child:  Icon(Icons.arrow_back_ios_new,size: 25,
        color:context.isDarkOrNot?Colors.white:Colors.black,),
      ),

      ),

    );
  }

  @override
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);
}
