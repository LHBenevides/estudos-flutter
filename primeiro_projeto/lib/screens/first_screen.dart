import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        //capaz de estourar container
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.grey,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.white,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Row(
            //capaz de estourar container
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.pink,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.blue,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: 50,
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.white,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.grey,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Container(
            color: Colors.amber,
            height: 30,
            width: 300,
            child: const Text(
              'Bora Bill!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: () {
              },
              child: const Text('Click no Botão!'))
        ],
      ),
      //   home: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly, //horizontal
      //     crossAxisAlignment: CrossAxisAlignment.end, //vertical
      //     children: [
      //       Container(color: Colors.grey, width: 100, height: 100,),
      //       Container(color: Colors.white, width: 50, height: 50,),
      //     ],
      //   )
      //   home: Column(
      //   mainAxisAlignment: MainAxisAlignment.center, //vertical
      //   crossAxisAlignment: CrossAxisAlignment.start, //horizontal

      //   children: [
      //     Container(color: Colors.grey, width: 100, height: 100,),
      //     Container(color: Colors.white, width: 50, height: 50,),
      //   ],
      // )
      // home:
      // Stack(
      //   alignment: AlignmentDirectional.center, //vertical,
      //   children: [
      //     Container(color: Colors.grey, width: 100, height: 100,),
      //     Container(color: Colors.white, width: 50, height: 50,),
      //   ],
    );
    //);
  }
}
