import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FrontBody extends StatefulWidget {
  const FrontBody({Key? key}) : super(key: key);

  @override
  State<FrontBody> createState() => _FrontBodyState();
}

String leftKool = "glass";
String leftShoulder = "glass";
String leftBiceps = "glass";
String leftForearm = "glass";
String leftChest = "glass";
String leftFirstAb = "glass";
String leftSecondAb = "glass";
String leftThirdAb = "glass";
String leftSexAb = "glass";
String leftQuadFirst = "glass";
String leftQuadSecond = "glass";
String leftQuadThird = "glass";
String leftFrontCraft = "glass";

//Right

String rightKool = "glass";
String rightShoulder = "glass";
String rightBiceps = "glass";
String rightForearm = "glass";
String rightChest = "glass";
String rightFirstAb = "glass";
String rightSecondAb = "glass";
String rightThirdAb = "glass";
String rightSexAb = "glass";
String rightQuadFirst = "glass";
String rightQuadSecond = "glass";
String rightQuadThird = "glass";
String rightFrontCraft = "glass";

class _FrontBodyState extends State<FrontBody> {
  @override
  Widget build(BuildContext context) {
    String rawSvg = '''
<svg id="body" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 300 300" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" style="background-color:transparent">
    <!-- Define a filter for the glassmorphism effect -->
    <defs>
        <!-- Define a gradient for the glass-like effect -->
        <linearGradient id="glass" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stop-color="#ffffff" stop-opacity="0.2" />
            <stop offset="50%" stop-color="#cccccc" stop-opacity="0.1" />
            <stop offset="100%" stop-color="#ffffff" stop-opacity="0.2" />
        </linearGradient>
            <linearGradient id="red" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stop-color="#FF0000" stop-opacity="0.2" />
            <stop offset="50%" stop-color="#FF0000" stop-opacity="0.5" />
            <stop offset="100%" stop-color="#FF0000" stop-opacity="0.2" />
        </linearGradient>
                <linearGradient id="green" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stop-color="#0FF000" stop-opacity="0.2" />
            <stop offset="50%" stop-color="#0FF000" stop-opacity="0.5" />
            <stop offset="100%" stop-color="#0FF000" stop-opacity="0.2" />
        </linearGradient>
    </defs>
    <g filter="url(#blurFilter)">
        <path id="body-u-chestr" d="M51.033169,32.626424q33.713975.543774,28.276237,
        26.644916v19.032085c-16.749801,
        0-41.825173,0-56.0087,0v-19.032085Q17.319193,32.082647,51.033169,
        32.626424Z" transform="matrix(-.755954 0.008617-.010504-.921535 150.423168 112.451855)"
         fill="url(#$rightChest)" stroke="#3f5787" stroke-width="0.6"/>
         <path id="body-u-chestl" d="M51.033169,32.626424q33.713975.543774,
         28.276237,26.644916v19.032085c-16.749801,0-41.825173,0-56.0087,
         0v-19.032085Q17.319193,32.082647,51.033169,32.626424Z"
          transform="matrix(-.755954 0.008617-.010504-.921535 210.80223 111.955051)"
           fill="url(#$leftChest)" stroke="#3f5787" stroke-width="0.6"/>
           <ellipse id="body-u-nokeshr" rx="5.709625" ry="5.165851"
            transform="matrix(.997201 0.074762-.074762 0.997201 111.110112 66.61791)"
             fill="#d2dbed" stroke-width="0"/><ellipse id="body-u-nokeshl" rx="5.709625"
              ry="5.165851" transform="matrix(.997201 0.074762-.074762 0.997201 171.729118 67.611518)"
               fill="#d2dbed" stroke-width="0"/>
               <path id="body-u-shoulderr"
                d="M84.747145,60.358891c-16.106919-9.955154-25.484274-3.649827-32.626427,0-5.823038,
                7.536343-4.603712,19.260603-2.718869,26.02728c1.478844,5.233961,
                8.078503,10.972576,16.313214,8.882317c7.06537.465687,
                17.660971.556202,19.032082-8.455455v-26.454142Z"
                 transform="translate(-.543773-23.926044)"
                  fill="url(#$leftShoulder)" stroke="#3f5787" stroke-width="0.8"/>
                  <path id="body-u-shoulderl" d="M84.747145,
                  60.358891c-16.106919-9.955154-25.484274-3.649827-32.626427,
                  0-5.823038,7.536343-4.603712,19.260603-2.718869,26.02728c1.478844,5.233961,
                  8.078503,10.972576,16.313214,8.882317c7.06537.465687,17.660971.556202,
                  19.032082-8.455455v-26.454142Z" transform="matrix(-1 0 0 1 282.055467-22.508772)"
                   fill="url(#$rightShoulder)" stroke="#3f5787" stroke-width="0.8"/>
                   <path id="body-u-trapeziusr" d="M84.747144,55.280986l50.570963-21.567011-1.631276,21.567011h-48.939687Z"
                    transform="translate(-.543772-23.926047)" fill="url(#$rightKool)"
                     stroke="#3f5787" stroke-width="0.6"/><path id="body-u-trapeziusl"
                      d="M84.747144,55.280986l50.570963-21.567011-1.631276,21.567011h-48.939687Z"
                       transform="matrix(-1 0 0 1 284.774334-23.926047)" fill="url(#$leftKool)"
                        stroke="#3f5787" stroke-width="0.6"/><path id="body-u-upperabsr"
                         d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,
                         26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,
                         2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z"
                          transform="translate(1.751072-35.087773)" fill="url(#$rightFirstAb)"
                           stroke="#3f5787" stroke-width="0.6"/>
                           <path id="body-u-centerabsr"
                            d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,
                            6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,
                            2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z"
                             transform="translate(1.751072-11.161726)" fill="url(#$rightSecondAb)" 
                             stroke="#3f5787" stroke-width="0.6"/>
                             <path id="body-u-lowerabsr" d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z" transform="translate(1.751072 12.220547)" fill="url(#$rightThirdAb)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-upperabsl" d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z" transform="translate(42.535837-35.087773)" fill="url(#$leftFirstAb)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-centerabsl" d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z" transform="translate(42.535837-11.161726)" fill="url(#$leftSecondAb)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-lowerabsl" d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z" transform="translate(42.535837 12.220547)" fill="url(#$leftThirdAb)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-bysepsr" d="M56.470905,106.016605c8.344197-7.191969,15.84478-6.069459,23.926047,0c3.807315,16.749491-3.160335,27.672535-14.681892,37.1862-11.063276-13.678785-14.860185-24.981445-9.244155-37.1862Z" transform="matrix(1 0 0 1.000002-.54377-23.92631)" fill="url(#$rightBiceps)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-bysepsl" d="M56.470905,106.016605c8.344197-7.191969,15.84478-6.069459,23.926047,0c3.807315,16.749491-1.034487,26.425006-12.556044,35.938671-11.063276-13.678785-16.986033-23.733916-11.370003-35.938671Z" transform="matrix(1.007585 0 0 1.000002 145.580789-22.678778)" fill="url(#$leftBiceps)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-assistr" d="M53.927333,156.909076c4.558403,1.757127,17.827754,2.729367,27.513794.499073L73.327896,203.91517c-2.977933,4.426536-9.008588,6.208485-12.506798,0l-6.893765-47.006094Z" transform="translate(-.543773-34.559973)" fill="url(#$rightForearm)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-assistl" d="M53.927333,156.909076c4.558403,1.757127,17.827754,2.729367,27.513794.499073L73.327896,203.91517c-2.977933,4.426536-9.008588,6.208485-12.506798,0l-6.893765-47.006094Z" transform="translate(146.25204-34.559973)" fill="url(#$leftForearm)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-sexlinel" d="M192.958129,165.851006l-38.064165,22.294725l38.064164-9.244154c2.663446-3.915862,2.636749-10.434472.000001-13.050571Z" transform="translate(-.54377-24.663289)" fill="url(#glass)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-sexliner" d="M192.958129,165.851006l-38.064165,22.294725l38.064164-9.244154c2.663446-3.915862,2.636749-10.434472.000001-13.050571Z" transform="matrix(-1 0 0 1 287.557137-23.191952)" fill="url(#glass)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-outersquadr" d="M90.390108,193.281244c3.424144-4.656936,10.84516-4.957248,14.892118,0l-6.909803,69.30824-7.982315-69.30824Z" transform="matrix(.981028-.193864 0.193864 0.981028-40.087794-.907655)" fill="url(#glass)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-outersquadl" d="M90.390108,193.281244c3.424144-4.656936,10.84516-4.957248,14.892118,0l-6.909803,69.30824-7.982315-69.30824Z" transform="matrix(-.982564-.185925-.185925 0.982564 321.81318 0.568509)" fill="url(#glass)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-centersquadr" d="M110.032626,193.281244c2.593749-2.849364,8.096883-2.454216,11.006268,0l-6.319796,61.204892-4.686472-61.204892Z" transform="translate(-3.848926-23.926047)" fill="url(#glass)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-centersquadl" d="M110.032626,193.281244c2.593749-2.849364,8.096883-2.454216,11.006268,0l-6.319796,61.204892-4.686472-61.204892Z" transform="matrix(-1 0 0 1 287.386944-20.879503)" fill="url(#glass)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-innersquadr" d="M127.705275,193.281244c5.497225-4.764345,8.425507-2.691327,9.090287,0l-9.525877,67.800596.43559-67.800596Z" transform="matrix(.992445 0.12269-.12269 0.992445 18.364676-37.0949)" fill="url(#glass)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-innersquadl" d="M127.705275,193.281244c5.497225-4.764345,8.425507-2.691327,9.090287,0l-9.525877,67.800596.43559-67.800596Z" transform="matrix(-.993831 0.110909 0.110909 0.993831 266.550345-33.112515)" fill="url(#glass)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-frontcraftsl" d="M176.322731,247.960848c.605409-10.866606,6.381973-14.558157,14.094324,1.087548l-7.986263,43.501903-6.108061-44.589451Z" fill="url(#glass)" stroke="#3f5787" stroke-width="0.6"/><path id="body-u-frontcraftsr" d="M176.322731,247.960848c.605409-10.866606,6.381973-14.558157,14.094324,1.087548l-7.986263,43.501903-6.108061-44.589451Z" transform="matrix(-1 0 0 1 285.811585-.39536)" fill="url(#glass)" stroke="#3f5787" stroke-width="0.6"/>

        <!-- Other paths omitted for brevity -->
    </g>
</svg>
''';
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 80, 5, 218),
      appBar: AppBar(
        title: const Text('Front Body'),
      ),
      body: Center(
        child: Stack(children: [
          SvgPicture.string(
            rawSvg,
            // You can adjust the alignment and fit according to your needs
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
          // Left Shoulder
          Positioned(
            left: 47,
            top: 33,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 40,
                height: 40,
                child: GestureDetector(
                  onTap: () {
                    leftShoulder = leftShoulder == "red" ? "glass" : "red";
                    setState(() {});
                    print("Left Shoulder");
                  },
                ),
              ),
            ),
          ),
          //LEFT Byseps
          Positioned(
            left: 53,
            top: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 30,
                height: 30,
                child: GestureDetector(
                  onTap: () {
                    print("BiCeps");
                  },
                ),
              ),
            ),
          ),
          //Left Forearm
          Positioned(
            left: 53,
            top: 125,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 30,
                height: 45,
                child: GestureDetector(
                  onTap: () {
                    print("Left Forearm");
                  },
                ),
              ),
            ),
          ),
          //Left Trapezius
          Positioned(
            left: 85,
            top: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 50,
                height: 25,
                child: GestureDetector(
                  onTap: () {
                    print("Left Trapezius");
                  },
                ),
              ),
            ),
          ),
          //Left Chest
          Positioned(
            left: 91.5,
            top: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                // color: Colors.amber,
                width: 40,
                height: 40,
                child: GestureDetector(
                  onTap: () {
                    print("Left Chest");
                  },
                ),
              ),
            ),
          ),
          //Left First Abs
          Positioned(
            left: 103,
            top: 87,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 33,
                height: 18,
                child: GestureDetector(
                  onTap: () {
                    print("Left First Abs");
                  },
                ),
              ),
            ),
          ),
          //Left Second Abs
          Positioned(
            left: 105,
            top: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 33,
                height: 18,
                child: GestureDetector(
                  onTap: () {
                    print("Left Second Abs");
                  },
                ),
              ),
            ),
          ),
          //Left Third Abs
          Positioned(
            left: 107,
            top: 133,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 27,
                height: 18,
                child: GestureDetector(
                  onTap: () {
                    print("Left Third Abs");
                  },
                ),
              ),
            ),
          ),
          //Left sex Abs
          Positioned(
            left: 92,
            top: 153,
            child: Transform.rotate(
              angle: .5,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.elliptical(60, 10),
                    topRight: Radius.elliptical(50, 5)),
                child: SizedBox(
                  // color: Colors.amber,
                  width: 37,
                  height: 10,
                  child: GestureDetector(
                    onTap: () {
                      print("Left Sex Abs");
                    },
                  ),
                ),
              ),
            ),
          ),
          //Left sex Abs
          Positioned(
            left: 92,
            top: 153,
            child: Transform.rotate(
              angle: .5,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.elliptical(60, 10),
                    topRight: Radius.elliptical(50, 5)),
                child: SizedBox(
                  // color: Colors.amber,
                  width: 37,
                  height: 10,
                  child: GestureDetector(
                    onTap: () {
                      print("Left Sex Abs");
                    },
                  ),
                ),
              ),
            ),
          ),
          //Left Firs  Quadriceps
          Positioned(
            left: 96,
            top: 167,
            child: Transform.rotate(
              angle: -.2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.elliptical(10, 50),
                    bottomLeft: Radius.elliptical(10, 50)),
                child: SizedBox(
                  // color: Colors.amber,
                  width: 7,
                  height: 70,
                  child: GestureDetector(
                    onTap: () {
                      print("Left First Quadiceps");
                    },
                  ),
                ),
              ),
            ),
          ),
          //Left Second  Quadriceps
          Positioned(
            left: 108,
            top: 167,
            child: Transform.rotate(
              angle: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.elliptical(10, 50),
                    bottomLeft: Radius.elliptical(10, 50)),
                child: SizedBox(
                  // color: Colors.amber,
                  width: 6,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      print("Left Second Quadiceps");
                    },
                  ),
                ),
              ),
            ),
          ),
          //Left Third  Quadriceps
          Positioned(
            left: 118,
            top: 169,
            child: Transform.rotate(
              angle: 0.2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.elliptical(10, 50),
                    bottomLeft: Radius.elliptical(10, 50)),
                child: SizedBox(
                  // color: Colors.amber,
                  width: 6,
                  height: 60,
                  child: GestureDetector(
                    onTap: () {
                      print("Left Third Quadiceps");
                    },
                  ),
                ),
              ),
            ),
          ),
          //Left Front  Craft
          Positioned(
            left: 98,
            top: 240,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.elliptical(10, 50),
                  bottomLeft: Radius.elliptical(10, 50)),
              child: SizedBox(
                // color: Colors.amber,
                width: 13,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    print("Left Front  Craft");
                  },
                ),
              ),
            ),
          ),

          ////
          ///
          ///
          //
          //*********************Right Side*****************
          ///
          ///
          ///
          //

          // Right Shoulder
          Positioned(
            left: 195,
            top: 33,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 40,
                height: 40,
                child: GestureDetector(
                  onTap: () {
                    print("Right Shoulder");
                  },
                ),
              ),
            ),
          ),
          //Right Byseps
          Positioned(
            left: 200,
            top: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 30,
                height: 30,
                child: GestureDetector(
                  onTap: () {
                    print("Right BiCeps");
                  },
                ),
              ),
            ),
          ),
          //Right Forearm
          Positioned(
            left: 200,
            top: 125,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 30,
                height: 45,
                child: GestureDetector(
                  onTap: () {
                    print("Right Forearm");
                  },
                ),
              ),
            ),
          ),
          //Right Trapezius
          Positioned(
            left: 149,
            top: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 50,
                height: 25,
                child: GestureDetector(
                  onTap: () {
                    print("Right Trapezius");
                  },
                ),
              ),
            ),
          ),
          //Right Chest
          Positioned(
            left: 151,
            top: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                // color: Colors.amber,
                width: 40,
                height: 40,
                child: GestureDetector(
                  onTap: () {
                    print("Right Chest");
                  },
                ),
              ),
            ),
          ),
          //Right First Abs
          Positioned(
            left: 145,
            top: 87,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 33,
                height: 18,
                child: GestureDetector(
                  onTap: () {
                    print("Right First Abs");
                  },
                ),
              ),
            ),
          ),
          //Right Second Abs
          Positioned(
            left: 145,
            top: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 33,
                height: 18,
                child: GestureDetector(
                  onTap: () {
                    print("Right Second Abs");
                  },
                ),
              ),
            ),
          ),
          //Right Third Abs
          Positioned(
            left: 147,
            top: 133,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                // color: Colors.amber,
                width: 27,
                height: 18,
                child: GestureDetector(
                  onTap: () {
                    print("Right Third Abs");
                  },
                ),
              ),
            ),
          ),
          //Right sex Abs
          Positioned(
            left: 157,
            top: 150,
            child: Transform.rotate(
              angle: 2.7,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.elliptical(60, 10),
                    topRight: Radius.elliptical(50, 5)),
                child: SizedBox(
                  // color: Colors.amber,
                  width: 37,
                  height: 10,
                  child: GestureDetector(
                    onTap: () {
                      print("Right Sex Abs");
                    },
                  ),
                ),
              ),
            ),
          ),

          //Left Firs  Quadriceps
          Positioned(
            left: 180,
            top: 167,
            child: Transform.rotate(
              angle: .2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.elliptical(10, 50),
                    bottomLeft: Radius.elliptical(10, 50)),
                child: SizedBox(
                  // color: Colors.amber,
                  width: 7,
                  height: 70,
                  child: GestureDetector(
                    onTap: () {
                      print("Right First Quadiceps");
                    },
                  ),
                ),
              ),
            ),
          ),
          //Right Second  Quadriceps
          Positioned(
            left: 170,
            top: 170,
            child: Transform.rotate(
              angle: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.elliptical(10, 50),
                    bottomLeft: Radius.elliptical(10, 50)),
                child: SizedBox(
                  // color: Colors.amber,
                  width: 6,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      print("Right Second Quadiceps");
                    },
                  ),
                ),
              ),
            ),
          ),
          //Right Third  Quadriceps
          Positioned(
            left: 159,
            top: 172,
            child: Transform.rotate(
              angle: -0.2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.elliptical(10, 50),
                    bottomLeft: Radius.elliptical(10, 50)),
                child: SizedBox(
                  // color: Colors.amber,
                  width: 6,
                  height: 60,
                  child: GestureDetector(
                    onTap: () {
                      print("Right Third Quadiceps");
                    },
                  ),
                ),
              ),
            ),
          ),
          //Right Front  Craft
          Positioned(
            left: 175,
            top: 240,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.elliptical(10, 50),
                  bottomLeft: Radius.elliptical(10, 50)),
              child: SizedBox(
                // color: Colors.amber,
                width: 13,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    print("Right Front  Craft");
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}



