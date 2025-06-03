import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cards extends StatelessWidget {
  final String text;
  final String amount;
  final Color? cardColor;
  final Color? textColor;
  final double? height;
  final double? width;

  final double? fontSize;

  const Cards({
    super.key,
    required this.text,
    required this.amount,
    this.cardColor,
    this.width = 280,
    this.height = 182,
    this.fontSize,

    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/68.png'),

          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
        color: cardColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    text,
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    amount,
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Text(
            '**** **** **** **** 9087',
            style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Account Name',
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Flutter Omah',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),

              Image.asset(
                'assets/images/master.png',
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
