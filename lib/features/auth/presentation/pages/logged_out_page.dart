import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:setlist/router/router.gr.dart';

@RoutePage()
class LoggedOutPage extends StatelessWidget {
  const LoggedOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('You have been logged out'),
            FilledButton(
              onPressed: () => context.router.popAndPush(const LoggedOutRoute()),
              child: const Text('Log in'),
            )
          ],
        ),
      ),
    );
  }
}
