import 'dart:async';
import 'package:amica/pages/login.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'menu.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    connectionChecker();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.tightForFinite(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
          color: const Color(0xff4FA9A7),
        ),
        PositionedDirectional(
          bottom: -150,
          end: 0,
          child: SizedBox(
            child: Transform.rotate(
              angle: 3.14 / 4,
              child: Container(
                constraints: BoxConstraints.tightForFinite(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width),
                decoration: const BoxDecoration(
                  color: Color(0X3FFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(220),
                  ),
                ),
              ),
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Lottie.asset("lottie/dog.json"),
            )
        ),
        Scaffold(
            backgroundColor: const Color(0x004FA9A7),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.width * .15,
                        child: SvgPicture.asset('imagens/logo.svg',
                            color: Colors.white))),
                Text(
                  'Amica',
                  style: GoogleFonts.aclonica(
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontSize: 50),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    'Faça um novo amigo!',
                    style: GoogleFonts.baloo(
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                        fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    'Adote um pet hoje',
                    style: GoogleFonts.aBeeZee(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF2E3359),
                        fontSize: 20),
                  ),
                ),
              ],
            )))
      ],
    );
  }

  Future<void> connectionChecker() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => isConnected ? const Login() : const Menu(),
          ));
    });
  }
}
