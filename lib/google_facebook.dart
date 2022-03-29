import 'package:facebook_and_google_signin/signing_type/google_home_screen.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Google {
  
  Future<dynamic> googlesignin()async{
    var data = await googleSignIn.signIn();
    return data;
  }
  Future<dynamic> googlesignout()async{
    var data = await googleSignIn.signOut();
      return data;
  }
  Future<dynamic> googleDisconnect()async{
    var data = await googleSignIn.disconnect();
    return data;
  }
  Future<dynamic> googlesignInSilently()async{
    var data = await googleSignIn.signInSilently();
    return data;
  }


}

class FBFunction {
  Future<dynamic> facebookLogin() async {
    var result = await FacebookAuth.instance.login();
      return result;
  }

  Future<dynamic> facebookLogOut() async {
    var result = await FacebookAuth.instance.logOut();
    return result;
  }

  Future<dynamic> facebookUserData() async {
    var result = await FacebookAuth.instance.getUserData();
      return result;
  }

  Future<dynamic> facebookExpressLogin() async {
    var result = await FacebookAuth.instance.expressLogin();
      return result;
  }

  Future<dynamic> facebookAutoLogAppEventEnabled(bool val) async {
    var result = await FacebookAuth.instance.autoLogAppEventsEnabled(val);
    return result;
  }

  Future<dynamic> facebookAcessToken() async {
    var aceestoken = await FacebookAuth.instance.accessToken;
      return aceestoken;
  }

  Future<dynamic> facebookPermission() async {
    var permission = await FacebookAuth.instance.permissions;
      return permission;
  }
  Future<dynamic> facebookAotuLogEventEnbled() async {
    var isAutoLog = await FacebookAuth.instance.isAutoLogAppEventsEnabled;
      return isAutoLog;
  }
}
