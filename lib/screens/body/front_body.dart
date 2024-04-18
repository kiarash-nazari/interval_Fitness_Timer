import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/svg_codes.dart';
import 'package:interval_timer/widgets/clikable_progresbar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FrontBody extends StatefulWidget {
  const FrontBody({Key? key}) : super(key: key);

  @override
  State<FrontBody> createState() => _FrontBodyState();
}

class _FrontBodyState extends State<FrontBody> {
  Map<String, String> bodyParts = {
    'leftKool': 'glass',
    'leftShoulder': 'glass',
    'leftBiceps': 'glass',
    'leftForearm': 'glass',
    'leftChest': 'glass',
    'leftFirstAb': 'glass',
    'leftSecondAb': 'glass',
    'leftThirdAb': 'glass',
    'leftSexAb': 'glass',
    'leftQuadFirst': 'glass',
    'leftQuadSecond': 'glass',
    'leftQuadThird': 'glass',
    'leftFrontCraft': 'glass',
    'rightKool': 'glass',
    'rightShoulder': 'glass',
    'rightBiceps': 'glass',
    'rightForearm': 'glass',
    'rightChest': 'glass',
    'rightFirstAb': 'glass',
    'rightSecondAb': 'glass',
    'rightThirdAb': 'glass',
    'rightSexAb': 'glass',
    'rightQuadFirst': 'glass',
    'rightQuadSecond': 'glass',
    'rightQuadThird': 'glass',
    'rightFrontCraft': 'glass',
  };
  // Define positions and sizes for each body part
  Map<String, List<double>> partPositions = {
    'leftKool': [150, 8, 0],
    'leftShoulder': [195, 33, 0],
    'leftBiceps': [200, 80, 0],
    'leftForearm': [200, 125, 0],
    'leftChest': [151, 40, 0],
    'leftFirstAb': [145, 87, 0],
    'leftSecondAb': [145, 110, 0],
    'leftThirdAb': [147, 133, 0],
    'leftSexAb': [157, 150, 2.7],
    'leftQuadFirst': [180, 167, .2],
    'leftQuadSecond': [170, 170, 0],
    'leftQuadThird': [159, 172, -.2],
    'leftFrontCraft': [175, 240, 0],
    'rightKool': [85, 8, 0],
    'rightShoulder': [47, 33, 0],
    'rightBiceps': [53, 80, 0],
    'rightForearm': [53, 125, 0],
    'rightChest': [91.5, 40, 0],
    'rightFirstAb': [103, 87, 0],
    'rightSecondAb': [105, 110, 0],
    'rightThirdAb': [107, 133, 0],
    'rightSexAb': [92, 153, .3],
    'rightQuadFirst': [96, 167, -.2],
    'rightQuadSecond': [108, 167, 0],
    'rightQuadThird': [118, 169, .2],
    'rightFrontCraft': [98, 240, 0],
  };

  Map<String, List<double>> partSizes = {
    'leftKool': [50, 25],
    'leftShoulder': [40, 40],
    'leftBiceps': [30, 35],
    'leftForearm': [30, 45],
    'leftChest': [40, 40],
    'leftFirstAb': [33, 18],
    'leftSecondAb': [33, 18],
    'leftThirdAb': [27, 18],
    'leftSexAb': [37, 10],
    'leftQuadFirst': [7, 70],
    'leftQuadSecond': [6, 50],
    'leftQuadThird': [6, 60],
    'leftFrontCraft': [13, 50],
    'rightKool': [50, 25],
    'rightShoulder': [40, 40],
    'rightBiceps': [30, 35],
    'rightForearm': [30, 45],
    'rightChest': [40, 40],
    'rightFirstAb': [33, 18],
    'rightSecondAb': [33, 18],
    'rightThirdAb': [27, 18],
    'rightSexAb': [37, 10],
    'rightQuadFirst': [7, 70],
    'rightQuadSecond': [6, 50],
    'rightQuadThird': [6, 60],
    'rightFrontCraft': [13, 50],
  };
  void togglePart(String partName) {
    setState(() {
      bodyParts[partName] = bodyParts[partName] == 'red' ? 'glass' : 'red';
      print(partName);
    });
  }

