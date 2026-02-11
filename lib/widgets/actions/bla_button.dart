import 'package:flutter/material.dart';
import '../../theme/theme.dart';

enum ButtonVariant { primary, secondary }

class BlaButton extends StatelessWidget {
  final String label;
  final ButtonVariant variant;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final IconData? icon;
  final double? width;

  const BlaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isEnabled = true,
    this.icon,
    this.width, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, 
      height: 48, 
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: _getButtonStyle(),
        child: _buildContent(),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    final config = _getButtonConfig();
    final hasBorder = variant == ButtonVariant.secondary;
    
    return ElevatedButton.styleFrom(
      backgroundColor: isEnabled ? config.backgroundColor : config.disabledBackground,
      foregroundColor: isEnabled ? config.foregroundColor : config.disabledForeground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
        side: hasBorder
          ? BorderSide(
              color: isEnabled ? BlaColors.primary : BlaColors.greyLight,
              width: 1.5,
            )
          : BorderSide.none,
      ),
      elevation: 0,
      shadowColor: Colors.transparent,
    );
  }

  _ButtonConfig _getButtonConfig() {
    return switch (variant) {
      ButtonVariant.primary => _ButtonConfig(
        backgroundColor: BlaColors.primary,
        foregroundColor: Colors.white,
        disabledBackground: BlaColors.greyLight,
        disabledForeground: BlaColors.disabled,
      ),
      ButtonVariant.secondary => _ButtonConfig(
        backgroundColor: Colors.white,
        foregroundColor: BlaColors.primary,
        disabledBackground: Colors.white,
        disabledForeground: BlaColors.disabled,
      ),
    };
  }

  TextStyle _getTextStyle() {
    return BlaTextStyles.button.copyWith(
      color: _getTextColor(),
    );
  }

  Color _getTextColor() {
    if (!isEnabled) return BlaColors.disabled;
    return variant == ButtonVariant.primary ? Colors.white : BlaColors.primary;
  }

  Color _getIconColor() {
    if (!isEnabled) return BlaColors.disabled;
    return variant == ButtonVariant.primary ? Colors.white : BlaColors.primary;
  }

  Widget _buildContent() {
    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: _getIconColor(),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: _getTextStyle(),
          ),
        ],
      );
    }
    
    return Text(
      label,
      style: _getTextStyle(),
    );
  }
}

class _ButtonConfig {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color disabledBackground;
  final Color disabledForeground;

  const _ButtonConfig({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.disabledBackground,
    required this.disabledForeground,
  });
}
