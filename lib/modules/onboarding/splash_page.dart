import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slowjourney/core/components/brand_marks.dart';
import 'package:slowjourney/core/constants/app_colors.dart';
import 'package:slowjourney/core/constants/app_theme.dart';
import 'package:slowjourney/core/utils/l10n_util.dart';
import 'package:slowjourney/modules/onboarding/daily_cycle_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const markSize = 112.0;
  static const markToWordGap = 32.0;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _motion = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
  )..forward();

  late final Animation<double> _wordOpacity = CurvedAnimation(
    parent: _motion,
    curve: const Interval(0.22, 0.7, curve: Curves.easeOut),
  );

  late final Animation<Offset> _wordSlide = Tween<Offset>(
    begin: const Offset(0, 0.06),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(
      parent: _motion,
      curve: const Interval(0.22, 0.7, curve: Curves.easeOutCubic),
    ),
  );

  late final Animation<double> _tagOpacity = CurvedAnimation(
    parent: _motion,
    curve: const Interval(0.48, 1, curve: Curves.easeOut),
  );

  @override
  void dispose() {
    _motion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const overlay = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.creamBg,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlay,
      child: Theme(
        data: AppTheme.light(),
        child: Scaffold(
          backgroundColor: AppColors.creamBg,
          body: LayoutBuilder(
            builder: (context, constraints) {
              final centerY = constraints.maxHeight / 2;
              final wordTop =
                  centerY + SplashPage.markSize / 2 + SplashPage.markToWordGap;
              return Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: centerY - SplashPage.markSize / 2,
                    height: SplashPage.markSize,
                    child: const Center(
                      child: LeafMark(size: SplashPage.markSize),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    right: 24,
                    top: wordTop,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeTransition(
                          opacity: _wordOpacity,
                          child: SlideTransition(
                            position: _wordSlide,
                            child: Text(
                              l10n.appName,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                    color: AppColors.ink900,
                                    fontSize: 40,
                                    height: 1.1,
                                    letterSpacing: -0.4,
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        FadeTransition(
                          opacity: _tagOpacity,
                          child: Text(
                            l10n.tagline.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: AppTheme.nunito,
                              fontSize: 11,
                              letterSpacing: 2.8,
                              color: AppColors.ink300,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class OnboardingGate extends StatelessWidget {
  const OnboardingGate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}

class ContinueOnboarding extends StatelessWidget {
  const ContinueOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const DailyCyclePage();
  }
}
