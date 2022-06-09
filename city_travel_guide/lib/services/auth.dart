import 'package:city_travel_guide/model/user.dart';
import 'package:city_travel_guide/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on user

  Userer _userFromFirebaseUser(User user){
    return user !=null ? Userer(uid: user.uid):null;
  }
//auth change user stream
  Stream<Userer> get user {
    return _auth.authStateChanges()
   // .map((User user)=> _userFromFirebaseUser(user)); same thing as line under
    .map(_userFromFirebaseUser);
  }

//sign in anon(not even needed)
Future signInAnon() async {
  try {
    UserCredential result = await _auth.signInAnonymously();
    User user = result.user;
    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
}

//sign in/register with email
  Future signInWithEmailAndPassword(String email,String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register w/ email
Future registerWithEmailAndPassword(String email,String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('0', 'cark', 100);
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
}


//peace out
Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
}

}