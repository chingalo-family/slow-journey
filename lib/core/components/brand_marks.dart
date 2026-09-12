import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandAssets {
  static const sproutSvg = 'assets/brand/sprout.svg';
  static const appIconPng = 'assets/brand/app_icon.png';
}

class LeafMark extends StatelessWidget {
  const LeafMark({
    super.key,
    this.size = 56,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      BrandAssets.sproutSvg,
      width: size,
      height: size,
      fit: BoxFit.contain,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}

class SoftAvatar extends StatelessWidget {
  const SoftAvatar({super.key, this.size = 108});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFE7EDDC),
        border: Border.all(color: const Color(0xFFD7E0C8), width: 3),
      ),
      child: CustomPaint(painter: _FacePainter()),
    );
  }
}

class _FacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final skin = Paint()..color = const Color(0xFFE8C7A8);
    final hair = Paint()..color = const Color(0xFF3A3A38);
    final shirt = Paint()..color = const Color(0xFF7C8B6F);
    final cx = size.width / 2;
    canvas.drawCircle(Offset(cx, size.height * 0.78), size.width * 0.42, shirt);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(cx, size.height * 0.46),
        width: size.width * 0.46,
        height: size.height * 0.52,
      ),
      skin,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(cx, size.height * 0.38),
        width: size.width * 0.52,
        height: size.height * 0.48,
      ),
      3.4,
      2.6,
      false,
      hair,
    );
    final eye = Paint()..color = const Color(0xFF3A3A38);
    canvas.drawCircle(Offset(cx - 10, size.height * 0.48), 2.2, eye);
    canvas.drawCircle(Offset(cx + 10, size.height * 0.48), 2.2, eye);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