  Widget buildBodyPart(String partName, double left, double top, double width,
      double height, Function() onTap, double? angle) {
    if (partName == "leftSexAb" ||
        partName == "rightSexAb" ||
        partName == "leftQuadThird" ||
        partName == "rightQuadThird" ||
        partName == "leftQuadFirst" ||
        partName == "rightQuadFirst") {
      return Positioned(
        left: left,
        top: top,
        child: Transform.rotate(
          angle: angle ?? 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.elliptical(10, 50),
                bottomLeft: Radius.elliptical(10, 50)),
            child: SizedBox(
              width: width,
              height: height,
              child: GestureDetector(
                onTap: onTap,
              ),
            ),
          ),
        ),
      );
    } else {
      return Positioned(
        left: left,
        top: top,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: width,
            height: height,
            child: GestureDetector(
              onTap: onTap,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 5, 218),
      appBar: AppBar(
        title: const Text('Front Body'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                SvgPicture.string(
                  SvgCodes.frontBody(bodyParts),
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
                // Rendering body parts
                for (var entry in bodyParts.entries)
                  buildBodyPart(
                      entry.key,
                      partPositions[entry.key]![0],
                      partPositions[entry.key]![1],
                      partSizes[entry.key]![0],
                      partSizes[entry.key]![1],
                      () => togglePart(entry.key),
                      partPositions[entry.key]?[2] ?? 0),
              ],
            ),
            25.heightBox,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('How did You Train these Mucles?'),
                          content: const MyProgressBar(),
                          actions: [
                            TextButton(
                                onPressed: () {}, child: const Text('Done'))
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.next_plan),
                  label: const Text('Next'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}































































































// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class FrontBody extends StatefulWidget {
//   const FrontBody({Key? key}) : super(key: key);

//   @override
//   State<FrontBody> createState() => _FrontBodyState();
// }

// String leftKool = "glass";
// String leftShoulder = "glass";
// String leftBiceps = "glass";
// String leftForearm = "glass";
// String leftChest = "glass";
// String leftFirstAb = "glass";
// String leftSecondAb = "glass";
// String leftThirdAb = "glass";
// String leftSexAb = "glass";
// String leftQuadFirst = "glass";
// String leftQuadSecond = "glass";
// String leftQuadThird = "glass";
// String leftFrontCraft = "glass";

// //Right

// String rightKool = "glass";
// String rightShoulder = "glass";
// String rightBiceps = "glass";
// String rightForearm = "glass";
// String rightChest = "glass";
// String rightFirstAb = "glass";
// String rightSecondAb = "glass";
// String rightThirdAb = "glass";
// String rightSexAb = "glass";
// String rightQuadFirst = "glass";
// String rightQuadSecond = "glass";
// String rightQuadThird = "glass";
// String rightFrontCraft = "glass";

// class _FrontBodyState extends State<FrontBody> {
//   @override
//   Widget build(BuildContext context) {
//     String rawSvg = '''
// <svg id="body" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 300 300" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" style="background-color:transparent">
//     <!-- Define a filter for the glassmorphism effect -->
//     <defs>
//         <!-- Define a gradient for the glass-like effect -->
//         <linearGradient id="glass" x1="0%" y1="0%" x2="100%" y2="100%">
//             <stop offset="0%" stop-color="#ffffff" stop-opacity="0.2" />
//             <stop offset="50%" stop-color="#cccccc" stop-opacity="0.1" />
//             <stop offset="100%" stop-color="#ffffff" stop-opacity="0.2" />
//         </linearGradient>
//             <linearGradient id="red" x1="0%" y1="0%" x2="100%" y2="100%">
//             <stop offset="0%" stop-color="#FF0000" stop-opacity="0.2" />
//             <stop offset="50%" stop-color="#FF0000" stop-opacity="0.5" />
//             <stop offset="100%" stop-color="#FF0000" stop-opacity="0.2" />
//         </linearGradient>
//                 <linearGradient id="green" x1="0%" y1="0%" x2="100%" y2="100%">
//             <stop offset="0%" stop-color="#0FF000" stop-opacity="0.2" />
//             <stop offset="50%" stop-color="#0FF000" stop-opacity="0.5" />
//             <stop offset="100%" stop-color="#0FF000" stop-opacity="0.2" />
//         </linearGradient>
//     </defs>
//     <g filter="url(#blurFilter)">
//       <path id="body-u-chestr"
//       d="M51.033169,32.626424q33.713975.543774,28.276237,26.644916v19.032085c-16.749801,0-41.825173,0-56.0087,0v-19.032085Q17.319193,32.082647,51.033169,32.626424Z"
//       transform="matrix(-.755954 0.008617-.010504-.921535 150.423168 112.451855)"
//       fill="url(#$rightChest)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-chestl"
//       d="M51.033169,32.626424q33.713975.543774,28.276237,26.644916v19.032085c-16.749801,0-41.825173,0-56.0087,0v-19.032085Q17.319193,32.082647,51.033169,32.626424Z"
//       transform="matrix(-.755954 0.008617-.010504-.921535 210.80223 111.955051)"
//       fill="url(#$leftChest)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <ellipse id="body-u-nokeshr"
//          rx="5.709625"
//          ry="5.165851"
//          transform="matrix(.997201 0.074762-.074762 0.997201 111.110112 66.61791)"
//          fill="#d2dbed"
//          stroke-width="0"/>
// <ellipse id="body-u-nokeshl"
//          rx="5.709625"
//          ry="5.165851"
//          transform="matrix(.997201 0.074762-.074762 0.997201 171.729118 67.611518)"
//          fill="#d2dbed"
//          stroke-width="0"/>
// <path id="body-u-shoulderr"
//       d="M84.747145,60.358891c-16.106919-9.955154-25.484274-3.649827-32.626427,0-5.823038,7.536343-4.603712,19.260603-2.718869,26.02728c1.478844,5.233961,8.078503,10.972576,16.313214,8.882317c7.06537.465687,17.660971.556202,19.032082-8.455455v-26.454142Z"
//       transform="translate(-.543773-23.926044)"
//       fill="url(#$leftShoulder)"
//       stroke="#3f5787"
//       stroke-width="0.8"/>
// <path id="body-u-shoulderl"
//       d="M84.747145,60.358891c-16.106919-9.955154-25.484274-3.649827-32.626427,0-5.823038,7.536343-4.603712,19.260603-2.718869,26.02728c1.478844,5.233961,8.078503,10.972576,16.313214,8.882317c7.06537.465687,17.660971.556202,19.032082-8.455455v-26.454142Z"
//       transform="matrix(-1 0 0 1 282.055467-22.508772)"
//       fill="url(#$rightShoulder)"
//       stroke="#3f5787"
//       stroke-width="0.8"/>
// <path id="body-u-trapeziusr"
//       d="M84.747144,55.280986l50.570963-21.567011-1.631276,21.567011h-48.939687Z"
//       transform="translate(-.543772-23.926047)"
//       fill="url(#$rightKool)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-trapeziusl"
//       d="M84.747144,55.280986l50.570963-21.567011-1.631276,21.567011h-48.939687Z"
//       transform="matrix(-1 0 0 1 284.774334-23.926047)"
//       fill="url(#$leftKool)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-upperabsr"
//       d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z"
//       transform="translate(1.751072-35.087773)"
//       fill="url(#$rightFirstAb)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-centerabsr"
//       d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z"
//       transform="translate(1.751072-11.161726)"
//       fill="url(#$rightSecondAb)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-lowerabsr"
//       d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z"
//       transform="translate(1.751072 12.220547)"
//       fill="url(#$rightThirdAb)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>

// <path id="body-u-upperabsl"
//       d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z"
//       transform="translate(42.535837-35.087773)"
//       fill="url(#$leftFirstAb)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-centerabsl"
//       d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z"
//       transform="translate(42.535837-11.161726)"
//       fill="url(#$leftSecondAb)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-lowerabsl"
//       d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z"
//       transform="translate(42.535837 12.220547)"
//       fill="url(#$leftThirdAb)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-bysepsr"
//       d="M56.470905,106.016605c8.344197-7.191969,15.84478-6.069459,23.926047,0c3.807315,16.749491-3.160335,27.672535-14.681892,37.1862-11.063276-13.678785-14.860185-24.981445-9.244155-37.1862Z"
//       transform="matrix(1 0 0 1.000002-.54377-23.92631)"
//       fill="url(#$rightBiceps)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-bysepsl"
//       d="M56.470905,106.016605c8.344197-7.191969,15.84478-6.069459,23.926047,0c3.807315,16.749491-1.034487,26.425006-12.556044,35.938671-11.063276-13.678785-16.986033-23.733916-11.370003-35.938671Z"
//       transform="matrix(1.007585 0 0 1.000002 145.580789-22.678778)"
//       fill="url(#$leftBiceps)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-assistr"
//       d="M53.927333,156.909076c4.558403,1.757127,17.827754,2.729367,27.513794.499073L73.327896,203.91517c-2.977933,4.426536-9.008588,6.208485-12.506798,0l-6.893765-47.006094Z"
//       transform="translate(-.543773-34.559973)"
//       fill="url(#$rightForearm)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-assistl"
//       d="M53.927333,156.909076c4.558403,1.757127,17.827754,2.729367,27.513794.499073L73.327896,203.91517c-2.977933,4.426536-9.008588,6.208485-12.506798,0l-6.893765-47.006094Z"
//       transform="translate(146.25204-34.559973)"
//       fill="url(#$leftForearm)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-sexlinel"
//       d="M192.958129,165.851006l-38.064165,22.294725l38.064164-9.244154c2.663446-3.915862,2.636749-10.434472.000001-13.050571Z"
//       transform="translate(-.54377-24.663289)"
//       fill="url(#$leftSexAb)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-sexliner"
//       d="M192.958129,165.851006l-38.064165,22.294725l38.064164-9.244154c2.663446-3.915862,2.636749-10.434472.000001-13.050571Z"
//       transform="matrix(-1 0 0 1 287.557137-23.191952)"
//       fill="url(#$rightSexAb)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-outersquadr"
//       d="M90.390108,193.281244c3.424144-4.656936,10.84516-4.957248,14.892118,0l-6.909803,69.30824-7.982315-69.30824Z"
//       transform="matrix(.981028-.193864 0.193864 0.981028-40.087794-.907655)"
//       fill="url(#$rightQuadFirst)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-outersquadl"
//       d="M90.390108,193.281244c3.424144-4.656936,10.84516-4.957248,14.892118,0l-6.909803,69.30824-7.982315-69.30824Z"
//       transform="matrix(-.982564-.185925-.185925 0.982564 321.81318 0.568509)"
//       fill="url(#$leftQuadFirst)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-centersquadr"
//       d="M110.032626,193.281244c2.593749-2.849364,8.096883-2.454216,11.006268,0l-6.319796,61.204892-4.686472-61.204892Z"
//       transform="translate(-3.848926-23.926047)"
//       fill="url(#$rightQuadSecond)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-centersquadl"
//       d="M110.032626,193.281244c2.593749-2.849364,8.096883-2.454216,11.006268,0l-6.319796,61.204892-4.686472-61.204892Z"
//       transform="matrix(-1 0 0 1 287.386944-20.879503)"
//       fill="url(#$leftQuadSecond)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-innersquadr"
//       d="M127.705275,193.281244c5.497225-4.764345,8.425507-2.691327,9.090287,0l-9.525877,67.800596.43559-67.800596Z"
//       transform="matrix(.992445 0.12269-.12269 0.992445 18.364676-37.0949)"
//       fill="url(#$rightQuadThird)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-innersquadl"
//       d="M127.705275,193.281244c5.497225-4.764345,8.425507-2.691327,9.090287,0l-9.525877,67.800596.43559-67.800596Z"
//       transform="matrix(-.993831 0.110909 0.110909 0.993831 266.550345-33.112515)"
//       fill="url(#$leftQuadThird)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-frontcraftsl"
//       d="M176.322731,247.960848c.605409-10.866606,6.381973-14.558157,14.094324,1.087548l-7.986263,43.501903-6.108061-44.589451Z"
//       fill="url(#$leftFrontCraft)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>
// <path id="body-u-frontcraftsr"
//       d="M176.322731,247.960848c.605409-10.866606,6.381973-14.558157,14.094324,1.087548l-7.986263,43.501903-6.108061-44.589451Z"
//       transform="matrix(-1 0 0 1 285.811585-.39536)"
//       fill="url(#$rightFrontCraft)"
//       stroke="#3f5787"
//       stroke-width="0.6"/>

//         <!-- Other paths omitted for brevity -->
//     </g>
// </svg>
// ''';
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 80, 5, 218),
//       appBar: AppBar(
//         title: const Text('Front Body'),
//       ),
//       body: Center(
//         child: Stack(children: [
//           SvgPicture.string(
//             rawSvg,
//             // You can adjust the alignment and fit according to your needs
//             alignment: Alignment.center,
//             fit: BoxFit.contain,
//           ),
//           // Left Shoulder
//           Positioned(
//             left: 47,
//             top: 33,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 40,
//                 height: 40,
//                 child: GestureDetector(
//                   onTap: () {
//                     leftShoulder = leftShoulder == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Left Shoulder");
//                   },
//                 ),
//               ),
//             ),
//           ),
//           //Right Byseps
//           Positioned(
//             left: 53,
//             top: 80,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 30,
//                 height: 30,
//                 child: GestureDetector(
//                   onTap: () {
//                     rightBiceps = rightBiceps == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Right BiCeps");
//                   },
//                 ),
//               ),
//             ),
//           ),
//           //Right Forearm
//           Positioned(
//             left: 53,
//             top: 125,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 30,
//                 height: 45,
//                 child: GestureDetector(
//                   onTap: () {
//                     rightForearm = rightForearm == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Right Forearm");
//                   },
//                 ),
//               ),
//             ),
//           ),
//           //Right Trapezius
//           Positioned(
//             left: 85,
//             top: 8,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 50,
//                 height: 25,
//                 child: GestureDetector(
//                   onTap: () {
//                     rightKool = rightKool == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Right Trapezius");
//                   },
//                 ),
//               ),
//             ),
//           ),
//           //Right Chest
//           Positioned(
//             left: 91.5,
//             top: 40,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 40,
//                 height: 40,
//                 child: GestureDetector(
//                   onTap: () {
//                     rightChest = rightChest == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Right Chest");
//                   },
//                 ),
//               ),
//             ),
//           ),
//           //Right First Abs
//           Positioned(
//             left: 103,
//             top: 87,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 33,
//                 height: 18,
//                 child: GestureDetector(
//                   onTap: () {
//                     rightFirstAb = rightFirstAb == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Right First Abs");
//                   },
//                 ),
//               ),
//             ),
//           ),
//           //Right Second Abs
//           Positioned(
//             left: 105,
//             top: 110,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 33,
//                 height: 18,
//                 child: GestureDetector(
//                   onTap: () {
//                     rightSecondAb = rightSecondAb == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Right Second Abs");
//                   },
//                 ),
//               ),
//             ),
//           ),
//           //Right Third Abs
//           Positioned(
//             left: 107,
//             top: 133,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 27,
//                 height: 18,
//                 child: GestureDetector(
//                   onTap: () {
//                     rightThirdAb = rightThirdAb == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Right Third Abs");
//                   },
//                 ),
//               ),
//             ),
//           ),
//           //Right sex Abs
//           Positioned(
//             left: 92,
//             top: 153,
//             child: Transform.rotate(
//               angle: .5,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.elliptical(60, 10),
//                     topRight: Radius.elliptical(50, 5)),
//                 child: SizedBox(
//                   // color: Colors.amber,
//                   width: 37,
//                   height: 10,
//                   child: GestureDetector(
//                     onTap: () {
//                       rightSexAb = rightSexAb == "red" ? "glass" : "red";
//                       setState(() {});
//                       print("Right Sex Abs");
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           //Right First  Quadriceps
//           Positioned(
//             left: 96,
//             top: 167,
//             child: Transform.rotate(
//               angle: -.2,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.elliptical(10, 50),
//                     bottomLeft: Radius.elliptical(10, 50)),
//                 child: SizedBox(
//                   // color: Colors.amber,
//                   width: 7,
//                   height: 70,
//                   child: GestureDetector(
//                     onTap: () {
//                       rightQuadFirst =
//                           rightQuadFirst == "red" ? "glass" : "red";
//                       setState(() {});
//                       print("Right First Quadiceps");
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           //Right Second  Quadriceps
//           Positioned(
//             left: 108,
//             top: 167,
//             child: Transform.rotate(
//               angle: 0,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.elliptical(10, 50),
//                     bottomLeft: Radius.elliptical(10, 50)),
//                 child: SizedBox(
//                   // color: Colors.amber,
//                   width: 6,
//                   height: 50,
//                   child: GestureDetector(
//                     onTap: () {
//                       rightQuadSecond =
//                           rightQuadSecond == "red" ? "glass" : "red";
//                       setState(() {});
//                       print("Right Second Quadiceps");
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           //Right Third  Quadriceps
//           Positioned(
//             left: 118,
//             top: 169,
//             child: Transform.rotate(
//               angle: 0.2,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.elliptical(10, 50),
//                     bottomLeft: Radius.elliptical(10, 50)),
//                 child: SizedBox(
//                   // color: Colors.amber,
//                   width: 6,
//                   height: 60,
//                   child: GestureDetector(
//                     onTap: () {
//                       rightQuadThird =
//                           rightQuadThird == "red" ? "glass" : "red";
//                       setState(() {});
//                       print("Right Third Quadiceps");
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           //Right Front  Craft
//           Positioned(
//             left: 98,
//             top: 240,
//             child: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                   bottomRight: Radius.elliptical(10, 50),
//                   bottomLeft: Radius.elliptical(10, 50)),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 13,
//                 height: 50,
//                 child: GestureDetector(
//                   onTap: () {
//                     rightFrontCraft =
//                         rightFrontCraft == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Right Front  Craft");
//                   },
//                 ),
//               ),
//             ),
//           ),

//           ////
//           ///
//           ///
//           //
//           //*********************Right Side*****************
//           ///
//           ///
//           ///
//           //

// // Left Shoulder
//           Positioned(
//             left: 195,
//             top: 33,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 40,
//                 height: 40,
//                 child: GestureDetector(
//                   onTap: () {
//                     rightShoulder = rightShoulder == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Left Shoulder");
//                   },
//                 ),
//               ),
//             ),
//           ),
// // Left Byseps
//           Positioned(
//             left: 200,
//             top: 80,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 30,
//                 height: 30,
//                 child: GestureDetector(
//                   onTap: () {
//                     leftBiceps = leftBiceps == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Left BiCeps");
//                   },
//                 ),
//               ),
//             ),
//           ),
// // Left Forearm
//           Positioned(
//             left: 200,
//             top: 125,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 30,
//                 height: 45,
//                 child: GestureDetector(
//                   onTap: () {
//                     leftForearm = leftForearm == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Left Forearm");
//                   },
//                 ),
//               ),
//             ),
//           ),
// // Left Trapezius
//           Positioned(
//             left: 149,
//             top: 8,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 50,
//                 height: 25,
//                 child: GestureDetector(
//                   onTap: () {
//                     leftKool = leftKool == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Left Trapezius");
//                   },
//                 ),
//               ),
//             ),
//           ),
// // Left Chest
//           Positioned(
//             left: 151,
//             top: 40,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 40,
//                 height: 40,
//                 child: GestureDetector(
//                   onTap: () {
//                     leftChest = leftChest == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Left Chest");
//                   },
//                 ),
//               ),
//             ),
//           ),
// // Left First Abs
//           Positioned(
//             left: 145,
//             top: 87,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 33,
//                 height: 18,
//                 child: GestureDetector(
//                   onTap: () {
//                     leftFirstAb = leftFirstAb == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Left First Abs");
//                   },
//                 ),
//               ),
//             ),
//           ),
// // Left Second Abs
//           Positioned(
//             left: 145,
//             top: 110,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 33,
//                 height: 18,
//                 child: GestureDetector(
//                   onTap: () {
//                     leftSecondAb = leftSecondAb == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Left Second Abs");
//                   },
//                 ),
//               ),
//             ),
//           ),
// // Left Third Abs
//           Positioned(
//             left: 147,
//             top: 133,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 27,
//                 height: 18,
//                 child: GestureDetector(
//                   onTap: () {
//                     leftThirdAb = leftThirdAb == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Left Third Abs");
//                   },
//                 ),
//               ),
//             ),
//           ),
// // Left sex Abs
//           Positioned(
//             left: 157,
//             top: 150,
//             child: Transform.rotate(
//               angle: 2.7,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.elliptical(60, 10),
//                     topRight: Radius.elliptical(50, 5)),
//                 child: SizedBox(
//                   // color: Colors.amber,
//                   width: 37,
//                   height: 10,
//                   child: GestureDetector(
//                     onTap: () {
//                       leftSexAb = leftSexAb == "red" ? "glass" : "red";
//                       setState(() {});
//                       print("Left Sex Abs");
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
// // Left First Quadriceps
//           Positioned(
//             left: 180,
//             top: 167,
//             child: Transform.rotate(
//               angle: .2,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.elliptical(10, 50),
//                     bottomLeft: Radius.elliptical(10, 50)),
//                 child: SizedBox(
//                   // color: Colors.amber,
//                   width: 7,
//                   height: 70,
//                   child: GestureDetector(
//                     onTap: () {
//                       leftQuadFirst = leftQuadFirst == "red" ? "glass" : "red";
//                       setState(() {});
//                       print("Left First Quadiceps");
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
// // Left Second Quadriceps
//           Positioned(
//             left: 170,
//             top: 170,
//             child: Transform.rotate(
//               angle: 0,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.elliptical(10, 50),
//                     bottomLeft: Radius.elliptical(10, 50)),
//                 child: SizedBox(
//                   // color: Colors.amber,
//                   width: 6,
//                   height: 50,
//                   child: GestureDetector(
//                     onTap: () {
//                       leftQuadSecond =
//                           leftQuadSecond == "red" ? "glass" : "red";
//                       setState(() {});
//                       print("Left Second Quadiceps");
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
// // Left Third Quadriceps
//           Positioned(
//             left: 159,
//             top: 172,
//             child: Transform.rotate(
//               angle: -0.2,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.elliptical(10, 50),
//                     bottomLeft: Radius.elliptical(10, 50)),
//                 child: SizedBox(
//                   // color: Colors.amber,
//                   width: 6,
//                   height: 60,
//                   child: GestureDetector(
//                     onTap: () {
//                       leftQuadThird = leftQuadThird == "red" ? "glass" : "red";
//                       setState(() {});
//                       print("Left Third Quadiceps");
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
// // Left Front Craft
//           Positioned(
//             left: 175,
//             top: 240,
//             child: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                   bottomRight: Radius.elliptical(10, 50),
//                   bottomLeft: Radius.elliptical(10, 50)),
//               child: SizedBox(
//                 // color: Colors.amber,
//                 width: 13,
//                 height: 50,
//                 child: GestureDetector(
//                   onTap: () {
//                     leftFrontCraft = leftFrontCraft == "red" ? "glass" : "red";
//                     setState(() {});
//                     print("Left Front  Craft");
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
