import 'package:flutter/material.dart';

//传递数据到新页面
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Todo List';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: TodoList(
        todoList: List.generate(
          100,
          (i) {
            return Todo(
                title: 'Todo $i',
                description:
                    'A description of what needs to be done for Todo $i');
          },
        ),
        title: appTitle,
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;

  Todo({this.title, this.description});
}

class TodoList extends StatelessWidget {
  final String title;
  final List<Todo> todoList;

  TodoList({this.title, @required this.todoList});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          final item = todoList[index];
          return ListTile(
            title: Text(item.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TodoDetialPage(
                      todo: item,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TodoDetialPage extends StatelessWidget {
  final Todo todo;

  TodoDetialPage({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
