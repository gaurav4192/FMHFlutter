import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget{

  Dashboard({Key? key});

  @override
  _DashboardState createState()=>_DashboardState();

}





class _DashboardState extends State<Dashboard>{

  late IO.Socket socket;
  var isOnline = false;
  var isTyping = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectSocket();
  }

  void joinSocketApi() async {
    try {

      http.Response response = await http.post(
          Uri.parse('http://192.168.29.231:3000/api/join'),
          body: jsonEncode({
            "username":"saurabh",
            "socketId":socket.id
          }),
          headers: {
            'Content-Type': 'application/json',
          }
         );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body); // make sure it's actually JSON!
        print(json['message']);
      } else {
        print('Error responsessss: ${response.body}');
      }

    } catch (e) {
      print('socket error== ${e.toString()}');
    }
  }

  connectSocket() {
    // Dart client
    socket = IO.io('http://192.168.29.231:3000', <String, dynamic>{
      'transports': ['websocket'],
      'timeout': 10000,
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established ${socket.id}');
      joinSocketApi();
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print("connection error$err"));
    socket.onError((err) => print(err));
    // socket.on('chat.show.online', (data) {
    //   print("chat.show.online ${data}");
    // });
    socket.on('chat.online', (data) {
      print("chat.online ${data}");

    });
    socket.on('chat.typing', (data) async {



      setState(() {

      });

    });
    // socket.on('chat.show.message', (data) {
    //   print("chat.show.message ${data}");
    //   chatDetailApi();
    // });
    socket.on('newmsg', (data) {
      print("newmsg ${data}");
      // stopPlayer();
      // isPlaying = false;

    });

  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
   return SafeArea(

       child: Scaffold(
         body: Column(
           children: [
             Container(
               height: 100,
               width: w,
               decoration: const BoxDecoration(
                 color: Color(0xFFFDDF93),
                 borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.0)),
               ),

               child: Container(
                 margin : EdgeInsets.only(top:35),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                         children: [
                           GestureDetector(
                           onTap: () {Navigator.pop(context);},
                           child: Container(
                             margin: EdgeInsets.only(top:3),
                             padding: EdgeInsets.all(8),
                             child: Image.asset('assets/images/arrow.png'),
                           ),
                         ),
                           Row(
                               children:[
                                 Stack(
                                     children:[
                                       ClipRRect(
                                         borderRadius: BorderRadius.circular(25),
                                         child:  Image.asset('assets/images/holder.png',fit: BoxFit.cover,height: 45,width: 45)

                                     ),
                                       Visibility(
                                         visible: isOnline,
                                         child: Container(
                                           margin: EdgeInsets.only(left: 30,top:33),
                                           height: 12,
                                           width: 12,
                                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color:Color(0xFF32CD32) ),
                                         ),
                                       )
                                     ]
                                 ),
                                 Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children:[ Container(
                                       margin:EdgeInsets.only(left:10,right:10),
                                       child: Text(
                                        "Test",
                                         style: TextStyle(
                                             fontSize: 13,
                                             color: Color(0xFF0F0040)
                                         ),
                                       ),
                                     ),
                                       Visibility(
                                         visible : isTyping,
                                         child: Container(
                                           margin:EdgeInsets.only(left:10,right:10),
                                           child: Text(
                                             'typing...',
                                             style: TextStyle(
                                                 fontSize: 13,
                                                 color: Color(0xff008996)
                                             ),
                                           ),
                                         ),
                                       ),
                                     ]
                                 ),

                               ]
                           ),
                         ]
                     ),

                   ],
                 ),
               ),
             ),

           ],
         ),
       )
   );
  }
}