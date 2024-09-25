import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'ProductService.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProductEntryScreen extends StatefulWidget {
  @override
  _ProductEntryScreenState createState() => _ProductEntryScreenState();
}

class _ProductEntryScreenState extends State<ProductEntryScreen> {
  TextEditingController imagePathController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  bool isAvailable = false;
  bool isLoading = false;
  // Default type
  final productService = ProductService();
  String  userId="";
  Future<void> _pickImage() async {
    userId = (await getCurrentUserId())!;
    // Use userId
      final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagePathController.text = pickedFile.path;
      });
    }
  }
  Future<String?> getCurrentUserId() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      String userId = user.uid;
      return userId;
    } else {
      // No user is signed in
      return null;
    }
  }

  Future<void> _showSuccessDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Product added successfully!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  Future<void> _showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Text("Adding product..."),
            ],
          ),
        );
      },
    );
  }

  Future<void> _hideLoadingDialog(BuildContext context) async {
    Navigator.of(context).pop();
  }

  String productType = 'Seed';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image picking section
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Add Image'),
            ),
            if (imagePathController.text.isNotEmpty)
              Image.file(
                File(imagePathController.text),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16),

            // Product details section
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Available:'),
                const SizedBox(width: 8),
                Checkbox(
                  value: isAvailable,
                  onChanged: (value) {
                    setState(() {
                      isAvailable = value ?? false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              maxLines: 3, // Adjust as needed
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            // Product type selection
            DropdownButtonFormField(
              value: productType,
              onChanged: (value) {
                setState(() {
                  productType = value.toString();
                });
              },

              items: const [
                DropdownMenuItem<String>(
                  value: 'Seed',
                  child: Text('Seed'),
                ),
                DropdownMenuItem<String>(
                  value: 'Fresh From Farm',
                  child: Text('Fresh From Farm'),
                ),
                DropdownMenuItem<String>(
                  value: 'Fertilizer',
                  child: Text('Fertilizer'),
                ),
              ],
              decoration: const InputDecoration(
                labelText: 'Product Type',
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                // Show loading dialog
                await _showLoadingDialog(context);

                try {
                  File imageFile = File(imagePathController.text);

                  await ProductService().addProduct(
                    userId: userId,
                    name: nameController.text,
                    price: double.tryParse(priceController.text) ?? 0.0,
                    availability: isAvailable,
                    type: productType,
                    imageFile: imageFile, description: descriptionController.text,
                  );

                  // Clear the form fields after submission
                  imagePathController.clear();
                  nameController.clear();
                  priceController.clear();
                  isAvailable = false;
                  productType = 'Seed'; // Reset to default type

                  // Show success dialog
                  _showSuccessDialog(context);
                } finally {
                  // Hide loading dialog
                  _hideLoadingDialog(context);

                  setState(() {
                    isLoading = false;
                  });
                }
              },
              child: const Text('Submit'),
            ),


          ],
        ),
      ),
    );
  }
}
