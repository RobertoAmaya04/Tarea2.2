import 'package:flutter/material.dart';
import 'package:todoapp/src/api/models/todo_model.dart';
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
        initialLocation: '/menu',
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
                path: '/:id',
                name: 'update_todo',
                builder: (context, state) {
                  final todo = state.extra as Todo;
                  return TodoCreateUpdate(todo: todo);
                },
              ),

              GoRoute(
                path: '/create',
                name: 'create_todo',
                builder: (context, state) => TodoCreateUpdate(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
