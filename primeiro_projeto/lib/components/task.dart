import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/difficulty.dart';
import 'package:primeiro_projeto/data/task_dao.dart';

class TaskCard extends StatefulWidget {
  final String nome;
  final int dificuldade;
  final String foto;

  TaskCard(
    this.nome,
    this.dificuldade, {
    this.foto = 'assets/images/nophoto.png',
    Key? key,
  }) : super(key: key);

  int level = 0;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  int maxLevel = 5;
  int colorLevel = 0;

  List listColors = [
    Colors.lightBlue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pinkAccent,
    Colors.white
  ];

  bool isImageNetwork() {
    if (widget.foto.contains('https://')) {
      return true;
    }
    return false;
  }

  void incrementLevel() {
    if (widget.level < (widget.dificuldade * maxLevel)) {
      widget.level = widget.level + 1;
    } else {
      widget.level = 1;

      if (colorLevel < listColors.length - 1) {
        colorLevel++;
      }
    }
  }

  double incrementProgressIndicator() {
    return (widget.dificuldade > 0)
        ? widget.level / (widget.dificuldade * maxLevel)
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: listColors[colorLevel]),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueGrey),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 72,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: isImageNetwork()
                            ? Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.foto,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(
                          difficultyLevel: widget.dificuldade,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onLongPress: () {
                              TaskDao().delete(widget.nome);
                            },
                            onPressed: () {
                              setState(() {
                                incrementLevel();
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'Up',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.black12,
                        color: Colors.black87,
                        value: incrementProgressIndicator(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nivel: ${widget.level}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
