import 'package:flutter/material.dart';
import 'package:todoapp/src/api/fake_data.dart';
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
      debugShowCheckedModeBanner: false,
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
              //final user = state.extra as User;
              final user = amehd;
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
              // Creo que es porque el todo del TodoCreateUpdate es Todo? entonces mandas como argumento una wea de diferente tipo
              // imagino que no afecta en nada el rendimiento no? pues no puede ir null
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
