import 'dart:io';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:watchshop/Loginpage.dart';
import 'package:firebase_storage/firebase_storage.dart';


class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  late CameraController _cameraController;
  late Future<void> _initializeCameraFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    _initializeCameraFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        centerTitle: true,
        title: const Text(
          "Profile",
                style: TextStyle(
          fontFamily: 'MateSC',
          fontSize: 24, 
        ),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data!.data();

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        user!['profile_picture'] ?? "http://via.placeholder.com/150",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                      onPressed: () {
                        _showImagePicker(context);
                      },
                      icon: const Icon(Icons.camera_alt),
                      label: const Text(
                        "Change Profile Picture",
                        style: TextStyle(
                          fontFamily: 'MateSC',
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  Text(
                user['name'],
                style: const TextStyle(
                  fontFamily: 'MateSC',
                  fontSize: 24, // Adjust the font size as needed
                ),
              ),
                  const SizedBox(height: 20),
                  const Divider(),
                  ListTile(
                    leading: const Icon(LineAwesomeIcons.user),
                    title: Text(
                      "Name: ${user['name']}",
                      style: const TextStyle(
                        fontFamily: 'MateSC',
                        fontSize: 18, // Adjust the font size as needed
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(LineAwesomeIcons.envelope),
                    title: Text(
                      "Email: ${user['email']}",
                      style: const TextStyle(
                        fontFamily: 'MateSC',
                        fontSize: 18,
                    ),
                  ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      _signOut(context);
                    },
                    leading: const Icon(LineAwesomeIcons.alternate_sign_out),
                    title: const Text(
                      "Logout",
                      style: TextStyle(
                        fontFamily: 'MateSC',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("No data"),
            );
          }
        },
      ),
    );
  }

  void _showImagePicker(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Choose an option",
          style: TextStyle(
            fontFamily: 'MateSC',
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: const Text(
                  'Camera',
                  style: TextStyle(
                    fontFamily: 'MateSC',
                  ),
                ),
                onTap: () {
                  _takeImage(context);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: const Text(
                  'Gallery',
                  style: TextStyle(
                    fontFamily: 'MateSC',
                  ),
                ),
                onTap: () {
                  _getImage(context, ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}


  void _getImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Upload image to Firebase Storage
      Reference storageReference = FirebaseStorage.instance.ref().child('profile_pictures/${currentUser!.email}.jpg');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      await uploadTask.whenComplete(() => null);

      // Get the download URL of the uploaded image
      String downloadURL = await storageReference.getDownloadURL();

      // Update the 'profile_picture' field in Firestore with the download URL
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUser!.email)
          .update({'profile_picture': downloadURL});

      // Refresh the UI to display the new profile picture
      setState(() {});
    } else {
      print('No image selected.');
    }
  }

  void _takeImage(BuildContext context) async {
  try {
    await _initializeCameraFuture;
    final XFile imageFile = await _cameraController.takePicture();

    File file = File(imageFile.path);

    // Upload image to Firebase Storage
    Reference storageReference = FirebaseStorage.instance.ref().child('profile_pictures/${currentUser!.email}.jpg');
    UploadTask uploadTask = storageReference.putFile(file);
    await uploadTask.whenComplete(() => null);

    // Get the download URL of the uploaded image
    String downloadURL = await storageReference.getDownloadURL();

    // Update the 'profile_picture' field in Firestore with the download URL
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .update({'profile_picture': downloadURL});

    // Refresh the UI to display the new profile picture
    setState(() {});
  } catch (e) {
    print('Error taking picture: $e');
  }
}

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
