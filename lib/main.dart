import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  AudioPlayer player = AudioPlayer();

  playNote(String noteNum) {
    player.setAsset("audio/note$noteNum.wav");
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 5),
      body: Column(
        children: [
          NoteBar(
            barColor: Colors.blueAccent,
            noteNum: "1",
            onBarTap: () {
              playNote("1");
            },
          ),
          NoteBar(
            barColor: Colors.orange.shade200,
            noteNum: "2",
            onBarTap: () {
              playNote("2");
            },
          ),
          NoteBar(
            barColor: Colors.purple.shade200,
            noteNum: "3",
            onBarTap: () {
              playNote("3");
            },
          ),
          NoteBar(
            barColor: Colors.green.shade200,
            noteNum: "4",
            onBarTap: () {
              playNote("4");
            },
          ),
          NoteBar(
            barColor: Colors.pink.shade200,
            noteNum: "5",
            onBarTap: () {
              playNote("5");
            },
          ),
          NoteBar(
            barColor: Colors.yellow.shade300,
            noteNum: "6",
            onBarTap: () {
              playNote("6");
            },
          ),
          NoteBar(
            barColor: Colors.redAccent,
            noteNum: "7",
            onBarTap: () {
              playNote("7");
            },
          ),
        ],
      ),
    );
  }
}

class NoteBar extends StatelessWidget {
  NoteBar(
      {super.key,
      required this.barColor,
      required this.noteNum,
      required this.onBarTap});

  final Color barColor;
  final String noteNum;
  VoidCallback onBarTap;
  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBarTap,
      // child: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 2),
      //   child: Container(
      //     height: MediaQuery.of(context).size.height * 0.135,
      //     color: barColor,
      //   ),
      child: Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.135,
          color: barColor,
        ),
      ),
    );
  }
}
