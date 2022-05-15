import 'package:assigment/constant/app_colors.dart';
import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatefulWidget {
  const MaterialButtonWidget(
      {Key? key, required this.onTap, required this.child, this.width})
      : super(key: key);
  final VoidCallback? onTap;
  final Widget child;
  final double? width;

  @override
  _MaterialButtonWidgetState createState() => _MaterialButtonWidgetState();
}

class _MaterialButtonWidgetState extends State<MaterialButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 70,
      width: widget.width,
      child: MaterialButton(
        onPressed: widget.onTap,
        child: widget.child,
        textColor: Colors.white,
        disabledColor: AppColors.disableColor,
        disabledTextColor: AppColors.textDisableColor,
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
