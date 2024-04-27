class SvgCodes {
  static String frontBody(Map<String, String> bodyParts) {
    // Fetch SVG code for a specific body part
    return '''
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
      <path id="body-u-chestr" 
      d="M51.033169,32.626424q33.713975.543774,28.276237,26.644916v19.032085c-16.749801,0-41.825173,0-56.0087,0v-19.032085Q17.319193,32.082647,51.033169,32.626424Z" 
      transform="matrix(-.755954 0.008617-.010504-.921535 150.423168 112.451855)" 
      fill="url(#${bodyParts['rightChest']})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-chestl" 
      d="M51.033169,32.626424q33.713975.543774,28.276237,26.644916v19.032085c-16.749801,0-41.825173,0-56.0087,0v-19.032085Q17.319193,32.082647,51.033169,32.626424Z" 
      transform="matrix(-.755954 0.008617-.010504-.921535 210.80223 111.955051)" 
      fill="url(#${bodyParts["leftChest"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<ellipse id="body-u-nokeshr" 
         rx="5.709625" 
         ry="5.165851" 
         transform="matrix(.997201 0.074762-.074762 0.997201 111.110112 66.61791)" 
         fill="#d2dbed" 
         stroke-width="0"/>
<ellipse id="body-u-nokeshl" 
         rx="5.709625" 
         ry="5.165851" 
         transform="matrix(.997201 0.074762-.074762 0.997201 171.729118 67.611518)" 
         fill="#d2dbed" 
         stroke-width="0"/>
<path id="body-u-shoulderr" 
      d="M84.747145,60.358891c-16.106919-9.955154-25.484274-3.649827-32.626427,0-5.823038,7.536343-4.603712,19.260603-2.718869,26.02728c1.478844,5.233961,8.078503,10.972576,16.313214,8.882317c7.06537.465687,17.660971.556202,19.032082-8.455455v-26.454142Z" 
      transform="translate(-.543773-23.926044)" 
      fill="url(#${bodyParts["rightShoulder"]})" 
      stroke="#3f5787" 
      stroke-width="0.8"/>
<path id="body-u-shoulderl" 
      d="M84.747145,60.358891c-16.106919-9.955154-25.484274-3.649827-32.626427,0-5.823038,7.536343-4.603712,19.260603-2.718869,26.02728c1.478844,5.233961,8.078503,10.972576,16.313214,8.882317c7.06537.465687,17.660971.556202,19.032082-8.455455v-26.454142Z" 
      transform="matrix(-1 0 0 1 282.055467-22.508772)" 
      fill="url(#${bodyParts["leftShoulder"]})" 
      stroke="#3f5787" 
      stroke-width="0.8"/>

<path id="body-u-trapeziusr" 
      d="M84.747144,55.280986l50.570963-21.567011-1.631276,21.567011h-48.939687Z" 
      transform="translate(-.543772-23.926047)" 
      fill="url(#${bodyParts["rightKool"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-trapeziusl" 
      d="M84.747144,55.280986l50.570963-21.567011-1.631276,21.567011h-48.939687Z" 
      transform="matrix(-1 0 0 1 284.774334-23.926047)" 
      fill="url(#${bodyParts["leftKool"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-upperabsr" 
      d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z" 
      transform="translate(1.751072-35.087773)" 
      fill="url(#${bodyParts["rightFirstAb"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-centerabsr" 
      d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z" 
      transform="translate(1.751072-11.161726)" 
      fill="url(#${bodyParts["rightSecondAb"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-lowerabsr" 
      d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z" 
      transform="translate(1.751072 12.220547)" 
      fill="url(#${bodyParts["rightThirdAb"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>

<path id="body-u-upperabsl" 
      d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z" 
      transform="translate(42.535837-35.087773)" 
      fill="url(#${bodyParts["leftFirstAb"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-centerabsl" 
      d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z" 
      transform="translate(42.535837-11.161726)" 
      fill="url(#${bodyParts["leftSecondAb"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-lowerabsl" 
      d="M105.574029,121.261555c6.894203-.737953,20.223358-.589026,26.956163,0c2.98311,6.049834,2.326468,13.985847-.000001,16.856988-7.424837,2.97468-20.196587,2.334435-26.183744,0-4.654215-3.808504-4.045672-12.236998-.772418-16.856988Z" 
      transform="translate(42.535837 12.220547)" 
      fill="url(#${bodyParts["leftThirdAb"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-bysepsr" 
      d="M56.470905,106.016605c8.344197-7.191969,15.84478-6.069459,23.926047,0c3.807315,16.749491-3.160335,27.672535-14.681892,37.1862-11.063276-13.678785-14.860185-24.981445-9.244155-37.1862Z" 
      transform="matrix(1 0 0 1.000002-.54377-23.92631)" 
      fill="url(#${bodyParts["rightBiceps"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-bysepsl" 
      d="M56.470905,106.016605c8.344197-7.191969,15.84478-6.069459,23.926047,0c3.807315,16.749491-1.034487,26.425006-12.556044,35.938671-11.063276-13.678785-16.986033-23.733916-11.370003-35.938671Z" 
      transform="matrix(1.007585 0 0 1.000002 145.580789-22.678778)" 
      fill="url(#${bodyParts["leftBiceps"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-assistr" 
      d="M53.927333,156.909076c4.558403,1.757127,17.827754,2.729367,27.513794.499073L73.327896,203.91517c-2.977933,4.426536-9.008588,6.208485-12.506798,0l-6.893765-47.006094Z" 
      transform="translate(-.543773-34.559973)" 
      fill="url(#${bodyParts["rightForearm"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-assistl" 
      d="M53.927333,156.909076c4.558403,1.757127,17.827754,2.729367,27.513794.499073L73.327896,203.91517c-2.977933,4.426536-9.008588,6.208485-12.506798,0l-6.893765-47.006094Z" 
      transform="translate(146.25204-34.559973)" 
      fill="url(#${bodyParts["leftForearm"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-sexlinel" 
      d="M192.958129,165.851006l-38.064165,22.294725l38.064164-9.244154c2.663446-3.915862,2.636749-10.434472.000001-13.050571Z" 
      transform="translate(-.54377-24.663289)" 
      fill="url(#${bodyParts["leftSexAb"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-sexliner" 
      d="M192.958129,165.851006l-38.064165,22.294725l38.064164-9.244154c2.663446-3.915862,2.636749-10.434472.000001-13.050571Z" 
      transform="matrix(-1 0 0 1 287.557137-23.191952)" 
      fill="url(#${bodyParts["rightSexAb"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-outersquadr" 
      d="M90.390108,193.281244c3.424144-4.656936,10.84516-4.957248,14.892118,0l-6.909803,69.30824-7.982315-69.30824Z" 
      transform="matrix(.981028-.193864 0.193864 0.981028-40.087794-.907655)" 
      fill="url(#${bodyParts["rightQuadFirst"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-outersquadl" 
      d="M90.390108,193.281244c3.424144-4.656936,10.84516-4.957248,14.892118,0l-6.909803,69.30824-7.982315-69.30824Z" 
      transform="matrix(-.982564-.185925-.185925 0.982564 321.81318 0.568509)" 
      fill="url(#${bodyParts["leftQuadFirst"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-centersquadr" 
      d="M110.032626,193.281244c2.593749-2.849364,8.096883-2.454216,11.006268,0l-6.319796,61.204892-4.686472-61.204892Z" 
      transform="translate(-3.848926-23.926047)" 
      fill="url(#${bodyParts["rightQuadSecond"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-centersquadl" 
      d="M110.032626,193.281244c2.593749-2.849364,8.096883-2.454216,11.006268,0l-6.319796,61.204892-4.686472-61.204892Z" 
      transform="matrix(-1 0 0 1 287.386944-20.879503)" 
      fill="url(#${bodyParts["leftQuadSecond"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-innersquadr" 
      d="M127.705275,193.281244c5.497225-4.764345,8.425507-2.691327,9.090287,0l-9.525877,67.800596.43559-67.800596Z" 
      transform="matrix(.992445 0.12269-.12269 0.992445 18.364676-37.0949)" 
      fill="url(#${bodyParts["rightQuadThird"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-innersquadl" 
      d="M127.705275,193.281244c5.497225-4.764345,8.425507-2.691327,9.090287,0l-9.525877,67.800596.43559-67.800596Z" 
      transform="matrix(-.993831 0.110909 0.110909 0.993831 266.550345-33.112515)" 
      fill="url(#${bodyParts["leftQuadThird"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-frontcraftsl" 
      d="M176.322731,247.960848c.605409-10.866606,6.381973-14.558157,14.094324,1.087548l-7.986263,43.501903-6.108061-44.589451Z" 
      fill="url(#${bodyParts["leftFrontCraft"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-frontcraftsr" 
      d="M176.322731,247.960848c.605409-10.866606,6.381973-14.558157,14.094324,1.087548l-7.986263,43.501903-6.108061-44.589451Z" 
      transform="matrix(-1 0 0 1 285.811585-.39536)" 
      fill="url(#${bodyParts["rightFrontCraft"]})" 
      stroke="#3f5787" 
      stroke-width="0.6"/>
<path id="body-u-latissimusr" d="M60.489396,71.77814L73.971669,82.653616c7.493094,
      4.34375,8.097393,50.726023,0,46.764546L50.489396,71.77814Z"
      transform="matrix(1 0 0 0.66008 28.000001 29.471289)" 
      fill="url(#${bodyParts["leftShoulder"]})" 
      stroke="#3f5787" 
      stroke-width="0.8"/>
<path id="body-u-latissimusl" d="M60.489396,71.77814L73.971669,82.653616c7.493094,
      4.34375,9.097393,65.726023,0,46.764546L50.489396,71.77814Z"
      transform="matrix(-1 0 0 0.66008 255.83959 29.471289)"
      fill="url(#${bodyParts["leftShoulder"]})" 
      stroke="#3f5787" 
      stroke-width="0.8"/>
        <!-- Other paths omitted for brevity -->
    </g>
</svg>
''';
  }
}
