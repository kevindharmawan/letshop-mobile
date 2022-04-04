import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/theme/theme_constant.dart';


class UserSettingsView extends StatefulWidget{
  @override
  _UserSettingsView createState () => _UserSettingsView();

}

class _UserSettingsView extends State<UserSettingsView>{

  File? image;

  Future getImageGallery() async{
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked = await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {

    });
  }

  Future getImageCamera() async{
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked = await _picker.pickImage(source: ImageSource.camera);
    image = File(imagePicked!.path);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Center(
          child : image != null ? ClipOval(
            child:Image.file(
                image!,
                width: Sizing.w(120),
                height: Sizing.w(120),
                fit: BoxFit.cover)) : Container(
                    child: ClipOval(
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                        width: Sizing.w(120),
                        height: Sizing.w(120),
                        fit: BoxFit.cover
                      )
                    )
                ),
        ),
        TextButton(
            onPressed: () async {
              showModalBottomSheet(
                  context: context,
                  builder: (((context) => bottomSheet()))
              );
            },
            child: Text('Change Picture')
        )
      ],
    );

  }

  Widget bottomSheet(){
    return Container(
      height: Sizing.h(140),
      padding: EdgeInsets.only(top: Sizing.h(18), left: Sizing.w(16)),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: Sizing.h(6)),
            child: Text(
              "Choose Picture",
              style: TextStyle(fontSize: FontSize.subheading)
            )
          ),
          ListTile(
              leading: Icon(Icons.camera),
              title: Text("Camera"),
              onTap: () async {
                await getImageCamera();
                Navigator.pop(context);
              }
          ),
          ListTile(
              leading: Icon(Icons.image),
              title: Text("Gallery"),
              onTap: () async {
                await getImageGallery();
                Navigator.pop(context);
              }
          )
        ],
      ),
    );
  }

}
