import 'dart:io';

import 'package:MangoBee/screen/admin/add_category.dart';
import 'package:MangoBee/screen/admin/update_category.dart';
import 'package:MangoBee/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool visiable = true;

  final Stream<QuerySnapshot> catStream =
      FirebaseFirestore.instance.collection('category').snapshots();

  add_category() {
    return showDialog(
      context: context,
      builder: (context) {
        return AddCategory();
      },
    );
  }

  update_category(cat_id, cat_image, cat_title) {
    return showDialog(
      context: context,
      builder: (context) {
        return UpdateCategory(
          cat_id: cat_id,
          cat_image: cat_image,
          cat_title: cat_title,
        );
      },
    );
  }

  Future<void> deleteCategory(cat_id) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Are you sure?'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 1)),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('category')
                            .doc(cat_id)
                            .delete();
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 1)),
                        child: Center(
                          child: Text(
                            'Ok',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: visiable
            ? FloatingActionButton(
                backgroundColor: Color(0xff23AA49),
                onPressed: () {
                  add_category();
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ))
            : null,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0xffF1F1F5), width: 1)),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
          title: Text(
            "Category",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: catStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                setState(() {
                  if (notification.direction == ScrollDirection.forward) {
                    visiable = true;
                  } else if (notification.direction ==
                      ScrollDirection.reverse) {
                    visiable = false;
                  }
                });
                return true;
              },
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color(0xffF3F5F7),
                          border:
                              Border.all(color: Color(0xff23AA49), width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            '${data['cat_image']}',
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${data['cat_title']}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.green, width: 1),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        update_category(
                                            document.id,
                                            data['cat_image'],
                                            data['cat_title']);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.red, width: 1),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        deleteCategory(document.id);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
