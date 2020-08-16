// ml5.js: Pose Classification
// The Coding Train / Daniel Shiffman
// https://thecodingtrain.com/Courses/ml5-beginners-guide/7.2-pose-classification.html
// https://youtu.be/FYgYyq-xqAw

// All code: https://editor.p5js.org/codingtrain/sketches/JoZl-QRPK

// Separated into three sketches
// 1: Data Collection: https://editor.p5js.org/codingtrain/sketches/kTM0Gm-1q
// 2: Model Training: https://editor.p5js.org/codingtrain/sketches/-Ywq20rM9
// 3: Model Deployment: https://editor.p5js.org/codingtrain/sketches/c5sDNr8eM

let video;
let poseNet;
let pose;
let skeleton;
let my = "";
let button;
let brain;
let poseLabel;
let lab = [];
let state = 'waiting';
let targetLabel;
let texts;
let add;

function setup() {
  createCanvas(640, 480);
  video = createCapture(VIDEO);
  video.hide();
  // button = createButton("Sukhasna")
  // button.mousePressed(Sukhasna)
  // button = createButton("Virabhadrasana II")
  // button.mousePressed(Virabhadrasana_II)
  // button = createButton("Kursiasana")
  // button.mousePressed(Kursiasana)
  // button = createButton("Trikonasana")
  // button.mousePressed(Trikonasana)
  // button = createButton("Virabhadrasana I")
  // button.mousePressed(Virabhadrasana_I)
  // button = createButton("Chaturanga")
  // button.mousePressed(Chaturanga)
  // button = createButton("Vrikshasana")
  // button.mousePressed(Vrikshasana)
  // button = createButton("Tadasana")
  // button.mousePressed(Tadasana)


  poseNet = ml5.poseNet(video, modelLoaded);
  poseNet.on('pose', gotPoses);

  let options = {
    inputs: 34,
    outputs: 10,
    task: 'classification',
    debug: true
  }
  brain = ml5.neuralNetwork(options);

  // // LOAD PRETRAINED MODEL
  const modelInfo = {
    model: 'model.json',
    metadata: 'model_meta.json',
    weights: 'model.weights.bin',
  };
  brain.load(modelInfo, brainLoaded);
  mer()
}
function mer() {
  const can = document.getElementById("defaultCanvas0")
  add = document.getElementById("add")
  add.appendChild(can)
}

function brainLoaded() {
  console.log('pose classification ready!');
  classifyPose();
}


function classifyPose() {
  if (pose) {
    // console.log(pose)
    let inputs = [];
    for (let i = 0; i < pose.keypoints.length; i++) {
      let x = pose.keypoints[i].position.x;
      let y = pose.keypoints[i].position.y;
      inputs.push(x);
      inputs.push(y);
    }
    brain.classify(inputs, gotResult);
  } else {
    setTimeout(classifyPose, 100);
  }
}
// let im;
// function preload() {
//   im = createImg("pose1.gif");
// }
const im = document.createElement('img')
let i = 1
function details(imgloc, txtloc) {

  var usertime = prompt("set Timer in seconds")
  if (usertime < 10) { usertime = 10 }
  var timer = setInterval(() => {
    // console.log(i)
    document.getElementById("count").innerHTML = i;
    if (i == usertime) {

      clearInterval(timer);
      my = ""
      i = 0
      console.log("next")
    }
    i++
  }, 1000);
  im.src = imgloc;

  var el = document.getElementById("text")
  add.appendChild(im)
  loadStrings(txtloc, (data) => {
    texts = join(data, " ")
    el.innerHTML = texts;
  })
}
function Garlan_Pose() {
  my = "Garlan Pose"
  var imgloc = "../gif/Garlan_Pose.gif"
  var textloc = "../Text/Garlan_Pose.txt"
  details(imgloc, textloc)
}

function Low_Lunge() {
  my = "Low Lunge"
  var imgloc = "../gif/Low_Lunge.gif";
  var textloc = "../Text/Low_Lunge.txt"
  details(imgloc, textloc)
}
function Mountain() {
  my = "Mountain"
  var imgloc = "../gif/Mountain.jpeg";
  var textloc = "../Text/Mountain.txt"
  details(imgloc, textloc)
}
function Raised_Arm_Pose() {
  my = "Raised Arm Pose"
  var imgloc = "../gif/Raised_Arm_Pose.gif";
  var textloc = "../Text/Raised_Arm_Pose.txt"
  details(imgloc, textloc)
}
function Standing_Forward_Bend() {
  my = "Standing Forward Bend"
  var imgloc = "../gif/Standing_Forward_Bend.gif";
  var textloc = "../Text/Standing_Forward_Bend.txt"
  details(imgloc, textloc)
}
function Straight_Leg_Lunge() {
  my = "Straight Leg Lunge"
  var imgloc = "../gif/Straight_Leg_Lunge.gif";
  var textloc = "../Text/Straight_Leg_Lunge.txt"
  details(imgloc, textloc)
}
function Easy_Pose() {
  my = "Easy Pose"
  var imgloc = "../gif/Easy_Pose.gif";
  var textloc = "../Text/Easy_Pose.txt"
  details(imgloc, textloc)
}
function Triangle_Pose() {
  my = "Triangle Pose"
  var imgloc = "../gif/Triangle_Pose.gif";
  var textloc = "../Text/Triangle_Pose.txt"
  details(imgloc, textloc)
}
function Warrior_1() {
  my = "Warrior 1"
  var imgloc = "../gif/Warrior_1.gif";
  var textloc = "../Text/Warrior_1.txt"
  details(imgloc, textloc)
}
function Warrior_2() {
  my = "Warrior 2"
  var imgloc = "../gif/Warrior_2.gif";
  var textloc = "../Text/Warrior_2.txt"
  details(imgloc, textloc)
}

function gotResult(error, results) {
  // console.log(my)
  if (results[0].confidence > 0.75 && results[0].label == my) {
    poseLabel = results[0].label.toUpperCase();
    console.log(poseLabel)
  }
  else if (my == "") { poseLabel = "Click When Ready"; }
  else { poseLabel = "Wrong pose"; }
  classifyPose();
}


function gotPoses(poses) {
  // console.log(poses); 
  if (poses.length > 0) {
    pose = poses[0].pose;
    skeleton = poses[0].skeleton;
  }
}


function modelLoaded() {
  console.log('poseNet ready');
}

function draw() {
  push();
  translate(video.width, 0);
  scale(-1, 1);
  image(video, 0, 0, video.width, video.height);

  if (pose) {
    for (let i = 0; i < skeleton.length; i++) {
      let a = skeleton[i][0];
      let b = skeleton[i][1];
      strokeWeight(2);
      stroke(0);

      line(a.position.x, a.position.y, b.position.x, b.position.y);
    }
    for (let i = 0; i < pose.keypoints.length; i++) {
      let x = pose.keypoints[i].position.x;
      let y = pose.keypoints[i].position.y;
      fill(0);
      stroke(255);
      ellipse(x, y, 16, 16);
    }
  }
  pop();

  // fill(255, 0, 255);
  // noStroke();
  // textSize(52);
  // textAlign(TOP,CENTER);
  // fill(255, 23, 34);
  document.getElementById("label").innerHTML = poseLabel
  // text(poseLabel, width / 3, height / 6);
}