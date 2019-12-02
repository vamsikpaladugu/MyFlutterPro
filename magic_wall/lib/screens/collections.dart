import 'package:flutter/material.dart';
import 'package:magic_wall/screens/search.dart';
import 'package:magic_wall/utils/constants.dart';
import 'package:magic_wall/utils/urls.dart';

class Collections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 3.0, left: 3.0, right: 3.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 2,
      ),
      itemCount: Constants.categories.length,
      itemBuilder: (context, index) {
        return Card(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Search(
                            title: Constants.categories[index].title,
                            url: Urls.searchURL +
                                Constants.categories[index].title,
                          )));
            },
            child: Container(
              child: Container(
                color: Color(0x33000000),
                child: Center(
                    child: Text(
                  Constants.categories[index].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                  image:
                      NetworkImage(Constants.categories[index].backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
        //Image.network(userMap[index]['urls']['full']);
      },
    );
  }
}
