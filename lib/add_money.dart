import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMoneyPage extends StatefulWidget {
  const AddMoneyPage({super.key});

  @override
  State<AddMoneyPage> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoneyPage> with TickerProviderStateMixin {
  late AnimationController _cardAnimationController;
  late AnimationController _atmAnimationController;
  late AnimationController _buttonAnimationController;
  late AnimationController _addMoneyAnimationController;
  late AnimationController _enterAmountAnimationController;
  late AnimationController _amountAnimationController;
  late AnimationController _pleaseWaitController;
  bool _showAddMoney = false;

  late final Animation<Offset> _cardAnimation;
  late final Animation<Offset> _atmAnimation;
  late final Animation<Offset> _textAnimation;
  late final Animation<Offset> _buttonAnimation;
  late final Animation<Offset> _addMoneyAnimation;
  late final Animation<double> _addMoneyWidthAnimation;
  late final Animation<double> _addMoneyHeightAnimation;
  late final Animation<double> _enterAmountAnimation;
  late final Animation<double> _amountAnimation;
  late final Animation<double> _pleaseWaitAnimation;

  final _cardTweenBegin = Offset(-100, -700);
  final _end = Offset.zero;
  final _atmTweenBegin = Offset(-200, -50);
  final _textTweenBegin = Offset(0, 200);
  final _addMoneybegin = Offset(0, 0);
  final _addMoneyEnd = Offset(-11, 0);
  final _addMoneySecondSequenceEnd = Offset(-10.8, -12.6);
  final _enterSequenceEnd = Offset(-13.7, -13.9);

  @override
  void initState() {
    super.initState();

    _cardAnimationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _atmAnimationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _buttonAnimationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _addMoneyAnimationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _enterAmountAnimationController = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );

    _amountAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _pleaseWaitController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _cardAnimation = Tween<Offset>(begin: _atmTweenBegin, end: _end).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _atmAnimation = Tween<Offset>(begin: _cardTweenBegin, end: _end).animate(
      CurvedAnimation(parent: _atmAnimationController, curve: Curves.easeInOut),
    );

    _textAnimation = Tween<Offset>(begin: _textTweenBegin, end: _end).animate(
      CurvedAnimation(parent: _atmAnimationController, curve: Curves.easeInOut),
    );
    _buttonAnimation = Tween<Offset>(begin: _textTweenBegin, end: _end).animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    //ANIMATION PHASES
    _addMoneyAnimation = TweenSequence<Offset>([
      // Phase 1: going left
      TweenSequenceItem(
        tween: Tween(
          begin: _addMoneybegin,
          end: _addMoneyEnd,
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 30,
      ),

      // Phase 2: going up
      TweenSequenceItem(
        tween: Tween(
          begin: _addMoneyEnd,
          end: _addMoneySecondSequenceEnd,
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 40,
      ),

      //Phase 3: staying up
      TweenSequenceItem(
        tween: ConstantTween(_addMoneySecondSequenceEnd),
        weight: 0.4, // Hold the final position
      ),

      //enetering the ATM
      TweenSequenceItem(
        tween: Tween(
          begin: _addMoneySecondSequenceEnd,
          end: _enterSequenceEnd,
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 30,
      ),
    ]).animate(_addMoneyAnimationController);

    // Width animation (last phase: grows back to 100)
    _addMoneyWidthAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(100.0), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 100.0, end: 50.0), weight: 40),
      //TweenSequenceItem(tween: ConstantTween(50.0), weight: 0.4),
      //TweenSequenceItem(tween: Tween(begin: 50.0, end: 50.0), weight: 0.1),
      // ⬇️ Final phase: width increases to 100
      TweenSequenceItem(tween: Tween(begin: 50.0, end: 100.0), weight: 30),
    ]).animate(_addMoneyAnimationController);

    // Height animation (final phase: stays at 50)
    _addMoneyHeightAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(200.0), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 200.0, end: 100.0), weight: 40),
      //TweenSequenceItem(tween: ConstantTween(100.0), weight: 0.4),
      TweenSequenceItem(tween: Tween(begin: 100.0, end: 50.0), weight: 40),
      // ⬇️ Final phase: height remains 50
      TweenSequenceItem(tween: ConstantTween(30.0), weight: 40),
    ]).animate(_addMoneyAnimationController);

    _enterAmountAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _enterAmountAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _amountAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _amountAnimationController, curve: Curves.easeIn),
    );
  
  _pleaseWaitAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _pleaseWaitController, curve: Curves.easeIn),
    );
    //Start animation after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cardAnimationController.forward();
    });
    // Future.delayed(Duration(milliseconds: 1000), () {
    //   _cardAnimationController.forward();
    // });

    //Atm coming in after some seconds
    Future.delayed(Duration(milliseconds: 800), () {
      _atmAnimationController.forward();
    });

    //Button coming in after some seconds
    Future.delayed(Duration(milliseconds: 2000), () {
      _buttonAnimationController.forward();
    });

    _addMoneyAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Start the enter amount animation when card insertion is complete
        _enterAmountAnimationController.forward();

        setState(() {
          _showAddMoney = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _cardAnimationController.dispose();
    _atmAnimationController.dispose();
    _buttonAnimationController.dispose();
    _addMoneyAnimationController.dispose();
    _enterAmountAnimationController.dispose();
    _amountAnimationController.dispose();
    super.dispose();
  }

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
                  child: GestureDetector(
                    onTap: () {
                      context.go('/');
                    },
                    child: Icon(Icons.arrow_back_ios, size: 24),
                  ),
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
                  child: SlideTransition(
                    position: _atmAnimation,
                    child: Stack(
                      children: [
                        Container(
                          width: 260,
                          height: 400,
                          child: Image.asset(
                            'assets/images/atm.png',
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          top: 30,
                          left: 60,
                          child: FadeTransition(
                            opacity: _enterAmountAnimation,
                            child: Container(
                              width: 88.23769176858262,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(37, 37, 37, 0.6),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: Text(
                                      'Enter Amount',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 15),
                                  FadeTransition(
                                    opacity: _amountAnimation,
                                    child: Text(
                                      '₦10,000',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 2),
                                  Container(
                                    width: 61,
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //ATm card
                Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: SlideTransition(
                    position: _cardAnimation,

                    child: AnimatedBuilder(
                      animation: _addMoneyAnimationController,
                      builder: (context, _) {
                        //double scale = _addMoneySizeAnimation.value / 200;
                        double width = _addMoneyWidthAnimation.value;
                        double height = _addMoneyHeightAnimation.value;
                        double scale =
                            height /
                            200.0; // scale your text and spacing based on height

                        return Transform.translate(
                          offset: _addMoneyAnimation.value * 10,
                          child: Transform.scale(
                            scale: scale,
                            child: Stack(
                              children: [
                                Container(
                                  width: width,
                                  height: height,
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
                                      padding: EdgeInsets.only(
                                        left: 80 * scale,
                                        top: 10 * scale,
                                      ),
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: Text(
                                          'Savings',
                                          style: GoogleFonts.dmSans(
                                            fontSize: 12 * scale,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 80 * scale,
                                        top: 10 * scale,
                                      ),
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: Text(
                                          '₦800,000.00',
                                          style: GoogleFonts.dmSans(
                                            fontSize: 12 * scale * 0.7,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 50 * scale,
                                    top: 20 * scale,
                                  ),
                                  child: RotatedBox(
                                    quarterTurns: 1,
                                    child: Text(
                                      '**** **** **** **** 9087',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 12 * scale,
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
                                      padding: EdgeInsets.only(
                                        left: 2 * scale,
                                        top: 5 * scale,
                                      ),
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: Text(
                                          'Flutter Omah',
                                          style: GoogleFonts.dmSans(
                                            fontSize: 14 * scale,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 0 * scale,
                                        top: 10 * scale,
                                      ),
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: Text(
                                          'Account Name',
                                          style: GoogleFonts.dmSans(
                                            fontSize: 10 * scale,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 140.0 * scale),
                                  child: RotatedBox(
                                    quarterTurns: 1,
                                    child: Image.asset(
                                      'assets/images/master.png',
                                      width: 50 * scale,
                                      height: 50 * scale,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 60,
                height: 6,

                decoration: BoxDecoration(
                  color: Color.fromRGBO(204, 204, 204, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 50),
            SlideTransition(
              position: _textAnimation,
              child: Row(
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
                  GestureDetector(
                    onTap: () {
                      _amountAnimationController.forward();
                    },
                    child: Container(
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
            ),
            SizedBox(height: 30),
            SlideTransition(
              position: _textAnimation,
              child: Row(
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
                            backgroundImage: AssetImage(
                              'assets/images/uba.png',
                            ),
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
            ),

            SizedBox(height: 15),
            SlideTransition(
              position: _textAnimation,
              child: Container(
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
            ),
            SizedBox(height: 30),
            SlideTransition(
              position: _buttonAnimation,
              //child: SlideTransition(
              // position: _addMoneyAnimation,
              child: Container(
                width: 361,
                height: 43,

                child: ElevatedButton(
                  onPressed: () {
                    _addMoneyAnimationController.forward();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(88, 86, 214, 1),
                  ),
                  child: Text(
                    _showAddMoney ? 'Add Money' : 'Insert Card',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              //),
            ),
          ],
        ),
      ),
    );
  }
}
