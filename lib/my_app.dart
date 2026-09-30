import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:slowjourney/l10n/app_localizations.dart';

import 'app_state/app_state.dart';
import 'core/constants/app_theme.dart';
import 'core/services/local_notification_service.dart';
import 'core/services/preference_service.dart';
import 'modules/intentions/today_intentions_gate.dart';
import 'modules/onboarding/daily_cycle_page.dart';
import 'modules/onboarding/pin_unlock_page.dart';
import 'modules/onboarding/splash_page.dart';
import 'modules/shell/app_shell.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  DateTime? _inactiveSince;
  bool _holdSplash = true;

  static const _minSplash = Duration(milliseconds: 2200);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  Future<void> _bootstrap() async {
    final started = DateTime.now();
    await context.read<ProfileState>().bootstrap();
    if (!mounted) return;
    final profile = context.read<ProfileState>().profile;
    if (profile != null) {
      if (!mounted) return;
      await context.read<DailyState>().load(profile.id);
      if (!mounted) return;
      await context.read<JourneyFeedState>().load(profile.id);
      if (!mounted) return;
      await context.read<GrowthState>().load(profile.id);
    }
    if (!mounted) return;
    context.read<SettingsState>().load();
    final remaining = _minSplash - DateTime.now().difference(started);
    if (remaining > Duration.zero) {
      await Future<void>.delayed(remaining);
    }
    if (!mounted) return;
    setState(() => _holdSplash = false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      _inactiveSince ??= DateTime.now();
      return;
    }
    if (state != AppLifecycleState.resumed) {
      return;
    }
    final prefs = context.read<PreferenceService>();
    context.read<LocalNotificationService>().syncFromPreferences(prefs);
    final inactiveSince = _inactiveSince;
    _inactiveSince = null;
    if (inactiveSince == null) {
      return;
    }
    context.read<ProfileState>().lockAfterAppInactive(
          inactiveSince: inactiveSince,
        );
  }

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileState>();
    final theme = profile.profile?.isDark == true
        ? AppTheme.dark()
        : AppTheme.light();

    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: profile.profile?.isDark == true
          ? ThemeMode.dark
          : ThemeMode.light,
      home: profile.loading || _holdSplash
          ? const SplashPage()
          : profile.profile == null
              ? const DailyCyclePage()
              : profile.locked
                  ? const PinUnlockPage()
                  : const TodayIntentionsGate(child: AppShell()),
      builder: (context, child) {
        return AnimatedTheme(
          data: theme,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
