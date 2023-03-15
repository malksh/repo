import 'package:flutter/material.dart';
import 'package:malk_counter/taskmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskModel> Tasks = [
    TaskModel(title: "rrrrrr"),
    TaskModel(title: "bbbbbbb"),
    TaskModel(title: "jjjjjjjj"),
    TaskModel(title: "kkkkkkk", subtitle: "kkkkkkk"),
  ];
  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final sub = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("mmmm"))),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    width: 50,
                    height: 300,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextField(
                            controller: title,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: sub,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  if (title.text.isEmpty) //|| sub.text.isEmpty
                                  {
                                  } else {
                                    setState(() {
                                      Tasks.add(TaskModel(
                                          title: title.text,
                                          subtitle: sub.text));
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                                color: Colors.green,
                                child: Row(
                                  children: const [
                                    Text(
                                      'ADD',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(Icons.abc_rounded)
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.green,
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
      body: ListView.builder(
        itemCount: Tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: InkWell(
              child: const Icon(Icons.delete_forever_rounded),
              onTap: () {
                setState(() {
                  Tasks.removeAt(index);
                });
              },
            ),
            title: Text(Tasks[index].title),
            subtitle: Text(Tasks[index].subtitle ?? ''),
            trailing: Checkbox(
                value: Tasks[index].isDone,
                onChanged: (value) {
                  setState(() {
                    Tasks[index].isDone = !Tasks[index].isDone;
                  });
                }),
          );
        },
      ),
    );
  }
}
