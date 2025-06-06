import 'package:animation_project/card.dart';
import 'package:animation_project/clipper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage>
    with SingleTickerProviderStateMixin {
  final int _currentIndex = 0;
  bool _isBalanceHidden = false;
  bool _isSavingsCardOutFront = false;
  bool _showSavingsInBack = true;
  bool _showSavingsInFront = false;
  bool _isAnimating = false;
  late final AnimationController _animationController;

  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(1.0, 0.0))
        .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.linear),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSavingsPosition() {
    if (_isAnimating) return;

    setState(() {
      _isAnimating = true;
    });

    if (!_isSavingsCardOutFront) {
      // Bring to front
      setState(() {
        _showSavingsInFront = true;
        _isSavingsCardOutFront = true;
      });

      Future.delayed(Duration(seconds: 2));

      setState(() {
        _showSavingsInBack = false;
        _isAnimating = false;
      });
    } else {
      // Send to back
      setState(() {
        _showSavingsInBack = true;
        _isSavingsCardOutFront = false;
      });

      Future.delayed(Duration(seconds: 2));

      setState(() {
        _showSavingsInFront = false;
        _isAnimating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _profileSection(),
              SizedBox(height: 20),
              _walletCards(),

              _buttons(),
              SizedBox(height: 32),
              _quickSend(),
              SizedBox(height: 20),
              _transactionHistory(),
              SizedBox(height: 20),
              _successfulMoney(),
              SizedBox(height: 15),
              _bottomNavigation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileSection() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
          radius: 40,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good morning",
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "Flutter Omah",
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(width: 90),
        Icon(Icons.search, size: 24, color: Colors.black),
        SizedBox(width: 7),
        Icon(Icons.notifications_none, size: 24, color: Colors.black),
      ],
    );
  }

  Widget _walletCards() {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // the behind card blue
            Positioned(
              top: 40,
              child: SlideTransition(
                position: _animation,
                child: Container(
                  width: 362,
                  height: 182,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 31, 132, 1),
                  ),
                ),
              ),
            ),

            // Credit Card (Green)
            AnimatedPositioned(
              duration: Duration(seconds: 2),
              curve: Curves.easeIn,
              top: _isSavingsCardOutFront ? 40 : (_isBalanceHidden ? 68 : 0),
              child: SlideTransition(
                position: _animation,
                child: AnimatedOpacity(
                  opacity: _isBalanceHidden ? 0.9 : 1.0,
                  duration: Duration(seconds: 2),
                  child: AnimatedScale(
                    scale: _isSavingsCardOutFront ? 0.95 : 1.0,
                    duration: Duration(seconds: 2),

                    child: Cards(
                      width: 254,
                      height: 182,
                      text: 'Credit Card',
                      amount: '₦800,000.00',
                      cardColor: Color.fromRGBO(155, 177, 70, 1),
                    ),
                  ),
                ),
              ),
            ),

            //Savings Card Orange in back position
            if (_showSavingsInBack)
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                curve: Curves.easeIn,
                top: _isSavingsCardOutFront ? 50 : (_isBalanceHidden ? 68 : 30),
                child: AnimatedOpacity(
                  opacity: _isSavingsCardOutFront
                      ? 1.0
                      : (_isBalanceHidden ? 0.9 : 1.0),
                  duration: Duration(seconds: 2),

                  child: GestureDetector(
                    onTap: () {
                      _toggleSavingsPosition();
                    },
                    child: Cards(
                      text: 'Savings',
                      amount: '₦800,000.00',
                      cardColor: Color.fromRGBO(200, 86, 48, 1),
                    ),
                  ),
                ),
              ),

            // main Wallet Card Blue
            AnimatedPositioned(
              duration: Duration(seconds: 2),
              curve: Curves.easeIn,
              top: _isSavingsCardOutFront ? 100 : 70,
              child: SlideTransition(
                position: _animation,
                child: ClipPath(
                  clipper: CurvedTopClipper(),
                  child: Container(
                    width: 362,
                    height: 182,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(33, 31, 132, 1),
                      image: DecorationImage(
                        image: AssetImage('assets/images/pattern.png'),

                        fit: BoxFit.scaleDown,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),

                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.all(24),
                          child: Column(
                            children: [
                              SizedBox(height: 40),
                              Text(
                                "Omah's Wallet",
                                style: GoogleFonts.dmSans(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),

                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isBalanceHidden = !_isBalanceHidden;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 180),
                                  child: Container(
                                    width: 130,
                                    height: 30,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      //vertical: 0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(
                                        0,
                                        0,
                                        0,
                                        0.2,
                                      ).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Color.fromRGBO(
                                          74,
                                          72,
                                          165,
                                          1,
                                        ).withOpacity(0.2),
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          _isBalanceHidden
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          _isBalanceHidden
                                              ? 'Show Balance'
                                              : 'Hide balance',
                                          style: GoogleFonts.dmSans(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Savings Card - Show here when IN FRONT (after main card in stack)
            if (_showSavingsInFront)
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                curve: Curves.linear,
                top: _isSavingsCardOutFront
                    ? 10 // In front position
                    : 50,
                child: AnimatedOpacity(
                  opacity: _isSavingsCardOutFront ? 1.0 : 0.0,
                  duration: Duration(seconds: 2),
                  child: AnimatedScale(
                    scale: _isSavingsCardOutFront ? 1.1 : 0.8,
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 25,
                            offset: Offset(0, 15),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _toggleSavingsPosition();
                        },
                        child: Cards(
                          text: 'Savings',
                          amount: '₦800,000.00',
                          cardColor: Color.fromRGBO(200, 86, 48, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                  if (_animationController.isAnimating) return;

                  await _animationController.forward();

                  if (mounted) {
                    context.go('/addMoney');
                  }
                },

                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                  child: Image.asset(
                    'assets/images/money-add-02.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Add Money',
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                child: Image.asset(
                  'assets/images/money-send-02.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Send Money',
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                child: Image.asset(
                  'assets/images/Vector.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Freeze',
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                child: Image.asset(
                  'assets/images/more-2.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'More',
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quickSend() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: Color.fromRGBO(224, 224, 224, 1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  'Spend this month',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  '₦500,000.00',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 74,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromRGBO(106, 106, 187, 1),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Container(
                    width: 24,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(163, 42, 129, 1),
                    ),
                  ),
                  SizedBox(width: 4),
                  Container(
                    width: 4,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(67, 129, 73, 1),
                    ),
                  ),
                  SizedBox(width: 4),
                  Container(
                    width: 37,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(112, 22, 120, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: Color.fromRGBO(224, 224, 224, 1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  'Quick Send',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 50, // Height should be 2 * radius
                  child: Stack(
                    children: [
                      // First avatar
                      Positioned(
                        left: 0,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white, // Add border effect
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage(
                              'assets/images/firstimage.png',
                            ),
                          ),
                        ),
                      ),

                      // Second avatar
                      Positioned(
                        left:
                            30, // 50% overlap (radius = 25, so 30 gives good overlap)
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage(
                              'assets/images/secondimage.png',
                            ),
                          ),
                        ),
                      ),

                      // Third avatar
                      Positioned(
                        left: 60,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage(
                              'assets/images/lastimage.png',
                            ),
                          ),
                        ),
                      ),

                      // last avatar
                      Positioned(
                        left: 90,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey[200],
                          child: Text(
                            '+9',
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _transactionHistory() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Transaction History',
          style: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Text(
          'See All',
          style: GoogleFonts.dmSans(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(88, 86, 214, 1),
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  Widget _successfulMoney() {
    return Row(
      children: [
        Image.asset(
          'assets/images/money-add.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Money sent to Golibe Cherish',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'June 2nd, 2025',
              style: GoogleFonts.dmSans(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(width: 60),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '₦50,000',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Successful',
              style: GoogleFonts.dmSans(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_membership_sharp),
          label: 'Card',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_sharp),
          label: 'History',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
