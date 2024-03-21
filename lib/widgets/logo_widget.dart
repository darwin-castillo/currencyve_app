import 'package:flutter/widgets.dart';

class LogoWidget extends StatelessWidget {
  double? size;
  LogoWidget({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/logo_app.png',
      height: size ?? 120.0,
      width: (size ?? 120.0) + 20,
    );
  }
}
