import 'package:flutter/material.dart';
import 'package:pharmacy/shared/styles/colors.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(' 5 items',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                  mainAxisSpacing: 7,
                  crossAxisSpacing: 7,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: .7,
                  children: List.generate(5, (index) => buildproduct())),
            )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildproduct() {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage('assets\images\image.png'),
          width: double.infinity,
          height: 200,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    '200',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: primary_c),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
