import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> convertImageFileToCustomBitmapDescriptor(
    Uint8List imageinBytes,
    {int size = 100,
    bool addBorder = false,
    Color borderColor = Colors.white,
    double borderSize = 10,
    }) async {
  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint = Paint()..color;
  final double radius = size / 2;

  //make canvas clip path to prevent image drawing over the circle
  final Path clipPath = Path();
  clipPath.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
      Radius.circular(100)));
  canvas.clipPath(clipPath);

  //paintImage
  final Codec codec = await instantiateImageCodec(imageinBytes);
  final FrameInfo imageFI = await codec.getNextFrame();

  paintImage(
      canvas: canvas,
      rect: Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
      image: imageFI.image);

  if (addBorder) {
    //draw Border
    paint..color = borderColor;
    paint..style = PaintingStyle.stroke;
    paint..strokeWidth = borderSize;
    canvas.drawCircle(Offset(radius, radius), radius, paint);
  }

  //convert canvas as PNG bytes
  final _image =
      await pictureRecorder.endRecording().toImage(size, (size * 1.1).toInt());
  final data = await _image.toByteData(format: ImageByteFormat.png);

  //convert PNG bytes as BitmapDescriptor
  return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
}
