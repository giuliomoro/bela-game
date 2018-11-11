var socket = io();

socket.on('connect', function() {
 console.log('connected');
});




let columns;
let rows;

let w = 20;
let avatarRatio = 4;

let board;

let fRate = 30; //starting FPS
let speed = 2;

let imageCoordinates = new Array(2);
let imageXpoints = new Array(2);
let imageDimmensions = new Array(2);

let imageY = 5;

let avatarMoving = false;
let baseline = 0;
let colors = {
  background: 255,
  grid: [131, 92, 58] //255, 100
}

var blocks = new Array();

function preload() {
  backgroundImage = loadImage("images/background.png");
  avatar = loadImage("images/avatar-color.png");
}

function setup() {

  createCanvas(windowWidth, windowHeight);
  frameRate(fRate);
  colorMode(RGB, 255);
  imageMode(CORNER);

  columns = floor(width / w);
  rows = floor(height / w);
  board = new Array(columns);
  for (let i = 0; i < columns; i++)
    board[i] = new Array(rows);

  imageDimmensions[0] = imageDimmensions[1] = avatarRatio * w;
  imageXpoints[0] = Math.round(columns / 5);
  imageXpoints[1] = Math.round(columns / 5) + avatarRatio;
  imageCoordinates[0] = 0 +  imageXpoints[0]* w;
  calcImgY(imageY);

  baseline = height - w*5;
  blocks = new Array();
  blocks.push(new Block(1, 5, Math.round(3 * columns / 4)));
  blocks[0]._draw();

  blocks.push(new Block());
  blocks[1].start(30);

}


socket.on('player1-xy', function(obj) {
    // imageY = Math.round(linScale(obj.data1, 150, 400, 0, rows-1));
    if(obj.data2 >= 0.5) {
      imageCoordinates[1] = linScale(obj.data1, 400, 150, 0, height-imageDimmensions[0])
    }

});

function overlap() {
  // Check if the avatar is on top of a block
  // Avatar never moves on the x-axis
  let blockX = new Array(2);
  blockX[0] = blocks.map(a => a.position);
  blockX[1] = blocks.map(a => a.position + a.width);
  blockHeight = blocks.map(a => a.position + a.height);
  let onBlock = null;
  for( let b=0; b<blocks.length; b++) {
    // if(imageXpoints[0] >= blockX[0][b] && imageXpoints[1] <= blockX[1][b]) {
    if(imageXpoints[0] >= blockX[0][b] && imageXpoints[0] <= blockX[1][b]) {
      onBlock = b;
      break;
    }
  }
  console.log(onBlock);
  if(onBlock === null) {
    baseline = height;
  } else {
    baseline = height - blockHeight[onBlock] * w;
  }
  if( onBlock === null && avatarMoving == false)
    setup();
}

function draw() {
  background(backgroundImage);
  printGrid(board);
  // image(avatar, 0, 0, avatarRatio*w, avatarRatio*w);
  // calcImgY(imageY);
  if(imageCoordinates[1] > baseline)
    imageCoordinates[1] = baseline;

  image(avatar, imageCoordinates[0], imageCoordinates[1], imageDimmensions[0], imageDimmensions[1]);

  for (let b = 0; b < blocks.length; b++) {
    // blocks[b].move(14);
  }
  overlap();
}

function calcImgY(newYpoint) {
  imageCoordinates[1] = height - (newYpoint+1) * w - imageDimmensions[1];
}

function keyPressed() {
  avatarMoving = false;
  if (keyCode === RIGHT_ARROW) {
    for (let b = 0; b < blocks.length; b++) {
      blocks[b].move(null, 1);
    }
  } else if (keyCode === UP_ARROW) {
    imageCoordinates[1] -= w;
    avatarMoving = true;
  } else if (keyCode === DOWN_ARROW) {
    imageCoordinates[1] += w;
    // setup();
  }
}

function printGrid(board) {
  for (let i = 0; i < board.length; i++) {
    for (let j = 0; j < board[0].length; j++) {
      if ((board[i][j] == 1)) {
        fill(colors.grid);
      } else {
        noFill();
      }
      noStroke();
      rect(i * w, j * w, w - 1, w - 1);
    }
  }
}

function Block(position, height, width) {
  this.height = height;
  this.width = width || 1;
  this.position = position || columns - 1;
  this.creation;
  this.tick = new Date().getTime();
}
Block.prototype.start = function(height) {
  this.height = height || this.height;
  this.creation = true;
}
Block.prototype.stop = function() {
  this.creation = false;
}
Block.prototype.draw = function() {
  for (let x = this.position; x < this.position + this.width; x++) {
    for (let y = rows - 1; y > rows - 1 - this.height; y--) {
      board[x][y] = 1;
    }
  }
}
Block.prototype._draw = function(oldX) {
  let xStart = max(this.position, 0);
  let xEnd = max(this.position + this.width, 0);

  for (let x = xStart; x < xEnd; x++) {
    for (let y = rows - 1; y > rows - 1 - this.height; y--) {
      board[x][y] = 1;
    }
  }

  if (this.creation !== true && oldX != null) {
    xStart = xEnd;
    xEnd = oldX[1];
    for (let x = xStart; x < xEnd; x++) {
      for (let y = rows - 1; y > rows - 1 - this.height; y--) {
        board[x][y] = 0;
      }
    }
  }
}

Block.prototype.move = function(speed, incr) {
  this.tock = new Date().getTime();

  let oldX = [this.position, this.position + this.width];

  let delta = this.tock - this.tick;
  let increment = incr || Math.round(calcSpeed(delta, 1, speed));
  if (this.creation == true) {
    this.width += increment;
    // COMMENT THIS!!
    if (this.width > 2)
      this.stop();
  }

  this.position = this.position - increment;
  if (oldX[1] > 0) {
    // this.draw(oldPosition);
    this._draw(oldX);
  } else {
    blocks.shift();
  }

  this.tick = this.tock;
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
    return (val - f0) * (t1 - t0) / (f1 - f0) + t0;
}
