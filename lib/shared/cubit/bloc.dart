import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/models/usermodel.dart';
import 'package:pharmacy/modules/combination.dart';
import 'package:pharmacy/modules/favorites.dart';
import 'package:pharmacy/modules/products.dart';
import 'package:pharmacy/modules/settings.dart';
import 'package:pharmacy/shared/cache/sharedpref.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/combinationmodel.dart';
import '../../models/productmodel.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool islastpage = false;

  void change_onboard(onboardlistlength, index) {
    islastpage = onboardlistlength - 1 == index;
    emit(cgOnBoardingState());
  }

  //navigation bar
  int selectedIndex = 0;

  late PageController pageController =
      PageController(initialPage: selectedIndex);

  void initState() {
    pageController = PageController(initialPage: selectedIndex);
    emit(initbottomnavbar());
  }

  onButtonPressed(int index) {
    selectedIndex = index;
    if (selectedIndex == 0) emit(bottomhomenavbar());
    if (selectedIndex == 1) {
      emit(bottomcombinnavbar());
      getcombins();
      Future.delayed(Duration(seconds: 2), () {
        emit(emptystate());
      });
    }
    if (selectedIndex == 2) emit(bottomfavnavbar());
    if (selectedIndex == 3) emit(bottomprofilenavbar());
    pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  //************************************************** */
  List<Widget> listOfWidget = <Widget>[
    Products(),
    Combination(),
    Favorites(),
    settings(),
  ];

  //*********************************************************//
  //get products
  List<ProductsModel> Prooducts = [];

  void getProducts() {
    Prooducts = [];

    emit(getproductsloadingState());
    FirebaseFirestore.instance.collection('products').get().then((value) {
      value.docs.forEach((element) {
        Prooducts.add(ProductsModel.fromjson(element.data()));
      });
      emit(getproductssuccessState());
      print(ProductsModel);
    }).catchError((error) {
      print(error.toString());
      emit(getproductserrorState());
    });
  }

  //*****************************************************************//
  // create combination
  File? combinimage;

  Future<void> getpickedimage() async {
    final pickedfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      combinimage = File(pickedfile.path);
      emit(pickedcombinimagesuccessState());
    } else {
      print('no image picked');
      emit(pickedcombinimageerrorState());
    }
  }

  void uploadcombinimage({
    required String name,
    required String price,
    required String text,
  }) async {
    emit(createcombinloadingState());
    await FirebaseStorage.instance
        .ref()
        .child('combinations/${Uri.file(combinimage!.path).pathSegments.last}')
        .putFile(combinimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createCombination(price: price, name: name, text: text, image: value);
      }).catchError((error) {
        print(error.toString());
        emit(createcombinsuccessState());
      });
    }).catchError((error) {
      emit(createcombinerrorState());
      print(error.toString());
    });
  }

  void createCombination(
      {required String text,
      required String name,
      required String price,
      String image = ''}) {
    emit(createcombinloadingState());
    CombinModel combinmodel = CombinModel(
      name: name,
      image: image,
      text: text,
      price: price,
    );
    FirebaseFirestore.instance
        .collection('combinations')
        .add(combinmodel.toMap())
        .then((value) {
      emit(createcombinsuccessState());
    }).catchError((error) {
      emit(createcombinerrorState());
    });
  }

  void removecombinimage() {
    combinimage = null;
    emit(RemovecombinimageState());
  }

  //**************************************************************************//
  //get combinations
  List<CombinModel> combins = [];
  void getcombins() {
    combins = [];
    emit(getCombinLoadingState());
    FirebaseFirestore.instance.collection('combinations').get().then((value) {
      value.docs.forEach((element) {
        combins.add(CombinModel.fromjson(element.data()));
      });

      emit(getCombinsuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(getCombinerrorState());
    });
  }

  //********************************************* */
  void emitstate() {
    emit(emptystate());
  }

  //************************************************* */
  //get user data
  UserModel? model;

  void getuserdata() async {
    emit(GetUserLoadingState());
    await Cache_Helper.Init();
    uid = Cache_Helper.getsaved(key: 'uid') ?? 'null';
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      model = UserModel.fromjson(value.data());
      emit(GetUsersuccessState());
    }).catchError((error) {
      emit(GetUsererrorState());
      print(error.toString());
    });
  }
}
