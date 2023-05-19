// import 'package:audioplayer/provider_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class AudioPlayerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => AudioPlayerProvider(),
//       child: AudioPlayerControls(),
//     );
//   }
// }
//
// class AudioPlayerControls extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final audioPlayerProvider = Provider.of<AudioPlayerProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audio Player'),
//       ),
//       body: ListView.builder(
//         itemCount: audioPlayerProvider.audioFiles.length,
//         itemBuilder: (context, index) {
//           final audioFile = audioPlayerProvider.audioFiles[index];
//           return ListTile(
//             title: const Text('Audio Player'),
//             trailing: IconButton(
//               icon: Icon(audioFile.isPlaying ? Icons.pause : Icons.play_arrow),
//               onPressed: () => audioPlayerProvider.toggleAudioFile(index),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'dart:typed_data';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class Home extends  StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//
//   int maxduration = 100;
//   int currentpos = 0;
//   String currentpostlabel = "00:00";
//   String audioasset = "assets/audio/ediparavasamo.mp3";
//   bool isplaying = false;
//   bool audioplayed = false;
//   late Uint8List audiobytes;
//
//   AudioPlayer player = AudioPlayer();
//
//   @override
//   void initState() {
//     Future.delayed(Duration.zero, () async {
//
//       ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
//       audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
//       //convert ByteData to Uint8List
//
//       player.onDurationChanged.listen((Duration d) { //get the duration of audio
//         maxduration = d.inMilliseconds;
//         setState(() {
//
//         });
//       });
//
//       player.onAudioPositionChanged.listen((Duration  p){
//         currentpos = p.inMilliseconds; //get the current position of playing audio
//
//         //generating the duration label
//         int shours = Duration(milliseconds:currentpos).inHours;
//         int sminutes = Duration(milliseconds:currentpos).inMinutes;
//         int sseconds = Duration(milliseconds:currentpos).inSeconds;
//
//         int rhours = shours;
//         int rminutes = sminutes - (shours * 60);
//         int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);
//
//         currentpostlabel = "$rhours:$rminutes:$rseconds";
//
//         setState(() {
//           //refresh the UI
//         });
//       });
//
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Text("Play Audio in Flutter App"),
//             backgroundColor: Colors.redAccent
//         ),
//         body: Container(
//             margin: EdgeInsets.only(top:50),
//             child: Column(
//               children: [
//
//                 Container(
//                   child: Text(currentpostlabel, style: TextStyle(fontSize: 25),),
//                 ),
//
//                 Container(
//                     child: Slider(
//                       value: double.parse(currentpos.toString()),
//                       min: 0,
//                       max: double.parse(maxduration.toString()),
//                       divisions: maxduration,
//                       label: currentpostlabel,
//                       onChanged: (double value) async {
//                         int seekval = value.round();
//                         int result = await player.seek(Duration(milliseconds: seekval));
//                         if(result == 1){ //seek successful
//                           currentpos = seekval;
//                         }else{
//                           print("Seek unsuccessful.");
//                         }
//                       },
//                     )
//                 ),
//
//                 Container(
//                   child: Wrap(
//                     spacing: 10,
//                     children: [
//                       ElevatedButton.icon(
//                           onPressed: () async {
//                             if(!isplaying && !audioplayed){
//                               int result = await player.playBytes(audiobytes);
//                               if(result == 1){ //play success
//                                 setState(() {
//                                   isplaying = true;
//                                   audioplayed = true;
//                                 });
//                               }else{
//                                 print("Error while playing audio.");
//                               }
//                             }else if(audioplayed && !isplaying){
//                               int result = await player.resume();
//                               if(result == 1){ //resume success
//                                 setState(() {
//                                   isplaying = true;
//                                   audioplayed = true;
//                                 });
//                               }else{
//                                 print("Error on resume audio.");
//                               }
//                             }else{
//                               int result = await player.pause();
//                               if(result == 1){ //pause success
//                                 setState(() {
//                                   isplaying = false;
//                                 });
//                               }else{
//                                 print("Error on pause audio.");
//                               }
//                             }
//                           },
//                           icon: Icon(isplaying?Icons.pause:Icons.play_arrow),
//                           label:Text(isplaying?"Pause":"Play")
//                       ),
//
//                       ElevatedButton.icon(
//                           onPressed: () async {
//                             int result = await player.stop();
//                             if(result == 1){ //stop success
//                               setState(() {
//                                 isplaying = false;
//                                 audioplayed = false;
//                                 currentpos = 0;
//                               });
//                             }else{
//                               print("Error on stop audio.");
//                             }
//                           },
//                           icon: Icon(Icons.stop),
//                           label:Text("Stop")
//                       ),
//                     ],
//                   ),
//                 )
//
//               ],
//             )
//
//         )
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Icon(
                    Icons.dehaze_rounded,
                    color: Colors.white,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 70,
                  width: 280,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      hintText: 'Search',
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Trending right now',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(children: [
                    Container(
                      height: 150,width: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: const DecorationImage(
                          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                          fit: BoxFit.cover,
                        ),

                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right:8 ,top: 66,),
                      child: Container(
                        child: ListTile(
                          title: Text(" xxxxxxxx"),
                          subtitle: Text("From: to"),
                        ),

                        height: 70,width: 145,
                        decoration: BoxDecoration(
                          color:  Colors.indigo,
                          borderRadius: BorderRadius.circular(12),


                        ),
                      ),
                    ),
                  ],
                  ),
                  Stack(children: [
                    Container(
                      height: 150,width: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: const DecorationImage(
                          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                          fit: BoxFit.cover,
                        ),

                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right:8 ,top: 66,),
                      child: Container(
                        child: ListTile(
                          title: Text(" xxxxxxxx"),
                          subtitle: Text("From: to"),
                        ),

                        height: 70,width: 145,
                        decoration: BoxDecoration(
                          color:  Colors.indigo,
                          borderRadius: BorderRadius.circular(12),


                        ),
                      ),
                    ),
                  ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),

            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,

              child: ListView(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: FlutterLogo(size: 56.0),
                      title: Text('Two-line ListTile'),
                      subtitle: Text('Here is a second line'),
                      trailing: Icon(Icons.favorite_border),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: FlutterLogo(size: 56.0),
                      title: Text('Two-line ListTile'),
                      subtitle: Text('Here is a second line'),
                      trailing: Icon(Icons.favorite_border),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: FlutterLogo(size: 56.0),
                      title: Text('Two-line ListTile'),
                      subtitle: Text('Here is a second line'),
                      trailing: Icon(Icons.favorite_border),
                    ),
                  ),


                ],
              ),
            ),



          ]),
        ),
      ),
    ));
  }
}
