import 'package:flutter/material.dart'; //ImportM

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheckbox =
      false; //Zadajemo stanje u kojem se widget nalazi na pocetku
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Flutter!!!'),
        automaticallyImplyLeading: false, //sklonimo strelicu za nazad
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pop(); //Dajemo funkciju strelici koju sam napravio
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Actions');
            },
            icon: const Icon(
              Icons.info_outline,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        //Prozor se moze skrolati
        child: Column(
          children: [
            Image.asset('images/optimus.jpeg'), //Slika
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.red,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'This is a text Widget!',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            ////////////////////BUTTONS/////////////////
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSwitch
                      ? Colors.red
                      : Colors
                          .blue), //Upitnik oznacava 'Ako je true' a dvotacka 'onda uradi'
              onPressed: () {
                debugPrint('Elevated Button');
              },
              child: const Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('Outlined Button');
              },
              child: const Text('Outlined Button'),
            ),
            TextButton(
              onPressed: () {
                debugPrint('Text Button');
              },
              child: const Text('Text Button'),
            ),

            ///////////////DETEKTORI NAREDBE/////////////
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                //Napravljen Widget pomocu refactora
                debugPrint('CLICK!');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, //centriranje sa podjelom jednakog prostora
                children: const [
                  Icon(
                    Icons.snowboarding_sharp,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.snowboarding_sharp,
                    color: Colors.blue,
                  ),
                  Text(
                    'Row Widget',
                    style: TextStyle(fontSize: 24, color: Colors.blueAccent),
                  ),
                  Icon(
                    Icons.snowboarding_sharp,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.snowboarding_sharp,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Switch(
                value: isSwitch,
                onChanged: (bool newBool) {
                  setState(() {
                    isSwitch = newBool;
                  });
                }),
            Checkbox(
                value: isCheckbox,
                onChanged: (bool? newBool) {
                  setState(() {
                    isCheckbox = newBool;
                  });
                }),
            Image.network(
                'https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg')
          ], //isto kao child, samo sto mozemo imati vise widgeta
        ),
      ),
    );
  }
}
