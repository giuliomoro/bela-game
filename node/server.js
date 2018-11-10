const dgram = require('dgram');
const osc = require('osc-min');
const express = require('express');
const http = require('http');
const path = require('path');
const app = express();
const server = http.createServer(app);
const io = require('socket.io').listen(server);
const exec = require('child_process').exec;
const fs = require('fs');
app.use(express.static(path.join(__dirname, 'public')));

// Default IPs and ports for OSC Bridge
let localIp = '0.0.0.0';
let localPort = 7563;
let remoteIp = '127.0.0.1';
let remotePort = 7562;

let args = process.argv;
if(args.length > 2){
    if(args[2] == 'help'){
        console.log([
        "Usage: ",
        "`node server.js <remoteIp> <remotePort> <localIp> <localPort>`",
        "All parameters are optional, defaults to:",
        "`node osc "+remoteIp+" "+remotePort+" "+localIp+" "+localPort+$
        ].join("\n"));
        return;
    }
}

const socket = dgram.createSocket('udp4');
let web_ui_socket;
socket.bind(localPort, localIp);

socket.on('message', (message, info) => {
    console.log('message');
    const msg = osc.fromBuffer(message);
    if (msg.oscType === 'message'){
        parseMessage(msg);
    } else if (msg.elements){
        for (let element of msg.elements){
            parseMessage(element);
        }
    }
});

function parseMessage(msg){
    const address = msg.address.split('/');
    if (!address || !address.length || address.length <2){
        console.log('bad OSC address', address);
        return;
    }
    // setup handshake
    if (address[1] === 'osc-setup'){
        sendHandshakeReply();
    } else if (address[1] === 'osc-acknowledge'){
        if(msg.args[0].type != 'integer'){
            console.log("Unexpected type for argument 0: " + msg.args[0].type);
            return;
        }
        var receivedCount = msg.args[0].value;
        console.timeEnd(baseTimeString + receivedCount);
    } else if (address[1] === 'osc-player2-note'){
        if(msg.args[0].type != 'string'){
            console.log("Unexpected type for argument 0: " + msg.args[0].type);
            return;
        }
        console.log(JSON.stringify(msg));
        if (web_ui_socket) {
            let data = msg.args[0].value.split(',');
		    web_ui_socket.emit('player2-note', {note: data[0], velocity: data[1], on: data[2]});
	    }
    }  else if (address[1] === 'osc-player2-control'){
        if(msg.args[0].type != 'string'){
            console.log("Unexpected type for argument 0: " + msg.args[0].type);
            return;
        }
        console.log(JSON.stringify(msg));
        if (web_ui_socket) {
            let data = msg.args[0].value.split(',');
            web_ui_socket.emit('player2-control', {data1: data[0], data2: data[1]});
        }
    }  else if (address[1] === 'osc-player1-xy'){
        if(msg.args[0].type != 'string'){
            console.log("Unexpected type for argument 0: " + msg.args[0].type);
            return;
        }
        console.log(JSON.stringify(msg));
        if (web_ui_socket) {
            let data = msg.args[0].value.split(',');
            web_ui_socket.emit('player1-xy', {data1: data[0], data2: data[1]});
        }
    }
}

function sendOscInfo(message){
    // console.log(`${track} ${key} ${value}`);
    const buffer = osc.toBuffer({
   		address : '/osc-info',
        args    : [
	        {type: 'string', value: message}
        ]
    });
    socket.send(buffer, 0, buffer.length, remotePort, remoteIp, function(err) {
        // console.time(baseTimeString + count);
        if (err) console.log(err);
    });
}

function sendHandshakeReply(){
    var buffer = osc.toBuffer({ address : '/osc-setup-reply' });
    socket.send(buffer, 0, buffer.length, remotePort, remoteIp, function(err) {
        if (err) console.log(err);
    });
}

io.on('connection', function(http_socket){
    web_ui_socket = http_socket;
    console.log('a user connected');

    http_socket.on("info", function (obj) {
        // console.log(JSON.stringify(obj));
        sendOscInfo(obj.info);
    });


    http_socket.on('disconnect', function(){
        console.log('user disconnected');
    });
});


server.listen(process.env.PORT || 3001);
console.log(`Bela OSC Bridge Server running on port ${process.env.PORT || 3001}...`);
