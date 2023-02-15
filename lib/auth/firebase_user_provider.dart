import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ChaliceFirebaseUser {
  ChaliceFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ChaliceFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ChaliceFirebaseUser> chaliceFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ChaliceFirebaseUser>(
      (user) {
        currentUser = ChaliceFirebaseUser(user);
        return currentUser!;
      },
    );
