import 'package:ucaa_datamgt/index.dart';

const int ls = 1280; //1024;
const int ms = 768;
const int ss = 360; //320

class RespWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const RespWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < ms;
  static bool isMedium(BuildContext context) =>
      MediaQuery.of(context).size.width >= ms &&
      MediaQuery.of(context).size.width < ls;
  static bool isLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= ls;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double _width = constraints.maxWidth;
        if (_width >= ls) {
          return largeScreen;
        } else if (_width < ls && _width >= ms) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
