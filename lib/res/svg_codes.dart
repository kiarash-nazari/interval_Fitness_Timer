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
      fill="url(#${bodyParts["rightLatissimus"]})" 
      stroke="#3f5787" 
      stroke-width="0.8"/>
<path id="body-u-latissimusl" d="M60.489396,71.77814L73.971669,82.653616c7.493094,
      4.34375,9.097393,65.726023,0,46.764546L50.489396,71.77814Z"
      transform="matrix(-1 0 0 0.66008 255.83959 29.471289)"
      fill="url(#${bodyParts["leftLatissimus"]})" 
      stroke="#3f5787" 
      stroke-width="0.8"/>
        <!-- Other paths omitted for brevity -->
    </g>
</svg>
''';
  }

  static String backBody() {
    // Fetch SVG code for a specific body part
    return """
<svg id="back-body" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 300 300" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">    <!-- Define a filter for the glassmorphism effect -->
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
<path id="back-body-u-biceps-femorisr" d="M168.470539,171.202725c-2.652309,18.528759,2.715647,61.117162,7.528369,84.31775c2.902808-23.64338,5.128751-67.684346-7.528369-84.31775Z" transform="translate(.000002-6.022695)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-adductorr" d="M156.425144,194.540674c-4.651233,14.752463-8.694203,47.877294,2.258511,63.238314c5.763606-10.302379-7.276261-48.05735-2.258511-63.238314Z" transform="translate(.000002-6.022697)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-semitendinosusr" d="M162.447843,174.214073c-7.532761,16.574693-7.058656,57.529972-.752837,79.047893c13.425224-13.92142,5.429771-53.821785.752837-79.047893Z" transform="translate(0-6.022697)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-semitendinosusl" d="M162.447843,174.214073c-7.532761,16.574693-7.058656,57.529972-.752837,79.047893c13.425224-13.92142,5.429771-53.821785.752837-79.047893Z" transform="matrix(-1 0 0 1 291.39465-7.851053)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-biceps-femorisl" d="M168.470539,171.202725c-2.652309,18.528759,2.715647,61.117162,7.528369,84.31775c2.902808-23.64338,5.128751-67.684346-7.528369-84.31775Z" transform="matrix(-1 0 0 1 290.160107-3.764184)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-adductorl" d="M156.425144,194.540674c-4.651233,14.752463-8.694203,47.877294,2.258511,63.238314c5.763606-10.302379-7.276261-48.05735-2.258511-63.238314Z" transform="matrix(-1 0 0 1 290.927701-6.022697)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-koolr" d="M84.747144,55.280986l50.570963-21.567011-1.631276,21.567011h-48.939687Z" transform="matrix(-1 0 0 1 284.774-29.948697)" fill="url(#back-body-u-koolr-fill)" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-kooll" d="M84.747144,55.280986l50.570963-21.567011-1.631276,21.567011h-48.939687Z" transform="translate(-.543772-29.948697)" fill="url(#back-body-u-kooll-fill)" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-trapeziusr" d="M144.594254,84.634934l5.107172,11.392923c2.993858-10.264728,20.891886-25.071398,37.36582-33.765758c8.127759-4.289544,2.775889-19.559098,15.406924-22.657242-2.62041-7.576143-37.640076,2.660766-51.201307-2.113049-8.380808,4.183565-7.606303,28.874393-6.678609,47.143126Z" transform="translate(.000001-10.372887)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-trapeziusl" d="M141.056495,85.027794l6.28575,11.785782c2.993858-10.264728,23.251067-25.857117,39.725001-34.551477c8.127759-4.289544,2.775889-19.559098,15.406924-22.657242-2.62041-7.576143-37.825771,3.233123-51.387002-1.540692-10.759227,1.24602-11.608152,29.192452-10.030673,46.963629Z" transform="matrix(-1 0 0 1 283.686453-10.372887)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-middle-headr" d="M205.464927,33.713975c19.939302-13.673133,52.908692,8.106349,33.019456,27.574535-5.62364-16.41975-25.535771-26.432211-33.019456-27.574535Z" transform="translate(.000004-6.022694)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-middle-headl" d="M205.464927,33.713975c19.939302-13.673133,52.908692,8.106349,33.019456,27.574535-5.62364-16.41975-25.535771-26.432211-33.019456-27.574535Z" transform="matrix(-1 0 0 1 284.414136-6.022694)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-posterior-headr" d="M197.663346,44.317567c3.531042,9.461511,22.40669,9.001393,36.331547,9.74227.476759-4.319245-29.641202-30.124306-36.331547-9.74227Z" transform="translate(-1.533203-5.569555)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-posterior-headl" d="M197.663346,44.317567c3.531042,9.461511,22.40669,9.001393,36.331547,9.74227.476759-4.319245-29.641202-30.124306-36.331547-9.74227Z" transform="matrix(-1 0 0 1 285.731617-5.569556)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-teresr" d="M195.676998,46.583288l-2.718869,8.156607c.917446,4.460978,2.160526,11.031578,4.531448,13.141199c3.401178,4.019721,14.980353,7.378334,21.750948,5.890883c3.92467-2.030583-.27695-11.773197-.906289-18.578938-8.745743,1.902895-20.512905-.978198-22.657238-8.609751Z" transform="translate(.000004-6.022696)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-teresl" d="M195.676998,46.583288l-2.718869,8.156607c.917446,4.460978,2.160526,11.031578,4.531448,13.141199c3.401178,4.019721,14.980353,7.378334,21.750948,5.890883c3.92467-2.030583-.27695-11.773197-.906289-18.578938-8.745743,1.902895-20.512905-.978198-22.657238-8.609751Z" transform="matrix(-1 0 0 1 285.268886-6.022697)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-latissimus-dorsir" d="M185.254667,61.083922c8.294313,8.989332,25.016002,15.694404,34.89215,14.953777c8.831433,13.041064-24.868149,47.452645-37.175113,65.042033c6.863912-9.276516-14.88148-32.443286-32.091701-47.437771.227205-8.568131,22.592327-28.185978,34.374664-32.558039Z" transform="translate(.000002-6.022694)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-latissimus-dorsil" d="M186.23905,62.507854c8.294313,8.989332,24.031619,14.270472,33.907767,13.529845c10.722356,9.004312-24.416263,40.271862-40.660038,69.338932c2.73603-21.783161-15.019836-43.297299-28.606776-51.73467.227205-8.568131,23.57671-26.762046,35.359047-31.134107Z" transform="matrix(-1 0 0 1 285.728136-6.022694)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-long-headr" d="M217.427948,55.193039c4.038166,4.709293,3.212812,24.03376,1.81258,34.892151-.529232,4.104044,5.863427,12.770165,16.313213,11.328621-6.657155-12.526021,1.12225-26.89907,0-36.704731-.752139-6.571818-14.547763-9.794081-18.125793-9.516041Z" transform="translate(1.812581-6.022696)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-long-head-l" d="M217.427948,55.193039c4.038166,4.709293,3.212812,24.03376,1.81258,34.892151-.529232,4.104044,5.863427,12.770165,16.313213,11.328621-6.657155-12.526021,1.12225-26.89907,0-36.704731-.752139-6.571818-14.547763-9.794081-18.125793-9.516041Z" transform="matrix(-1 0 0 1 283.308086-5.269859)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-lateral-headr" d="M236.978711,65.805533c-5.237451,5.171184-2.086144,22.621606,6.775533,30.113483c5.176253,4.37613,2.567871,3.27173,6.215167,7.647232.709492-14.644441-2.664534-29.005727-12.9907-37.760715Z" transform="matrix(.993062 0.117595-.117595 0.993062 12.390968-37.385246)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-lateral-headl" d="M236.978711,65.805533c-5.237451,5.171184-2.086144,22.621606,6.775533,30.113483c5.176253,4.37613,2.567871,3.27173,6.215167,7.647232.709492-14.644441-2.664534-29.005727-12.9907-37.760715Z" transform="matrix(-.993972 0.109635 0.109635 0.993972 272.119734-36.256282)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-medial-headr" d="M220.910321,93.644965c.598713,9.475022,10.609041,22.689488,21.511595,22.194503l-5.121809-13.658155c-5.193482,1.201517-13.867811-3.174598-16.389786-8.536348Z" transform="translate(0-6.022697)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-medial-headl" d="M220.910321,93.644965c.598713,9.475022,10.609041,22.689488,21.511595,22.194503l-5.121809-13.658155c-5.193482,1.201517-13.867811-3.174598-16.389786-8.536348Z" transform="matrix(-1 0 0 1 284.967213-5.269861)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-assistr" d="M52.463818,149.375107c4.558403,1.757127,15.240095,9.400826,24.926135,7.170532L73.327896,203.91517c-2.977933,4.426536-9.008588,6.208485-12.506798,0l-8.35728-54.540063Z" transform="translate(172.202495-43.997236)" fill="url(#back-body-u-assistr-fill)" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-assistl" d="M52.463818,149.375107c4.558403,1.757127,15.240095,9.400826,24.926135,7.170532L73.327896,203.91517c-2.977933,4.426536-9.008588,6.208485-12.506798,0l-8.35728-54.540063Z" transform="matrix(-1 0 0 1 116.492552-44.750072)" fill="url(#back-body-u-assistl-fill)" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-erector-spinael" d="M137.54734,96.269211c-6.326543,10.324205-20.114455,26.165984-28.236769,30.692139l-.613844,14.118384c11.387731,1.23567,28.192812,16.119089,33.761354,29.464453v-66.908865l-4.910741-7.366111Z" transform="translate(.000001-6.022695)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-erector-spinaer" d="M137.54734,96.269211c-7.209735,10.234041-18.096025,25.58011-28.236769,30.692139l-.613844,14.118384c11.65621-.713732,26.990505,17.963574,34.98904,31.305981l-1.227686-68.750393-4.910741-7.366111Z" transform="matrix(-1 0 0 1 289.213063-6.022695)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-gluteus-mediusr" d="M192.793191,152.128905c-10.166422-2.976013-22.987325-11.137615-27.622926-2.455371l-9.207642,9.821484c8.481026-2.239384,20.453135,6.353327,34.98904,11.663013c3.526399-.117038,5.975048-6.881409,1.841528-19.029126Z" transform="translate(-.613843-5.408853)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-gluteus-mediusl" d="M192.793191,152.128905c-10.166422-2.976013-22.987325-11.137615-27.622926-2.455371l-9.207642,9.821484c8.481026-2.239384,20.453135,6.353327,34.98904,11.663013c3.526399-.117038,5.975048-6.881409,1.841528-19.029126Z" transform="matrix(-1 0 0 1 290.440749-4.795011)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-gluteus-maximusr" d="M156.576466,163.178075c1.866999-4.251373,16.324719.766133,27.009083,7.366114-6.694156,7.134766-3.009264,25.976223-4.910746,38.672093-12.547782,2.635703-32.066154,1.623467-28.850612-9.821485c3.284288-13.791002-2.593513-35.613285,6.752275-36.216722Z" transform="translate(.000004-6.022694)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-gluteus-maximusl" d="M156.576466,163.178075c1.866999-4.251373,16.324719.766133,27.009083,7.366114-6.694156,7.134766-3.009264,25.976223-4.910746,38.672093-12.547782,2.635703-32.066154,1.623467-28.850612-9.821485c3.284288-13.791002-2.593513-35.613285,6.752275-36.216722Z" transform="matrix(-1 0 0 1 291.054593-6.022693)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-soleusr" d="M170.72905,252.50913c3.104574,8.047077,20.658745,3.930309,12.045394,27.854969-.348729.968637-3.205174,21.236187-6.775534,20.326601-1.23997-.315895.378414-18.222958-.752837-18.820927-5.244794-2.772347-13.840014-11.348085-9.786883-30.113483l5.26986.75284Z" transform="matrix(.525521 0 0 0.969833 81.015635 4.553915)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-soleusl" d="M170.72905,252.50913c3.104574,8.047077,20.658745,3.930309,12.045394,27.854969-.348729.968637-3.205174,21.236187-6.775534,20.326601-1.23997-.315895.378414-18.222958-.752837-18.820927-5.244794-2.772347-13.840014-11.348085-9.786883-30.113483l5.26986.75284Z" transform="matrix(-.525521 0 0 0.969833 212.032894 4.553915)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-gastrocnemiusl" d="M162.44784,258.53183v-3.76419c-3.98036,5.30714-7.473308,2.656156-10.539717,9.034045-6.87209,14.293405-1.809657,24.816095,9.786882,19.573764c11.252628-5.086863,4.928372-11.08394.752835-24.843619Z" transform="matrix(-.52552 0 0 0.969833 211.776388 4.674227)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-gastrocnemiusr" d="M162.44784,258.53183v-3.76419c-3.98036,5.30714-7.473308,2.656156-10.539717,9.034045-6.87209,14.293405-1.809657,24.816095,9.786882,19.573764c11.252628-5.086863,4.928372-11.08394.752835-24.843619Z" transform="matrix(.52552 0 0 0.969833 80.808475 3.611794)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-iliotibialr" d="M194.065768,167.438541c-.719057,7.744857.524351,21.566616-1.88642,31.619153-2.039528,8.504511-9.05911,14.610845-12.276856,27.102134l-2.835049-32.787726c-3.203148-19.409868,5.454723-32.09891,16.998325-25.933561Z" transform="translate(0 0.000003)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-iliotibiall" d="M194.065768,167.438541c-.719057,7.744857.524351,21.566616-1.88642,31.619153-2.039528,8.504511-9.05911,14.610845-12.276856,27.102134l-2.835049-32.787726c-3.203148-19.409868,5.454723-32.09891,16.998325-25.933561Z" transform="matrix(-1 0 0 1 289.295008-.727334)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-extemalr" d="M191.982626,124.63339c-1.384451,8.94385,2.512844,20.750325.035949,20.743592-3.334201-.510099-6.317283-.244504-8.212749-1.739577c3.337907-4.068565,1.559922-7.873028,2.223878-11.825499c1.246687-2.514873,4.835949-6.956645,5.952922-7.178516Z" transform="matrix(.602824 0.07089-.108206 0.920141 88.634723-3.128411)" fill="#glass" stroke="#3f5787" stroke-width="0.6"/><path id="back-body-u-extemall" d="M191.982626,124.63339c-2.417889,9.014257-.360248,21.827348-.751858,21.678548-3.400309-.878389-6.116323-1.283509-7.889859-2.099301c3.337907-4.068565,2.024839-8.44826,2.688795-12.400731c1.246687-2.514873,4.835949-6.956645,5.952922-7.178516Z" transform="matrix(-.62356 0.056399 0.074876 0.827838 208.043967 13.930972)" fill="#blue" stroke="#3f5787" stroke-width="0.6"/></g></svg>

""";
  }
}
