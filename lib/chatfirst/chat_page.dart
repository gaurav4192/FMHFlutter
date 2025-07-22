import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttersocket/features.auth/chat/presentation/bloc/chat_event.dart';
import 'package:fluttersocket/features.auth/chat/presentation/bloc/chat_state.dart';

import '../features.auth/chat/presentation/bloc/chat_bloc.dart';

class ChatPage extends StatefulWidget{

  final String conversationId;
  final String mate;
  const ChatPage({Key? key,required this.conversationId,required this.mate}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
    final TextEditingController _messageContoller=TextEditingController();
    final _storage=FlutterSecureStorage();
    String userId="";

    @override
  void initState() {
    // TODO: implement initState
      BlocProvider.of<ChatBloc>(context).add(LoadMessageEvent(widget.conversationId));
      fetchUserId();
    super.initState();
  }

  fetchUserId() async{
      userId=await _storage.read(key: 'userId') ?? '';
      setState(() {
        userId=userId;
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _messageContoller.dispose();
    super.dispose();
  }

  void _sendMessage(){

      final content=_messageContoller.text.trim().toString();
      if(!content.isEmpty){
        BlocProvider.of<ChatBloc>(context).add(
          SendMessageEvent(conversationId: widget.conversationId, content: content)
        );
        _messageContoller.clear();
      }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),

            ),
            SizedBox(width: 10,),
            Text('${widget.mate}',
            style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          Expanded(

            child:
                BlocBuilder<ChatBloc,ChatState>(
                    builder:(context,state){
                      if(state is ChatLoadingState)
                        {
                          return CircularProgressIndicator();
                        }
                      else if(state is ChatLoadedState)
                        {
                          return
                          ListView.builder(
                            padding: EdgeInsets.all(20.0),
                            itemCount: state.message.length,
                            itemBuilder: (context,index){

                              //final issentMessage=state.messageResponseModel.data?[index].senderId==userId;
                              if(state.message?[index].senderId.toString()==userId)
                                {
                                  return _buildSendMessage(context,state.message[index].content??'');
                                }
                              else{
                                return _buildRecievedMessage(context, state.message[index].content??'');
                              }

                            },


                          );
                        }

                      else if(state is ChatErrorState)
                        {
                          return Center(child: Text(state.message),);
                        }
                      return Center(child: Text('No message found'),);


                    }

                ),




          ),

           _buildMessageInput()
        ],
      ),
    );
  }

  Widget _buildRecievedMessage(BuildContext context,String message){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(right: 30,top: 5,bottom: 5,left: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)

        ),
        child: Text(message,
        style: Theme.of(context).textTheme.bodyMedium,),
      ),

    );

  }

  Widget _buildSendMessage(BuildContext context,String message){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 30,top: 5,bottom: 5,left: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)

        ),
        child: Text(message,
          style: Theme.of(context).textTheme.bodyMedium,),
      ),

    );

  }

  Widget _buildMessageInput(){
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10), // Rounded corners
    boxShadow: [
    BoxShadow(
    color: Colors.black26,
    offset: Offset(2, 4),
    ),
    ],
    ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GestureDetector(
            onTap: (){

            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.grey,
            ),
          ),

          SizedBox(width: 10,),
          Expanded(
              child:TextField(

                controller: _messageContoller,
                decoration: InputDecoration(
                  hintText: "Message",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none
                ),
                style: TextStyle(color: Colors.white),
              )

          ),

          SizedBox(width: 10,),
          GestureDetector(
            onTap:(){
              _sendMessage();
            },

            child: Icon(
              Icons.send,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
