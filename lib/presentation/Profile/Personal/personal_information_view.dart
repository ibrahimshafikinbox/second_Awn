import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_application_2/presentation/Home/Home/Screen/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/// save image on cache using shared_preferences throw image's path
File? imgFile;
String? imgPath;

class personalInformationView extends StatefulWidget {
  const personalInformationView({Key? key}) : super(key: key);

  @override
  State<personalInformationView> createState() =>
      _personalInformationViewState();
}

class _personalInformationViewState extends State<personalInformationView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  var Name_Controller = TextEditingController();
  var arabic_Controller = TextEditingController();
  var Mobile_Controller = TextEditingController();
  var Email_Controller = TextEditingController();
  var Gender_Controller = TextEditingController();
  var Date_Of_Birth_Controller = TextEditingController();
  var Id_Number_Controller = TextEditingController();
  var Nationalty_Controller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal Information ",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  //
                  SizedBox(
                    width: 30,
                  ),
                  if (imgPath != null)
                    CircleAvatar(
                        radius: 35,
                        backgroundImage: Image.file(File(imgPath!)).image,
                        backgroundColor: Colors.grey[400]),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "  your Profile photo ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            onPressed: getImgfromcamera,
                                            child: Row(
                                              children: [
                                                Text("from Camera "),
                                                Icon(Icons.camera_alt)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      myDivider(),
                                      TextButton(
                                        onPressed: () {
                                          deleteData();
                                        },
                                        child: Text("delete photo "),
                                      ),
                                      myDivider(),
                                      TextButton(
                                        onPressed: getImgfromgallery,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("galley"),
                                            Icon(Icons.photo_album),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.elliptical(50, 50),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Text(
                          "Change Photo",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  BuildData(
                      label: "English Name",
                      data: "${homeModel!.data!.email.toString()}"),
                  BuildData(label: "Arabic Name", data: "ابراهيم هيثم شفيق"),
                  BuildData(
                      label: "Mobile Number",
                      data: "${homeModel!.data!.mobile_number.toString()}"),
                  BuildData(
                      label: "Email",
                      data: "${homeModel!.data!.email.toString()}"),
                  BuildData(label: "Gender", data: "Male"),
                  BuildData(
                      label: "Date Of Birth",
                      data: "${homeModel!.data!.date_of_birth.toString()}"),
                  BuildData(
                      label: "Id Number",
                      data: "${homeModel!.data!.id_number.toString()}"),
                  BuildData(label: "Id Expirition Data", data: "00/00/0000"),
                  BuildData(label: "NAtionality", data: "egyptian"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // get image from gallery
  void getImgfromcamera() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      saveData(pickedImage.path.toString()); // path cache
      setState(() {
        imgFile = File(pickedImage.path);
      });
    }
  }

  void getImgfromgallery() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      saveData(pickedImage.path.toString()); // path cache
      setState(() {
        imgFile = File(pickedImage.path);
      });
    }
  }

  void saveData(String val) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('path', val);
    getData();
  }

  void getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      imgPath = sharedPref.getString('path');
    });
  }

  void deleteData() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove('path');
    getData();
  }
}
