import 'package:flutter/material.dart';
import 'package:button/Widgets/TextField.dart';
import 'package:button/Widgets/MyActionButtonsCard.dart';
import 'package:button/Widgets/MyIconButtonsCard.dart';

class Part1Page extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final String? nameError;
  final String? emailError;
  final int likeCount;
  final VoidCallback onSubmit;
  final VoidCallback onLearnMore;
  final VoidCallback onClear;
  final VoidCallback onLike;
  final VoidCallback onShare;

  const Part1Page({
    super.key,
    required this.nameController,
    required this.emailController,
    this.nameError,
    this.emailError,
    required this.likeCount,
    required this.onSubmit,
    required this.onLearnMore,
    required this.onClear,
    required this.onLike,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          MyTextField(
            nameController: nameController,
            emailController: emailController,
            nameError: nameError,
            emailError: emailError,
          ),
          SizedBox(height: 20),
          MyActionButtonsCard(
            onSubmit: onSubmit,
            onLearnMore: onLearnMore,
            onClear: onClear,
          ),
          SizedBox(height: 20),
          MyIconButtonsCard(
            likeCount: likeCount,
            onLike: onLike,
            onShare: onShare,
          ),
        ],
      ),
    );
  }
}
