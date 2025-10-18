import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:flutter/material.dart';

class Currency extends StatelessWidget {
  final String currency;
  final String amount;
  const Currency({super.key, required this.currency, required this.amount});

  bool get _isRiyal => currency.toLowerCase() == 'sar';

  @override
  Widget build(BuildContext context) {
    return _isRiyal ? Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          AppIcons.icon(icon: AppIcons.riyal, color:  Theme.of(context).colorScheme.onSurface, size: 20),
          Text('  $amount' , style: TextStyles.textViewBold12,)
        ],
      )
    ) : Text('$amount  $currency' , style: TextStyles.textViewBold12,);
  }
}