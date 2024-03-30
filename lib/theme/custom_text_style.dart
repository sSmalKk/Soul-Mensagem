import 'package:flutter/material.dart';
import 'package:gustavo_smalk_s_application65/core/utils/size_utils.dart';
import 'package:gustavo_smalk_s_application65/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900.withOpacity(0.38),
        fontSize: 10.fSize,
      );
  // Label text style
  static get labelMediumRed90001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.red90001,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
