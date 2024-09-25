import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UsersListPage(),
    );
  }
}

class UsersListPage extends StatefulWidget {
  @override
  _UsersListPageState createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  TextEditingController searchController = TextEditingController();
  List<UserInfo> usersList = [];
  List<UserInfo> filteredUsersList = [];
  late String currentUserId;

  @override
  void initState() {
    super.initState();
    getCurrentUserId();
    getUsers();
  }

  void getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserId = user.uid;
      });
    }
  }

  void getUsers() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').get();
    List<UserInfo> users = [];
    for (var doc in querySnapshot.docs) {
      String name = doc['name'];
      String uid = doc['uid'];
      users.add(UserInfo(name: name, uid: uid));
    }
    setState(() {
      usersList = users;
      filteredUsersList = usersList;
    });
  }

  void connectWithUser(String selectedUser) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConversationPage(
          currentUserId: currentUserId,
          selectedUser: selectedUser,
        ),
      ),
    );
  }

  void filterUsersList(String query) {
    List<UserInfo> filteredList = usersList
        .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredUsersList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Chats"),
        elevation: 1.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (query) => filterUsersList(query),
              decoration: InputDecoration(
                fillColor: Colors.purpleAccent[100],
                filled: true,
                labelText: 'Search Users',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => filterUsersList(searchController.text),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsersList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    filteredUsersList[index].name,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                  onTap: () => connectWithUser(filteredUsersList[index].uid),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfo {
  final String name;
  final String uid;

  UserInfo({required this.name, required this.uid});
}

class ConversationPage extends StatelessWidget {
  final String currentUserId;
  final String selectedUser;

  ConversationPage({required this.currentUserId, required this.selectedUser});

  void sendMessage(String messageText) {
    FirebaseFirestore.instance.collection('messages').add({
      'sender': currentUserId,
      'receiver': selectedUser,
      'text': messageText,
      'timestamp': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController messageTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $selectedUser'),
      ),
      body: Column(
        children: [
          Expanded(
            child: MessagesStream(selectedUser: selectedUser),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageTextController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    sendMessage(messageTextController.text);
                    messageTextController.clear();
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  final String selectedUser;

  MessagesStream({required this.selectedUser});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('messages')
          .where('receiver', isEqualTo: selectedUser)
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<MessageBubble> messageBubbles = [];
        for (var doc in snapshot.data!.docs) {
          String sender = doc['sender'];
          String text = doc['text'];
          messageBubbles.add(MessageBubble(sender: sender, text: text));
        }

        return ListView(
          reverse: true,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          children: messageBubbles,
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;

  MessageBubble({required this.sender, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment:
        sender == 'current_user_id' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey[600],
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 5.0,
            color: sender == 'current_user_id' ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: sender == 'current_user_id' ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
