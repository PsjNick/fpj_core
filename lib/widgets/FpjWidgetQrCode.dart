///  create by —— jie
///  2024/12/27 14:39

import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class FpjWidgetQrCode extends StatelessWidget {
  final String data;

  final String? decorationImageAssets;

  const FpjWidgetQrCode({
    super.key,
    required this.data,
    this.decorationImageAssets,
  });

  @override
  Widget build(BuildContext context) {
    return PrettyQrView.data(
      data: data,
      decoration: decorationImageAssets == null
          ? null
          : PrettyQrDecoration(
        image: PrettyQrDecorationImage(
          image: AssetImage(decorationImageAssets ?? ""),
        ),
      ),
    );
  }
}
