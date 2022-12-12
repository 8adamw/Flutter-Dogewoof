import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:dogewoof/assets/constants.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      child: Column(children: [
        ListTile(
            title: const Text('Home'),
            onTap: () {
                Navigator.pushNamed(context, '/');
            }),
        ListTile(
            title: const Text('Login'),
            onTap: () {
                Navigator.pushNamed(context, '/login');
            },
        ),
        ListTile(
            title: const Text('Register'),
            onTap: () async {
                Navigator.pushNamed(context, '/register');
            },
        ),
        ListTile(
            title: const Text('Logout'),
            onTap: () async {
                if (request.loggedIn) {
                    final response = await request.logout("$siteUrl/authentication/logout/");
                    Navigator.pushNamed(context, '/login');
                }
            },
        ),
        ListTile(
            title: const Text('Artikel'),
            onTap: () {
                Navigator.pushNamed(context, '/artikel');
            },
        ),
      ]),
    );
  }
}
