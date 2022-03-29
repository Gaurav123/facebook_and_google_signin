import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:facebook_and_google_signin/google_facebook.dart';


import 'google_home_screen.dart';
void main() {
  runApp(HomeScreen());
}

String prettyPrint(Map json) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? userData1;
  AccessToken? accessToken1;
  bool checking = true;
   FBFunction facebookFun = FBFunction();
  @override
  void initState() {
    super.initState();
    checkIfIsLogged();
  }

  Future<void> checkIfIsLogged() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      checking = false;
    });
    if (accessToken != null) {
      print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
      // now you can call to  FacebookAuth.instance.getUserData();
      final userData = await facebookFun.facebookUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      accessToken1 = accessToken;
      setState(() {
        userData1 = userData;
      });
    }
  }

  void printCredentials() {
    print(
      prettyPrint(accessToken1!.toJson()),
    );
  }

  Future<void> login() async {
    var result = await facebookFun.facebookLogin();
    //final LoginResult result = await FacebookAuth.instance.login(); // by default we request the email and the public profile

    // loginBehavior is only supported for Android devices, for ios it will be ignored
    // final result = await FacebookAuth.instance.login(
    //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
    //   loginBehavior: LoginBehavior
    //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
    // );

    if (result.status == LoginStatus.success) {
      accessToken1 = result.accessToken;
      printCredentials();
      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      userData1 = userData;
    } else {
      print(result.status);
      print(result.message);
    }

    setState(() {
      checking = false;
    });
  }


  Future<void> logOut() async {
    await FacebookAuth.instance.logOut();
    accessToken1 = null;
    userData1 = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Facebook and Google Auth'),
        ),
        body: checking
            ? Center(
          child: CircularProgressIndicator(),)
            :  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  //Image(image: userData1!['picture']),
                  Text(userData1!['name']),
                  Text(userData1.toString()),

                  /*Text(
                    userData1 != null ? prettyPrint(userData1!) : "NO LOGGED",
                  ),
                  SizedBox(height: 20),*/
                  ElevatedButton(
                    child: Text(
                      userData1 != null ? "facebook LOGOUT".toUpperCase() : "Facebook LOGIN".toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: userData1 != null ? logOut : login,
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute
                          (builder: (context) => const GoogleHomeScreen()));

                      },
                      child: Text('Google Sigining'))
                ],
              ),
            ),
          ),
    );
  }
}