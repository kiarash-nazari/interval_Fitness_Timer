import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/widgets/glassmorphism.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class VipScreen extends StatelessWidget {
  const VipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: AnimatedContainer(
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
          Colors.black,
          Colors.black,
          // Colors.black,
          Color.fromARGB(198, 0, 204, 255),
          Colors.amber,
          Colors.black,
          Colors.black,
          Colors.black,
          // Colors.black,
          // Colors.black,
          // Colors.black,
          // Colors.black,
          // Colors.black,
          // Colors.black,
        ])),
        height: size.height,
        width: double.infinity,
        duration: const Duration(seconds: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VipButton(
                size: size,
                bgColor: Colors.amber,
                borderColor: Colors.amber,
                text: 'Gym and Diet Plan',
                icon: MdiIcons.heartCog),
            VipButton(
                size: size,
                bgColor: AppColors.mainblue,
                borderColor: AppColors.mainblue,
                text: 'Support us',
                icon: MdiIcons.handCoin),
          ],
        ),
      ),
    );
  }
}

class VipButton extends StatefulWidget {
  const VipButton({
    super.key,
    required this.size,
    required this.bgColor,
    required this.borderColor,
    required this.text,
    required this.icon,
  });

  final Size size;
  final Color bgColor;
  final Color borderColor;
  final String text;
  final IconData icon;

  @override
  State<VipButton> createState() => _VipButtonState();
}

class _VipButtonState extends State<VipButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          setState(() {
            openWhatsapp(context);
            print("some text");
          });
        },
        highlightColor: widget.bgColor.withOpacity(.2),
        splashColor: widget.bgColor.withOpacity(.2),
        child: SizedBox(
          width: widget.size.width * .8,
          height: widget.size.height * .1,
          child: Glassmorphism(
            borderColor: widget.borderColor,
            blur: .2,
            opacity: .2,
            radius: 20,
            bgColor: widget.bgColor,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  40.widthBox,
                  Icon(
                    widget.icon,
                    color: widget.borderColor,
                  ),
                  50.widthBox,
                  Expanded(
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: widget.borderColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  openWhatsapp(context) async {
    String whatsAppNum = "+35797671079";
    var whatsAppUrlAndroid =
        Uri.parse("whatsapp://send?phone=$whatsAppNum" "&text=Hello");
    var whatsAppUrlIos =
        Uri.parse("https://wa.me/$whatsAppNum?text=${Uri.parse("Hello")}");
    if (Platform.isIOS) {
      print("ARRRRRRRRRRRRRRe");

      if (await canLaunchUrl(whatsAppUrlIos)) {
        print("ARRRRRRRRRRRRRRe");

        launchUrl(
          whatsAppUrlIos,
          mode: LaunchMode.externalApplication,
        );
      } else {
        print("ARRRRRRRRRRRRRRe");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("whatsapp not installed"),
          ),
        );
      }
    } else {
      if (await canLaunchUrl(whatsAppUrlAndroid)) {
        print("ARRRRRRRRRRRRRRe");

        launchUrl(whatsAppUrlAndroid);
        launchUrl(whatsAppUrlAndroid, mode: LaunchMode.externalApplication);
      } else {
        print("ssssssssssssag");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("whatsapp not installed"),
          ),
        );
      }
    }
  }
}
