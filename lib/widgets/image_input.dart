import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as sysp;

class ImageInput extends StatefulWidget {
  final Function? onSelectImage;

  const ImageInput({this.onSelectImage, super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.platform.pickImage(   //IMAGEPICKER TO SELECT AN IMAGE, TAKES PHOTO FROM DEVICES CAMERA
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if(imageFile == null){
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);   //SET STATE TO SHOW PHOTO ON SCREEN AFTER HAS BEEN TAKEN
    });
    final appDir = await sysp.getApplicationDocumentsDirectory();
    final fileName = p.basename(imageFile.path);
    final savedImage = await _storedImage!.copy('${appDir.path}/${fileName}');    //FOR FUTURE REFERENCE, IN THE VIDEO ITS 'await imageFile!.copy(' BUT IT GIVES AN ERROR
    widget.onSelectImage!(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            label: Text('Take Picture'),
            icon: Icon(Icons.camera),
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
