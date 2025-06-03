import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMoneyPage extends StatefulWidget {
  const AddMoneyPage({super.key});

  @override
  State<AddMoneyPage> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(Icons.arrow_back_ios, size: 24),
                ),
                Text(
                  'Add Money',
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Icon(Icons.search, size: 34),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 40),
                  child: Container(
                    width: 260,
                    height: 400,
                    child: Image.asset(
                      'assets/images/atm.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(200, 86, 48, 1),
                          image: DecorationImage(
                            image: AssetImage('assets/images/68.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80, top: 10),
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                'Savings',
                                style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.only(left: 80, top: 10),
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                '₦800,000.00',
                                style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 20),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            '**** **** **** **** 9087',
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2, top: 5),
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                'Flutter Omah',
                                style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 10),
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                'Account Name',
                                style: GoogleFonts.dmSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 140.0),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Image.asset(
                            'assets/images/master.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 60,
              height: 6,

              decoration: BoxDecoration(
                color: Color.fromRGBO(204, 204, 204, 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 75,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Center(
                      child: Text(
                        '₦5,000',
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 78,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      '₦10,000',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      '₦20,000',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 120,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      'Enter Amount',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 174,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(230, 230, 230, 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage('assets/images/uba.png'),
                        ),

                        Text(
                          'UBA Bank',
                          style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Image.asset(
                          'assets/images/icon.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 174,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(230, 230, 230, 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/images/gtb.png'),
                      ),

                      Text(
                        'GT Bank',
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1.5, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),
            Container(
              width: 361,
              height: 44,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.add_business_sharp, size: 24),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Connect another bank account',
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 60),
                  Icon(Icons.arrow_forward_ios, size: 24),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 361,
              height: 43,

              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(88, 86, 214, 1),
                ),
                child: Text(
                  'Insert Card',
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
