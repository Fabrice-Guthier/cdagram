import 'package:flutter/material.dart';

class PhotoMaster extends StatefulWidget {
  const PhotoMaster({super.key});

  @override
  State<PhotoMaster> createState() => _PhotoMasterState();
}

class _PhotoMasterState extends State<PhotoMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("CDAstagram")));
  }
}
