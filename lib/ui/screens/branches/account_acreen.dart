import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/data/api/api_clients/session_data_client.dart';
import 'package:movies_app/ui/blocs/account_bloc/account_bloc.dart';
import 'package:movies_app/ui/widgets/account_details_widgets/account_details_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc(
        mediaClient: RepositoryProvider.of<MediaClient>(context),
        sessionDataClient: RepositoryProvider.of<SessionDataClient>(context),
      )..add(AccountLoadAccountDetailsEvent()),
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: const AccountBody(),
      ),
    );
  }
}
