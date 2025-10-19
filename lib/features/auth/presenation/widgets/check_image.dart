// import 'dart:io';
// import 'package:stat_doctor/core/utils/app_imports.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// import 'package:stat_doctor/core/utils/helper.dart';
// import 'package:image/image.dart' as img;
// import 'dart:math' as math;

// class CheckImage {

//  static Future<bool> acceptedFace(File imageFile) async {
//       final faceDetector = FaceDetector(options: FaceDetectorOptions());
//       final inputImage = InputImage.fromFile(imageFile);
//       final List<Face> faces = await faceDetector.processImage(inputImage);
      
//       if(faces.isEmpty) {
//         Helper.getSheetError("noFaceDetected".tr);
//       } else if(faces.length > 1) {
//         Helper.getSheetError("multipleFacesDetected".tr);
//       } else if(faces.length == 1) {
//         // final face = faces.first;
//         // final double faceWidth = face.boundingBox.width;
//         // final double faceHeight = face.boundingBox.height;
//         // final double faceArea = faceWidth * faceHeight;
//         // final double imageArea = inputImage.metadata!.size.width.toDouble() * inputImage.metadata!.size.height.toDouble();
//         // final double faceAreaPercentage = (faceArea / imageArea) * 100;

//         // if(faceAreaPercentage < 10) {
//         //   Helper.getSheetError("noFaceDetected".tr);
//         // }
//       }
//       return faces.length == 1;
//    }

    
//   static Future<bool> hasWhiteBackground(String imagePath) async {
//     final imageBytes = File(imagePath).readAsBytesSync();
//     final image = img.decodeImage(imageBytes);

//     if (image == null) {
//       Helper.getSheetError("backgroundShouldBeWhite".tr);
//       return false;
//     }

//     const int whiteThreshold = 245;
//     const int regionSize = 100; // Adjust corner region size as needed

//     int whitePixelCount = 0;
//     int totalPixelCount = 0;

//     // Check top-left corner
//     final tlEndX = math.min(regionSize, image.width);
//     final tlEndY = math.min(regionSize, image.height);

//     for (int y = 0; y < tlEndY; y++) {
//       for (int x = 0; x < tlEndX; x++) {
//         final pixel = image.getPixel(x, y);
//         if (_isWhitePixel(pixel, whiteThreshold)) {
//           whitePixelCount++;
//         }
//         totalPixelCount++;
//       }
//     }

//     // Check top-right corner
//     final trStartX = math.max(image.width - regionSize, 0);
//     final trEndY = math.min(regionSize, image.height);
//     for (int y = 0; y < trEndY; y++) {
//       for (int x = trStartX; x < image.width; x++) {
//         final pixel = image.getPixel(x, y);
//         if (_isWhitePixel(pixel, whiteThreshold)) {
//           whitePixelCount++;
//         }
//         totalPixelCount++;
//       }
//     }

//     if (totalPixelCount == 0) return false;

//     final whitePixelPercentage = (whitePixelCount / totalPixelCount) * 100;
//     if (whitePixelPercentage < 50) {
//       Helper.getSheetError("backgroundShouldBeWhite".tr);
//     }
//     return whitePixelPercentage >= 50;
//   }

//   static bool _isWhitePixel(img.Pixel pixel, int threshold) {
//     return pixel.r >= threshold &&  pixel.g >= threshold &&  pixel.b >= threshold;
//   } 

// }