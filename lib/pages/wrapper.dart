import 'package:flutter/cupertino.dart';
import 'package:nerdesin_ytu/pages/curved_bottom_bar.dart';
import 'package:nerdesin_ytu/services/session_manager.dart';
import 'package:provider/provider.dart';

import '../authenticate/authenticate.dart';
import '../models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      SessionController().userId = user.uid.toString();
      return const CurvedNavigatorBar();
    }
  }
}
