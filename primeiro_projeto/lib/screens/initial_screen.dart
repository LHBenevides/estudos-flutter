import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';
import 'package:primeiro_projeto/data/task_dao.dart';

//import 'package:primeiro_projeto/data/task_inherited.dart';
import 'package:primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
        actions: [IconButton(onPressed: (){setState(() {
        });}, icon: const Icon(Icons.refresh))],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 70),
        child: FutureBuilder<List<TaskCard>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<TaskCard>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando...')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando...')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando...')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final TaskCard tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                            color: Colors.grey,
                          ),
                          Text(
                            'Não Há Nenhuma Tarefa',
                            style: TextStyle(fontSize: 32, color: Colors.grey),
                          )
                        ],
                      ),
                    );
                  }
                  return const Text('Erro ao Carregar Tarefas', style: TextStyle(color: Colors.grey));
                  break;
              }
              return const Text('Error');
            }),
      ),

      // ListView(
      //   padding: const EdgeInsets.only(top: 10, bottom: 70),
      //   children: TaskInherited.of(context).taskList,
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contextNew) => FormScreen(taskContext: context)),
          ).then((value) => setState((){}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
