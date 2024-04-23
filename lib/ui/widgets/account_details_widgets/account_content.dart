import 'package:flutter/material.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/utils/image_formatter.dart';
import 'package:movies_app/ui/widgets/account_details_widgets/account_settings.dart';

class AccountContent extends StatelessWidget {
  const AccountContent({
    super.key,
    required this.account,
  });

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    Widget avatarWidget = ImageFormatter.formatAvatarImageWidget(
      context,
      imagePath: account.avatarPath,
      diameter: 120,
    );
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                avatarWidget,
                const SizedBox(height: 20),
                Text(
                  account.username ?? "Unknown Username",
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 30),
          child: AccountSettings(),
        ),
      ],
    );
  }
}
