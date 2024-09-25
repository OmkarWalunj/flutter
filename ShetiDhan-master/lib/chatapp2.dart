import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      initialRoute: '/',
      routes: {
        '/': (context) => UserListScreen(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}

class UserListScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _firestore.collection('users').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final users = snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final userName = user['name'];
              return ListTile(
                title: Text(userName),
                onTap: () {
                  Navigator.pushNamed(context, '/chat', arguments: userName);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _controller = TextEditingController();
  String? currentUserName;

  @override
  void initState() {
    super.initState();
    _getCurrentUserName();
  }

  void _getCurrentUserName() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final userDoc = await _firestore.collection('users').doc(currentUser.uid).get();
      setState(() {
        currentUserName = userDoc['name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String otherUserName = ModalRoute.of(context)!.settings.arguments as String;

    void _sendMessage(String text) async {
      await _firestore.collection('messages').add({
        'text': text,
        'sender': currentUserName,
        'receiver': otherUserName,
        'timestamp': DateTime.now(),
      });
      _controller.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $otherUserName'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .where('sender', isEqualTo: currentUserName)
                  .where('receiver', isEqualTo: otherUserName)
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final senderMessages = snapshot.data!.docs;

                return StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('messages')
                      .where('sender', isEqualTo: otherUserName)
                      .where('receiver', isEqualTo: currentUserName)
                      .orderBy('timestamp')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final receiverMessages = snapshot.data!.docs;

                    // Combine sender and receiver messages
                    final allMessages = [...senderMessages, ...receiverMessages];
                    allMessages.sort((a, b) => a['timestamp'].compareTo(b['timestamp']));

                    return ListView.builder(
                      itemCount: allMessages.length,
                      itemBuilder: (context, index) {
                        final message = allMessages[index];
                        final messageText = message['text'];
                        final sender = message['sender'];
                        final isMe = sender == currentUserName;

                        return MessageWidget(
                          text: messageText,
                          isMe: isMe,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final text = _controller.text.trim();
                    if (text.isNotEmpty) {
                      _sendMessage(text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class MessageWidget extends StatelessWidget {
  final String text;
  final bool isMe;

  const MessageWidget({
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 3,
            color: isMe ? Colors.blue : Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}