// // models.dart
// import 'package:flutter/material.dart';

// import 'package:path_drawing/path_drawing.dart';
// import 'package:xml/xml.dart';

// class VectorImage {
//   const VectorImage({
//     required this.items,
//     this.size,
//   });

//   final List<PathSvgItem> items;
//   final Size? size;
// }

// class PathSvgItem {
//   const PathSvgItem({
//     required this.path,
//     this.fill,
//   });

//   final Path path;
//   final Color? fill;
// }

// // svg_painter.dart

// class SvgPainter extends CustomPainter {
//   const SvgPainter(this.pathSvgItem, this.onTap);
//   final PathSvgItem pathSvgItem;
//   final VoidCallback onTap;

//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path = pathSvgItem.path;

//     final paint = Paint();
//     paint.color = pathSvgItem.fill ?? Colors.white;
//     paint.style = PaintingStyle.fill;

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool? hitTest(Offset position) {
//     Path path = pathSvgItem.path;
//     if (path.contains(position)) {
//       onTap();
//       return true;
//     }
//     return super.hitTest(position);
//   }

//   @override
//   bool shouldRepaint(SvgPainter oldDelegate) {
//     return pathSvgItem != oldDelegate.pathSvgItem;
//   }
// }

// // utils.dart

// VectorImage getVectorImageFromStringXml(String svgData) {
//   List<PathSvgItem> items = [];

//   // step 1: parse the xml
//   XmlDocument document = XmlDocument.parse(svgData);

//   // step 2: get the size of the svg
//   Size? size;
//   String? width = document.findAllElements('svg').first.getAttribute('width');
//   String? height = document.findAllElements('svg').first.getAttribute('height');
//   String? viewBox = document.findAllElements('svg').first.getAttribute('viewBox');
//   if (width != null && height != null) {
//     width = width.replaceAll(RegExp(r'[^0-9.]'), '');
//     height = height.replaceAll(RegExp(r'[^0-9.]'), '');
//     size = Size(double.parse(width), double.parse(height));
//   } else if (viewBox != null) {
//     List<String> viewBoxList = viewBox.split(' ');
//     size = Size(double.parse(viewBoxList[2]), double.parse(viewBoxList[3]));
//   }

//   // step 3: get the paths
//   final List<XmlElement> paths = document.findAllElements('path').toList();
//   for (int i = 0; i < paths.length; i++) {
//     final XmlElement element = paths[i];

//     // get the path
//     String? pathString = element.getAttribute('d');
//     if (pathString == null) {
//       continue;
//     }
//     Path path = parseSvgPathData(pathString);

//     // get the fill color
//     String? fill = element.getAttribute('fill');
//     String? style = element.getAttribute('style');
//     if (style != null) {
//       fill = _getFillColor(style);
//     }

//     // get the transformations
//     String? transformAttribute = element.getAttribute('transform');
//     double scaleX = 1.0;
//     double scaleY = 1.0;
//     double? translateX;
//     double? translateY;
//     if (transformAttribute != null) {
//       ({double x, double y})? scale = _getScale(transformAttribute);
//       if (scale != null) {
//         scaleX = scale.x;
//         scaleY = scale.y;
//       }
//       ({double x, double y})? translate = _getTranslate(transformAttribute);
//       if (translate != null) {
//         translateX = translate.x;
//         translateY = translate.y;
//       }
//     }

//     final Matrix4 matrix4 = Matrix4.identity();
//     if (translateX != null && translateY != null) {
//       matrix4.translate(translateX, translateY);
//     }
//     matrix4.scale(scaleX, scaleY);

//     path = path.transform(matrix4.storage);

//     items.add(PathSvgItem(
//       fill: _getColorFromString(fill),
//       path: path,
//     ));
//   }

//   return VectorImage(items: items, size: size);
// }

// ({double x, double y})? _getScale(String data) {
//   RegExp regExp = RegExp(r'scale\(([^,]+),([^)]+)\)');
//   var match = regExp.firstMatch(data);

//   if (match != null) {
//     double scaleX = double.parse(match.group(1)!);
//     double scaleY = double.parse(match.group(2)!);

//     return (x: scaleX, y: scaleY);
//   } else {
//     return null;
//   }
// }

// ({double x, double y})? _getTranslate(String data) {
//   RegExp regExp = RegExp(r'translate\(([^,]+),([^)]+)\)');
//   var match = regExp.firstMatch(data);

//   if (match != null) {
//     double translateX = double.parse(match.group(1)!);
//     double translateY = double.parse(match.group(2)!);

//     return (x: translateX, y: translateY);
//   } else {
//     return null;
//   }
// }

// String? _getFillColor(String data) {
//   RegExp regExp = RegExp(r'fill:\s*(#[a-fA-F0-9]{6})');
//   RegExpMatch? match = regExp.firstMatch(data);

//   return match?.group(1);
// }

// Color _hexToColor(String hex) {
//   final buffer = StringBuffer();
//   if (hex.length == 6 || hex.length == 7) buffer.write('ff');
//   buffer.write(hex.replaceFirst('#', ''));
//   return Color(int.parse(buffer.toString(), radix: 16));
// }

// Color? _getColorFromString(String? colorString) {
//   if (colorString == null) return null;
//   if (colorString.startsWith('#')) {
//     return _hexToColor(colorString);
//   } else {
//     switch (colorString) {
//       case 'red':
//         return Colors.red;
//       case 'green':
//         return Colors.green;
//       case 'blue':
//         return Colors.blue;
//       case 'yellow':
//         return Colors.yellow;
//       case 'white':
//         return Colors.white;
//       case 'black':
//         return Colors.black;
//       default:
//         return Colors.transparent;
//     }
//   }
// }
// Future<VectorImage> getVectorImage(svgData) async {
//   final VectorImage vectorImage = getVectorImageFromStringXml(svgData);
//   return vectorImage;
// }

// class ColoringSvgScreen extends StatefulWidget {
//   const ColoringSvgScreen({super.key});

//   @override
//   State<ColoringSvgScreen> createState() => _ColoringSvgScreenState();
// }

// class _ColoringSvgScreenState extends State<ColoringSvgScreen> {
//   @override
//   void initState() {
//     _init();
//     super.initState();
//   }

//   Size? _size;
//   List<PathSvgItem>? _items;

//   static const urlDogWithSmile =
//       'https://vk.com/doc223802256_674334116?hash=407AqZBhX6zQrqcI3cGxCZdJGaZDbv1ywq65EZ8eHqH&dl=5KapGZXnEYzXOUUA977vWJoTB0kvZSrUzp7drp4qPIX';

//   Future<void> _init() async {
//     final value = await getVectorImage(urlDogWithSmile);
//     setState(() {
//       _items = value.items;
//       _size = value.size;
//     });
//   }

//   void _onTap(int index) {
//     setState(() {
//       _items![index] = _items![index].copyWith(
//         fill: Colors.red,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Coloring SVG')),
//       body: _items == null || _size == null
//           ? const Center(child: CircularProgressIndicator())
//           : InteractiveViewer(
//               child: Center(
//                 child: FittedBox(
//                   // RepaintBoundary should be used to prevent rebuilds
//                   // during transformations with InteractiveViewer
//                   child: RepaintBoundary(
//                     child: SizedBox(
//                       width: _size!.width,
//                       height: _size!.height,
//                       child: Stack(
//                         children: [
//                           for (int index = 0; index < _items!.length; index++)
//                             SvgPainterImage(
//                               item: _items![index],
//                               size: _size!,
//                               onTap: () => _onTap(index),
//                             )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }
// }

// class SvgPainterImage extends StatelessWidget {
//   const SvgPainterImage({
//     super.key,
//     required this.item,
//     required this.size,
//     required this.onTap,
//   });
//   final PathSvgItem item;
//   final Size size;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: size,
//       foregroundPainter: SvgPainter(item, onTap),
//     );
//   }
// }
