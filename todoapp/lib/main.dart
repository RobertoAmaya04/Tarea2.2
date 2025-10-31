import 'package:flutter/material.dart';
import 'package:todoapp/src/api/models/todo_model.dart';
import 'package:todoapp/src/api/models/user.dart';
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
        initialLocation: '/singin',
        routes: [
          
          GoRoute(
            path: '/singin',
            name: 'sing_in',
            builder: (context, state) => SessionPage(),
          ),
          GoRoute(
            path: '/sinup',
            name: 'sin_up',
            builder: (context, state) => SessionPage(),
          ),

          GoRoute(
            path: '/menu',
            name: 'menu',
            builder: (context, state) {
              final user = state.extra as User;
              return HomePage(user: user);
            },
            routes: [
              GoRoute(
                path: '/:id',
                name: 'update_todo',
                builder: (context, state) {
                  final todo = state.extra as Todo?;
                  return TodoCreateUpdate(todo: todo);
                },
              ),
              // maje si podes revisar porque si quito el ? del Todo de arriba revienta estaria god
              // no logro entender porque pasa y pss ya son las 3am xd
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
