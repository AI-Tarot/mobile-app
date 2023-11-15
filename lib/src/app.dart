import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:ai_tarot/src/routes/initialization_view.dart';
import 'package:ai_tarot/src/routes/registration/welcome_view.dart';
import 'package:ai_tarot/src/routes/registration/relationship_status_view.dart';
import 'package:ai_tarot/src/routes/registration/interests_view.dart';
import 'package:ai_tarot/src/routes/registration/goals_view.dart';
import 'package:ai_tarot/src/routes/registration/spirit_animal_view.dart';
import 'package:ai_tarot/src/routes/registration/birth_date_view.dart';

import 'package:ai_tarot/src/routes/dashboard_view.dart';

class AITarotApp extends StatefulWidget {
  const AITarotApp({
    super.key,
  });

  @override
  State<AITarotApp> createState() => _AITarotAppState();
}

class _AITarotAppState extends State<AITarotApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('uk'), // Ukrainian
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(fontFamily: 'Lora'),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case '/':
                return const InitializationView();

              case '/registration':
              case '/registration/welcome':
                return const WelcomeView();

              case '/registration/goals':
                return const GoalsView();

              case '/registration/relationship_status':
                return const RelationshipStatusView();

              case '/registration/interests':
                return const InterestsView();

              case '/registration/spirit_animal':
                return const SpiritAnimalView();

              case '/registration/birth_date':
                return const BirthDateView();

              case '/dashboard':
                return const DashboardView();

              default:
                throw Exception('Invalid route: ${routeSettings.name}');
            }
          },
        );
      },
    );
  }
}
