import 'dart:io';

import 'package:MangoBee/widgets/show_toast.dart';
import 'package:MangoBee/widgets/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateCategory extends StatefulWidget {
  UpdateCategory({super.key, this.cat_id, this.cat_image, this.cat_title});
  String? cat_id;
  String? cat_title;
  String? cat_image;

  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  TextEditingController catTitle = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  XFile? catImage;
  String? catImageUrl;

  selectimage() async {
    ImagePicker picker = ImagePicker();

    catImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  updateWriteCatData() async {
    if (catImage == null) {
      CollectionReference categoryData =
          FirebaseFirestore.instance.collection('category');

      categoryData
          .doc(widget.cat_id)
          .update({'cat_title': catTitle.text, 'cat_image': widget.cat_image});
    } else {
      File imageFile = File(catImage!.path);

      //upload image to firebase storage and get image url
      FirebaseStorage storage = FirebaseStorage.instance;
      UploadTask uploadCategory = storage
          .ref('category_images')
          .child(catImage!.name)
          .putFile(imageFile);
      TaskSnapshot snapshot = await uploadCategory;
      catImageUrl = await snapshot.ref.getDownloadURL();

      //input data to firebase collection

      CollectionReference categoryData =
          FirebaseFirestore.instance.collection('category');

      categoryData
          .doc(widget.cat_id)
          .update({'cat_title': catTitle.text, 'cat_image': catImageUrl});
    }
  }

  void initState() {
    super.initState();
    catTitle.text = widget.cat_title!;
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
                    ? InkWell(
                        onTap: () {
                          selectimage();
                        },
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                '${widget.cat_image}',
                                fit: BoxFit.cover,
                              )),
                        ),
                      )
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
                      updateWriteCatData();

                      showToast("Category Updated Successfully");
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
                      "Update Category",
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
