import 'package:flutter/material.dart';
import 'package:payamlater/presentation/widgets/bubble_indicator_painter.dart';

import 'widgets/sign_in.dart';
import 'widgets/sign_up.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> with SingleTickerProviderStateMixin{

  late PageController _pageController;
  Color left = Color(0xFFFFFFFF);
  Color right = Color(0xFF1B1D3B);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        Image(
                            height:
                            MediaQuery.of(context).size.height > 300 ? 100.0 : 150,
                            fit: BoxFit.fill,
                            image: const AssetImage('assets/logo/logo.png')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: _buildMenuBar(context),
                  ),
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      physics: const ClampingScrollPhysics(),
                      onPageChanged: (int i) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (i == 0) {
                          setState(() {
                            right = Color(0xFF1B1D3B);
                            left = Color(0xFFFFFFFF);
                          });
                        } else if (i == 1) {
                          setState(() {
                            right = Color(0xFFFFFFFF);
                            left = Color(0xFF1B1D3B);
                          });
                        }
                      },
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: const SignIn(),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: SignUp(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 260.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0xFFE8E8E8),//Color(0xFF034A8F)
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),

                  ),
                  onPressed: _onSignInButtonPress,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: left,
                        fontSize: 20.0,
                        fontFamily: 'WorkSansSemiBold'),
                  ),
                ),
              ),
              //Container(height: 33.0, width: 1.0, color: Colors.white),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: _onSignUpButtonPress,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: right,
                        fontSize: 20.0,
                        fontFamily: 'WorkSansSemiBold'),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }}
