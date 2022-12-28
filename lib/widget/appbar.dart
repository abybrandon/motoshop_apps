import 'package:flutter/material.dart';
import 'package:motoshop_reborn/provider/auth_services.dart';
import 'package:motoshop_reborn/theme.dart';

import 'package:provider/provider.dart';

class customAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);
  final String tittle;
  customAppbar(this.tittle);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.redBg,
      title: Center(
        child: Text(tittle),
      ),
      leading: Icon(Icons.menu, color: Colors.white),
      actions: <Widget>[
        TextButton(
            child: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            })
      ],
    );
  }
}
