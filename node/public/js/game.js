let columns;
let rows;

let w = 20;
let avatarRatio = 4;

let board;

let fRate = 30; //starting FPS
let speed = 2;

let imgCoordinates = new Array(2);
let imgXpoints = new Array(2);
let imgDimensions = new Array(2);
let imageY = 0;


var avatar;
var obstacles;

var obstacleWidth = w * 15;
var obstacleSpace = w * 20;
var nextObstacle = 0;

let nBlocks = 8;

let collision = false;

var socket = io();

socket.on('connect', function() {
 console.log('connected');
});


let colors = {
  background: 255,
  grid: [131, 92, 58] //255, 100
}

var blocks = new Array();
var blockHeights = [15, 17, 18, 20, 18, 15, 30, 12];

function preload() {
  backgroundImage = loadImage("images/background.png");
  avatarImg = loadImage("images/avatar-sword1.png");
}

function calcImgY(newYpoint) {
  imgCoordinates[1] = height - (newYpoint+1) * w - imgDimensions[1];
}

function setup() {

  createCanvas(windowWidth, windowHeight);
  frameRate(fRate);
  colorMode(RGB, 255);
  imageMode(CORNER);

  columns = floor(width / w);
  rows = floor(height / w);

  imgDimensions[0] = imgDimensions[1] = avatarRatio * w;
  imgXpoints[0] = Math.round(columns / 5);
  imgXpoints[1] = Math.round(columns / 5) + avatarRatio;
  imgCoordinates[0] = 0 +  imgXpoints[0]* w;
  imgCoordinates[1] = height - imgDimensions[1]/2;

  avatarImg.resize(imgDimensions[0], imgDimensions[1]);
  avatar = createSprite(imgCoordinates[0], imgCoordinates[1], imgDimensions[0], imgDimensions[1]);
  avatar.setCollider("rectangle", 0, 0, imgDimensions[0], imgDimensions[1]);

  avatar.addImage(avatarImg);

  obstacles = new Group();

  blocks = new Array();
  for(let b = 0; b < nBlocks; b++) {
    blocks.push(new Block(b, blockHeights[b]))
  }

}

socket.on('player1-xy', function(obj) {
    // imageY = Math.round(linScale(obj.data1, 150, 400, 0, rows-1));
    console.log(obj.data2);
    if(obj.data2 != -1) {
      // avatar.position.y = linScale(obj.data2, 1, 0, 0, height-imgDimensions[0])
    }

});

function draw() {
  background(backgroundImage);

  if(!avatar.overlap(obstacles)) {
    for (let b = 0; b < blocks.length; b++) {
      blocks[b].move(20);
    }
  }

  // }

   drawSprite(avatar);
   drawSprites(obstacles);

}

function Block(id, height) {
  this.id = id;
  this.height = height;
  this.position = this.calcPosition(this.id);
  this.obstacle;
  this.create();

  this.tick = new Date().getTime();
}
Block.prototype.calcPosition = function(i) {
  return width + (i+1) * obstacleWidth/2 + i * obstacleSpace;
}
Block.prototype.create = function() {
    this.obstacle = createSprite(this.position, height - (this.height/2), obstacleWidth, this.height * w)
    this.obstacle.setCollider("rectangle", 0, 0, obstacleWidth, this.height * w);
    this.obstacle.shapeColor = color(colors.grid);
    obstacles.add(this.obstacle);
}
Block.prototype.updateHeight = function(newHeight) {
  this.height = newHeight;
}
Block.prototype.move = function(incr) {
  // this.obstacle.velocity.x = (-incr)/10;
  this.obstacle.position.x = this.obstacle.position.x - incr;
  if(this.obstacle.position.x == width - obstacleWidth/2) {
    // console.log("Hello, I'm block "+this.id);
  } else if(this.obstacle.position.x <= -obstacleWidth/2) {
    // console.log("Bye! Says block "+this.id);
    this.obstacle.position.x = this.obstacle.position.x + (nBlocks-2) * obstacleWidth + (nBlocks-1.5) * obstacleSpace;
  }
}

// adapted from:
// http: + //codetheory.in/time-based-animations-in-html5-games-why-and-how-to-implement-them/
var calcSpeed = function(del, speed, FPS) {
  return (speed * del) * (FPS / 1000);
}

// convert a value from one scale to another
// e.g. scale(-96, -192, 0, 0, 100) to convert
// -96 from dB (-192 - 0) to percentage (0 - 100)
function linScale( val, f0, f1, t0, t1 ) {
    let retVal =  (val - f0) * (t1 - t0) / (f1 - f0) + t0;
    if(retVal < t0)
      retVal = t0;
    if(retVal > t1)
      retVal = t1;
}
