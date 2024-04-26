import 'package:flutter/material.dart';
import 'package:pharmacy/shared/styles/colors.dart';

Future navigate_close(context, Widget targetscreen) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => targetscreen));
}

//for login and register screens only
Widget textformfield({
  required String hinttext,
  required IconData prefixicon,
  required TextEditingController controller,
  required String? Function(String?) validator,
  required TextInputType keyboardType,
}) =>
    Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: primary_c, blurRadius: 20, offset: Offset(0, 10))
        ],
      ),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.grey,
          ))),
          child: TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinttext,
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: Icon(prefixicon),
            ),
          ),
        ),
      ]),
    );

//for login and register only
Widget defaultbutton({
  required String text,
  void Function()? ontap,
}) =>
    InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                primary_c,
                Color.fromRGBO(143, 148, 251, .3),
                primary_c,
              ],
            )),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
