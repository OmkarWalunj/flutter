import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test1/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../product.dart';
import '../provider/auth_provider.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen1> {

  @override
  void initState() {
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    AuthProvider ap = Provider.of<AuthProvider>(context, listen: false);
    CollectionReference productsCollection = FirebaseFirestore.instance.collection('products');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfileScreen(),
              ),
            );
          },
          icon: Icon(Icons.edit),
        ),
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 210,
            width: double.infinity,
            color: Colors.orange,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, // Change this to your desired color
                      width: 2.0, // Change this to your desired width
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.orangeAccent,
                    backgroundImage: NetworkImage(ap.userModel.profilePic),
                    radius: 75,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            ap.userModel.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            ap.userModel.bio,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.greenAccent, // Change the color as needed
              borderRadius: BorderRadius.circular(10.0), // Set the corner radius
              boxShadow: [
                // Add a shadow (optional)
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Text(
              "My Products",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: productsCollection.where('userId', isEqualTo: ap.userModel.userId).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('An error occurred'));
                }
                final List<DocumentSnapshot> products = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to details screen when the product is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(product: Product.fromFirestore(product)),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(product['imageUrl']),
                          ),
                          title: Text(product['name']),
                          subtitle: Text(product['description']),
                          // Implement the rest of the UI for displaying products
                        ),
                      ),
                    );


                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  File? _image;

  @override
  void initState() {
    super.initState();
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
    _nameController = TextEditingController(text: authProvider.userModel.name);
    _bioController = TextEditingController(text: authProvider.userModel.bio);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:const Text('Edit Profile'),
        actions: [
          IconButton(
            onPressed: () {
              // Save changes to profile
              authProvider.updateProfile(context,_nameController.text, _bioController.text, _image);
              Navigator.pop(context);
              setState(() {

              });
            },
            icon:const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  _getImageFromGallery();
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(authProvider.userModel.profilePic.toString()),
                  backgroundColor: Colors.orange,
                  child: _image == null
                      ? const Icon(
                    Icons.camera_alt,
                    size: 40,
                  )
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
           const SizedBox(height: 20),
            TextFormField(
              controller: _bioController,
              decoration:const InputDecoration(labelText: 'Bio'),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}

