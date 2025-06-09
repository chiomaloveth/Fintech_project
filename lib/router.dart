import 'package:animation_project/add_money.dart';
import 'package:animation_project/success_page.dart';
import 'package:animation_project/wallet_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => WalletPage()),

    GoRoute(path: '/addMoney', builder: (context, state) => AddMoneyPage()),

     GoRoute(path: '/successPage', builder: (context, state) => SuccessPage()),
  ],
);
