import 'dart:io';

import 'package:MangoBee/widgets/show_toast.dart';
import 'package:MangoBee/widgets/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController catTitle = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  XFile? catImage;
  String? catImageUrl;

  selectimage() async {
    ImagePicker picker = ImagePicker();

    catImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  writeCatData() async {
    File imageFile = File(catImage!.path);

    //upload image to firebase storage and get image url
    FirebaseStorage storage = FirebaseStorage.instance;
    UploadTask uploadCategory =
        storage.ref('category_images').child(catImage!.name).putFile(imageFile);
    TaskSnapshot snapshot = await uploadCategory;
    catImageUrl = await snapshot.ref.getDownloadURL();

    //input data to firebase collection

    CollectionReference categoryData =
        FirebaseFirestore.instance.collection('category');

    categoryData.add({'cat_title': catTitle.text, 'cat_image': catImageUrl});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Title";
                  }
                  return null;
                },
                controller: catTitle,
                labelText: 'Category Title',
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff23AA49), width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: catImage == null
                    ? IconButton(
                        onPressed: () {
                          selectimage();
                        },
                        icon: Icon(
                          Icons.photo,
                          size: 50,
                        ))
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          File(catImage!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  if (_formkey.currentState!.validate()) {
                    if (catImage != null) {
                      writeCatData();

                      showToast("Category Added Successfully");
                      Navigator.of(context).pop();
                    } else {
                      showToast("Please Insert an Image");
                    }
                  }
                },
                child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40)),
                    child: const Center(
                        child: Text(
                      "Add Category",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
