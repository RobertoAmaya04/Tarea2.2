import 'package:flutter/material.dart';
import 'package:todoapp/src/views/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/src/views/login_page.dart';
import 'package:todoapp/src/views/todo_create_update.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "todo-App",
      routerConfig: GoRouter(
        initialLocation: '/login',
        routes: [
          GoRoute(
            path: '/login',
            name: 'login_page',
            builder: (context, state) => LoginPage(),
          ),
          GoRoute(
            path: '/menu',
            name: 'menu',
            builder: (context, state) => HomePage(),
            routes: [
              GoRoute(
                path: '/manage/:id',
                name: 'manageTodo',
                builder: (context, state) => TodoCreateUpdate(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
