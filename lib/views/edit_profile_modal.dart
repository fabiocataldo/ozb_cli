import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ozb_cli/login/auth.dart';
import 'package:firebase_storage/firebase_storage.dart'
    show FirebaseStorage, Reference, UploadTask;

class EditProfileModal extends StatefulWidget {
  const EditProfileModal({Key? key}) : super(key: key);

  @override
  EditProfileModalState createState() => EditProfileModalState();
}

class EditProfileModalState extends State<EditProfileModal> {
  final Auth _auth = Auth();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  File? _imageFile;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          _nameController.text = userData['name'];
          _emailController.text = currentUser.email ?? '';

          String imageUrl = userData['imageUrl'] ?? '';
          _imageUrl = imageUrl;
        });
      }
    }
  }

  Future<void> _updateUserProfile(String userId, String name, String email,
      {File? imageFile}) async {
    try {
      if (imageFile != null) {
        String imageUrl = await _uploadImageToStorage(userId, imageFile);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'name': name,
          'email': email,
          'imageUrl': imageUrl,
        });
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'name': name,
          'email': email,
        });
      }
      setState(() {
        _nameController.text = name;
        _emailController.text = email;
      });
    } catch (e) {
      print('Error updating user profile: $e');
    }
  }

  Future<String> _uploadImageToStorage(String userId, File imageFile) async {
    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('$userId.jpg');

      UploadTask uploadTask = storageReference.putFile(imageFile);
      await uploadTask;

      String imageUrl = await storageReference.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Error uploading image to storage: $e');
      return '';
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _showEditDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: const Text('Select Image'),
              ),
              if (_imageFile != null)
                Image.file(_imageFile!, width: 50, height: 50),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                String email = _emailController.text;
                _updateUserProfile(
                  _auth.currentUser!.uid,
                  name,
                  email,
                  imageFile: _imageFile,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: _imageFile != null
              ? FileImage(_imageFile!)
              : (_imageUrl != null
                      ? NetworkImage(_imageUrl!)
                      : const AssetImage('assets/avatar.png'))
                  as ImageProvider<Object>,
          radius: 50,
        ),
        const SizedBox(height: 8),
        Text(
          _nameController.text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Text(
          _emailController.text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        ElevatedButton(
          onPressed: _showEditDialog,
          child: const Text('Edit Profile'),
        ),
      ],
    );
  }
}
