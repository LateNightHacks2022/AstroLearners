import 'package:flutter/material.dart';

import './authentication.dart';
import './home.dart';

class GoogleSignOutButton extends StatefulWidget {
  const GoogleSignOutButton({Key? key}) : super(key: key);

  @override
  _GoogleSignOutButton createState() => _GoogleSignOutButton();
}

class _GoogleSignOutButton extends State<GoogleSignOutButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    bool _isSigningOut = false;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningOut = true;
                });
                await Authentication.signOut(context: context);
                setState(() {
                  _isSigningOut = false;
                });
                MyHomePage.user.name = "Username";
                MyHomePage.user.email = "username@gmail.com";
                MyHomePage.user.imageLink =
                    "https://image.cnbcfm.com/api/v1/image/105992231-1561667465295gettyimages-521697453.jpeg?v=1561667497&w=1600&h=900";

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(
                      title: "Astro Learners",
                      //user: user,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.logout),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
