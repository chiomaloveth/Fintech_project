import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _buttonAnimationController;

  late final Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    super.initState();

    _buttonAnimationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _buttonAnimation = Tween<Offset>(begin: Offset(0, 200), end: Offset(0, 0))
        .animate(
          CurvedAnimation(
            parent: _buttonAnimationController,
            curve: Curves.easeInOut,
          ),
        );

    _buttonAnimationController.forward();
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            _toAccount(),
            _details(),
            _detailsContainer(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () {
              context.go('/addMoney');
            },
            child: Icon(Icons.arrow_back_ios, size: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Add Money',
            style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        Icon(Icons.search, size: 34),
      ],
    );
  }

  Widget _toAccount() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 370,
        height: 171,
        decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 12),
                  child: Text(
                    'To Account',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    '34567uyhd',
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(68, 141, 98, 1),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          left: 4,
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(68, 141, 98, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 2,
                      height: 25,
                      color: Color.fromRGBO(68, 141, 98, 1),
                    ),
                    Container(
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(68, 141, 98, 1),
                      ),
                      child: Icon(Icons.check, color: Colors.white, size: 13),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 170),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    '₦10,000',
                    style: GoogleFonts.dmSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Today, 15 May',
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 30),
                Text(
                  'Today, 15 May',
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _details() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        'Details',
        style: GoogleFonts.dmSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _detailsContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        width: 370,
        height: 171,
        decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 12),
                  child: Text(
                    'Total Paid',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(116, 120, 127, 1),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Text(
                    'Fees',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(116, 120, 127, 1),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Transactions',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(116, 120, 127, 1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 150),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    '₦10,000',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '₦0.00',
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 40),
                Row(
                  children: [
                    Text(
                      '123456789009876543',
                      style: GoogleFonts.dmSans(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 1),
                    Icon(Icons.copy, size: 15),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return SlideTransition(
      position: _buttonAnimation,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SizedBox(
          width: 361,
          height: 43,

          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(88, 86, 214, 1),
            ),
            child: Text(
              'Done',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
