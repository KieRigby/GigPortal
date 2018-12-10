//= require instascan.min.js

//Initialize Instascan QR code scanner and hook it to the preview video element in the DOM
let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });

//Callback function for when a QR code has been scanned.
scanner.addListener('scan', function (content) {
  alert(content);
});


Instascan.Camera.getCameras().then(function (cameras) {
  if (cameras.length > 0) {
    scanner.start(cameras[0]);
  } else {
    console.error('No cameras found.');
  }
}).catch(function (e) {
  console.error(e);
});
