import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ozb_cli/login/auth.dart';
import 'package:ozb_cli/utils/constants.dart';
import 'package:ozb_cli/views/edit_profile_modal.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  Future<String> getUserName(String userId) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (snapshot.exists) {
      Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
      String name = userData['name'];
      return name;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    User? currentUser = auth.currentUser;
    EditProfileModal editModal = const EditProfileModal();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 300,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: EditProfileModal(),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: () {},
          ),
          const ListTile(
            title: Text(''),
            onTap: null,
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            onTap: () {
              auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
