import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/themes/colors.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //shop name
            const SizedBox(height: 25,),
      
            Text("SUSHI SHOP",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 32,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25,),
            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/salmon_sushi.png'),
            ),
            //title
            const SizedBox(height: 25,),

            Text(
              "AUTHENTIC JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white
              ),
            ),
            //subtitle
            const SizedBox(height: 10,),

            Text(
              "Feel the taste of Popular Japanese Food at your doorsteps",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[200],
                height: 2,
              ),
            ),
      
            //button
            const SizedBox(height: 25,),

            MyButton(
              text: "Get Started",
              onTap: (){
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}