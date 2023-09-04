import 'package:flutter/material.dart';
import 'package:sushi_shop/components/button.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MaterialApp(
      home: IntroPage()
  ),
  );

}


class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:sred,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
          children: [
            const SizedBox(height: 25),
            Text("SUSHI HEAVEN",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 28,
              color:  Colors.white,
            ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/sushi.png'),
            ),
            const SizedBox(height: 25),
            Text("THE TASTE OF JAPANESE CUISIN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 40,
                color:  Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text("Feel the taste of most popular food from anywhere and anytime ",
              style:TextStyle(
                color: Colors.grey.shade200,
                height: 2,
              ) ,
            ),
            const SizedBox(height: 25),
            MyButton(text: "Get Started",
            onTap:(){
              //go to menu page
              Navigator.pushNamed(context, '/menupage');
            },)
  
          ],
        ),
      ),
    );
  }
}
