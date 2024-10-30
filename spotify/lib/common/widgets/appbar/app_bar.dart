import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin_page.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget ? title;
  final bool hideBack;
  const BasicAppBar({super.key, this. title, this.hideBack= false});

  @override
  Widget build(BuildContext context) {
    return AppBar( //contain arrow backward
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ??  const Text(''),
      leading: hideBack? null: IconButton(
        onPressed: (){
          Navigator.pop(context);
        }, 
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: context.IsDarkMode ? Colors.white.withOpacity(0.03) : Colors.black.withOpacity(0.03),
            shape: BoxShape.circle
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: context.IsDarkMode ? Colors.white : Colors.black,
          ),
        )
        ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}