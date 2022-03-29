import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: [
    'email'
  ]
);


class GoogleHomeScreen extends StatefulWidget {
  const GoogleHomeScreen({Key? key}) : super(key: key);

  @override
  _GoogleHomeScreenState createState() => _GoogleHomeScreenState();
}
class _GoogleHomeScreenState extends State<GoogleHomeScreen> {

  GoogleSignInAccount? currentUser;

  @override
  void initState() {
    googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        currentUser = account;
      });
    });
    googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sigin in'),
      ),
        body: Container(
          alignment: Alignment.center,
          child: buildWidget(),
        )
    );
  }

  Widget buildWidget(){
    GoogleSignInAccount? user = currentUser;
    if(user != null){
      return Padding(padding: const EdgeInsets.all(12),
      child: Column(
        children: [
           ListTile(
            leading: GoogleUserCircleAvatar(identity: user,),
            title: Text(user.displayName?? ""),
            subtitle: Text(user.email),
          ),
          const SizedBox(height: 20,),
          const Text("Sing In Succesfully",
          style: TextStyle(fontSize: 20),),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: signOut,
              child: const Text('Sign Out'))
        ],
      ),
      );

    }else{
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text("Your Not Signed",
              style: TextStyle(fontSize: 20),),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: signIn,
                child: const Text('Sign In'))
          ],
        ),
      );

    }
  }
  void signOut(){
    googleSignIn.disconnect();
  }

  Future<void> signIn()async{
    try{
      await googleSignIn.signIn();
    }catch(e){
      print("Error Sigin $e");
    }
  }
}
