import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:image/image.dart' as imageDecoder;

/// [ImageSize] is a validator that checks if the image width and height.
class ImageSize extends FormControlValidatorAnnotation<Uint8List> {
  /* Public properties */
  /// [minWidth] is the allowed min width.
  final int minWidth;

  /// [maxWidth] is the allowed max width.
  final int maxWidth;

  /// [minHeight] is the allowed min height.
  final int minHeight;

  /// [maxHeight] is the allowed max height.
  final int maxHeight;

  /// [remoteMinWidth] is the name of targeted property that user uses to provide min width. This one has priority on [minWidth].
  final String remoteMinWidth;

  /// [remoteMaxWidth] is the name of targeted property that user uses to provide max width. This one has priority on [maxWidth].
  final String remoteMaxWidth;

  /// [remoteMinHeight] is the name of targeted property that user uses to provide min height. This one has priority on [minHeight].
  final String remoteMinHeight;

  /// [remoteMaxHeight] is the name of targeted property that user uses to provide max height. This one has priority on [maxHeight].
  final String remoteMaxHeight;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const ImageSize({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.remoteMinWidth,
    this.remoteMaxWidth,
    this.remoteMinHeight,
    this.remoteMaxHeight,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's image has a valid size. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [Uint8List] type here.
  @override
  Future<bool> isValid(FormControl<Uint8List> control) async {
    int minWidth = super.getRemoteValidatorParameter<int>(
      defaultValue: this.minWidth,
      localParameterName: 'minWidth',
      remoteParameterName: this.remoteMinWidth,
      formGroup: control.parent,
    );
    int maxWidth = super.getRemoteValidatorParameter<int>(
      defaultValue: this.maxWidth,
      localParameterName: 'maxWidth',
      remoteParameterName: this.remoteMaxWidth,
      formGroup: control.parent,
    );
    int minHeight = super.getRemoteValidatorParameter<int>(
      defaultValue: this.minHeight,
      localParameterName: 'minHeight',
      remoteParameterName: this.remoteMinHeight,
      formGroup: control.parent,
    );
    int maxHeight = super.getRemoteValidatorParameter<int>(
      defaultValue: this.maxHeight,
      localParameterName: 'maxHeight',
      remoteParameterName: this.remoteMaxHeight,
      formGroup: control.parent,
    );

    this._validateParameters(minWidth, maxWidth, minHeight, maxHeight);
    bool isValid = this._validate(
      control.value,
      minWidth,
      maxWidth,
      minHeight,
      maxHeight,
    );
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters(
    int minWidth,
    int maxWidth,
    int minHeight,
    int maxHeight,
  ) {
    if (minWidth == null &&
        maxWidth == null &&
        minHeight == null &&
        maxHeight == null)
      throw new ValidatorParameterException('No setting has been defined.');

    if (minWidth != null && maxWidth != null) {
      if (minWidth.compareTo(maxWidth) > 0)
        throw new ValidatorParameterException(
            'minWidth value is greater than maxWidth value.');
    }

    if (minHeight != null && maxHeight != null) {
      if (minHeight.compareTo(maxHeight) > 0)
        throw new ValidatorParameterException(
            'minHeight value is greater than maxHeight value.');
    }
  }

  bool _validate(
    Uint8List value,
    int minWidth,
    int maxWidth,
    int minHeight,
    int maxHeight,
  ) {
    if (value == null) return true;

    imageDecoder.Image image = imageDecoder.decodeImage(value);

    if (image == null)
      throw new ValidationException('current file is not an image.');

    if (minWidth != null && image.width < minWidth) return false;
    if (minHeight != null && image.height < minHeight) return false;
    if (maxWidth != null && image.width > maxWidth) return false;
    if (maxHeight != null && image.height > maxHeight) return false;
    return true;
  }
}
