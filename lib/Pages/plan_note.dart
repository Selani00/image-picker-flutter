import 'package:flutter/material.dart';
import 'package:tese_journey/components/app_colors.dart';
import 'package:tese_journey/components/app_images.dart';

class JourneyPlan extends StatefulWidget {
  const JourneyPlan({super.key});

  @override
  State<JourneyPlan> createState() => _JourneyPlanState();
}

class _JourneyPlanState extends State<JourneyPlan> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.noteback,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconTheme(
          data: IconThemeData(
            color: Colors.white,
            size: 25,
          ),
          child: Icon(Icons.arrow_back),
        ),
        title: Text("Journey Plan",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.normal)),
        actions: [
          IconButton(
              icon: IconTheme(
                  data: IconThemeData(color: Colors.white, size: 25),
                  child: Icon(Icons.menu)),
              onPressed: () {
                //function here
              })
        ],
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        width: width,
        height: height,
        child: ListView(
          children: [
            Container(
                height: height * 0.3,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.image),
                        fit: BoxFit.cover))),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Data and time",
                style: TextStyle(color: AppColors.notetest, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 1, left: 10, right: 10, top: 10),
              child: Text(
                "Title",
                style: TextStyle(color: AppColors.notetest, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 10, right: 10, top: 4),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                minLines: 1,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 1, left: 10, right: 10, top: 10),
              child: Text(
                "Journey Details",
                style: TextStyle(color: AppColors.notetest, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 10, right: 10, top: 4),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                minLines: 1,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 1, left: 10, right: 10, top: 10),
              child: Text(
                "Saved Locations",
                style: TextStyle(color: AppColors.notetest, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 10, right: 10, top: 4),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                minLines: 1,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.mainColor,
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "Plan your journey",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconTheme(
                          data: IconThemeData(color: Colors.white, size: 30),
                          child: Icon(
                            Icons.arrow_right_alt,
                          )),
                      Spacer(),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}


//