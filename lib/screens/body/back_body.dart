import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interval_timer/res/back_body_svg.dart';

class BackBody extends StatefulWidget {
  const BackBody({super.key});

  @override
  State<BackBody> createState() => _BackBodyState();
}

class _BackBodyState extends State<BackBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
              child: GestureDetector(
            onTap: () {
              print("taped");
            },
            child: SvgPicture.string("""
              
              <svg id="back-body" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 300 300" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">
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
                  <linearGradient id="blue" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stop-color="#0000FF" stop-opacity="0.2" />
            <stop offset="50%" stop-color="#0000FF" stop-opacity="0.5" />
            <stop offset="100%" stop-color="#0000FF" stop-opacity="0.2" />
                  </linearGradient>
                <linearGradient id="green" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stop-color="#0FF000" stop-opacity="0.2" />
            <stop offset="50%" stop-color="#0FF000" stop-opacity="0.5" />
            <stop offset="100%" stop-color="#0FF000" stop-opacity="0.2" />
                  </linearGradient>
                  <linearGradient id="orange" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stop-color="#FFA500" stop-opacity="0.2" />
            <stop offset="50%" stop-color="#FFA500" stop-opacity="0.5" />
            <stop offset="100%" stop-color="#FFA500" stop-opacity="0.2" />
                  </linearGradient>
              
              </defs>
                  <g filter="url(#blurFilter)">
                  ${BackBodySvg.svg()[5]} 
                  ${BackBodySvg.svg()[1]}
                  ${BackBodySvg.svg()[0]}
                  ${BackBodySvg.svg()[2]}
                  ${BackBodySvg.svg()[3]}
                  ${BackBodySvg.svg()[4]}
                  ${BackBodySvg.svg()[6]}
                  ${BackBodySvg.svg()[7]}
                  ${BackBodySvg.svg()[8]}
                  ${BackBodySvg.svg()[9]}
                  ${BackBodySvg.svg()[10]}
                  ${BackBodySvg.svg()[11]}
                  ${BackBodySvg.svg()[12]}
                  ${BackBodySvg.svg()[13]}
                  ${BackBodySvg.svg()[14]}
                  ${BackBodySvg.svg()[16]}
                  ${BackBodySvg.svg()[17]}
                  ${BackBodySvg.svg()[18]}
                  ${BackBodySvg.svg()[19]}
                  ${BackBodySvg.svg()[20]}
                  ${BackBodySvg.svg()[21]}
                  ${BackBodySvg.svg()[22]}
                  ${BackBodySvg.svg()[23]}
                  ${BackBodySvg.svg()[24]}
                  ${BackBodySvg.svg()[25]}
                  ${BackBodySvg.svg()[26]}
                  ${BackBodySvg.svg()[27]}
                  ${BackBodySvg.svg()[28]}
                  ${BackBodySvg.svg()[29]}
                  ${BackBodySvg.svg()[35]}
                  ${BackBodySvg.svg()[36]}
                  ${BackBodySvg.svg()[37]}
                  ${BackBodySvg.svg()[39]}
       
             
           
          
                  
            </g>
            </svg>
            
            """),
          ))
        ],
      ),
    );
  }
}
