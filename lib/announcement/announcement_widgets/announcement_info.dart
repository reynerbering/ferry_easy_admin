import 'package:ferry_easy_admin/widgets/confirmation_card.dart';
import 'package:ferry_easy_admin/widgets/dialog_card.dart';
import 'package:flutter/material.dart';

import '../../constants.dart/colors.dart';

class AnnouncementInfo extends StatefulWidget {
  final String title;
  final String datePublished;
  final String status;
  final VoidCallback? onTap;

  AnnouncementInfo({
    required this.title,
    required this.datePublished,
    required this.status,
    required this.onTap,
  });

  @override
  _AnnouncementInfoState createState() => _AnnouncementInfoState();
}

class _AnnouncementInfoState extends State<AnnouncementInfo> {
  bool _isHovering = false;

  void _onEnter(PointerEvent details) {
    setState(() {
      _isHovering = true;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _isHovering = false;
    });
  }

  Color _getBackgroundColor() {
    return _isHovering ? kcPrimaryColor : kcSecondaryColor;
  }

  Color _getTextColor() {
    return _isHovering ? Colors.white : kcPrimaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 850,
          height: 40,
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _getTextColor()),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    widget.datePublished,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: _getTextColor()),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    widget.status,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: _getTextColor()),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Handle click on column 4
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                      Icon(Icons.border_color_rounded, color: _getTextColor()),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: DialogCard(
                        icon: Icons.warning_rounded,
                        text:
                            'Are you sure you want to delete this announcement?',
                        onButtonPressed1: () {
                          Navigator.pop(context);
                        },
                        onButtonPressed2: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.transparent,
                              content: ConfirmationCard(
                                icon: Icons.delete_rounded,
                                text: 'The announcement has been deleted',
                                onButtonPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                buttonText: 'Got it',
                              ),
                            ),
                          );
                        },
                        buttonText1: 'No, Cancel',
                        buttonText2: 'Yes, Proceed',
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Icon(Icons.delete_rounded, color: _getTextColor()),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
