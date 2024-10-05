import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../configs/theme.dart';

class MenuCard extends StatefulWidget {
  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.tag,
  });

  final String icon;
  final String title;
  final String tag;

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  void _onTapItem() {
    if (widget.tag == "visit") {
      return context.goNamed(AppStrings.forgotPasswordRoute);
    }
    if (widget.tag == "wifi") {
      return;
    }
    if (widget.tag == "event") {
      return;
    }
    if (widget.tag == "aduan") {
      return;
    }
    if (widget.tag == "kontak") {
      return;
    }
    if (widget.tag == "tenant") {
      return;
    }
    if (widget.tag == "more") {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTapItem,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: widget.tag == "more" ? AppColors.primary : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Image.asset(
              widget.icon,
              width: 34,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.title,
            style: Typograph.textRegular,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
