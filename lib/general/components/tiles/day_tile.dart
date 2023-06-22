import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timetable/internal/context_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DayTile extends StatelessWidget {
  const DayTile({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    String? weekDay = toBeginningOfSentenceCase(
        DateFormat.EEEE(AppLocalizations.of(context)!.localeName)
            .format(dateTime));
    String date = DateFormat('dd.MM.yyyy').format(dateTime);
    return SizedBox(
      height: 40,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              weekDay!,
              style: context.typography.body1,
            ),
            Text(
              date,
              style: context.typography.body1,
            )
          ],
        ),
      ),
    );
  }
}
