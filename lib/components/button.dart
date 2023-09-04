import 'package:flutter/material.dart';
import 'package:sushi_shop/pages/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;


  const MyButton({Key? key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:  BoxDecoration(
          color: pred,
          borderRadius: BorderRadius.circular(40.0),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text
            Text(text,style: TextStyle(color:Colors.white ),
            ),
            const SizedBox(width: 10),
            //icon
            Icon(Icons.arrow_forward,
                color: Colors.white,
            ),
          ],
        ) ,
      ),
    );
  }
}
