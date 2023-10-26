import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Text(
                      "we are".toUpperCase(),
                      style: TextStyle(fontSize: 18, color: Colors.purple),
                    ),
                    Text(
                      "waspha".toUpperCase(),
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 7),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () => context.go('/register'),
                            child: Text("Register")),
                        SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () => context.go('/login'),
                            child: Text("Login")),
                      ],
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Settings"),
                      onTap: () => context.push('/settings_screen'),
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text("Legal"),
                      onTap: () => context.push('/legal'),
                    ),
                  ])),
              CircleAvatar(
                backgroundColor: Colors.black,
                child: IconButton(
                    color: Colors.white,
                    onPressed: () => context.go('/'),
                    icon: Icon(Icons.close)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
