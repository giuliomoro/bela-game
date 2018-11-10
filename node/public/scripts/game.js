var socket = io();
var blockInfo = {name: 'Default', blockCount: 8, blocks: [{id:19}, {id:23}, {id:27}, {id:31}, {id:49}, {id:53}, {id:57}, {id:61} ]};

/*
*  Socket Events -------------------------------------
*/

socket.on('connect', function() {
 console.log('connected');
});

socket.on('player1-xy', function(obj) {
    console.log(JSON.stringify(obj));
});

socket.on('player2-note', function(obj) {
    console.log(JSON.stringify(obj));
    let channel = obj.data1;
    let value = obj.data2;
    let scaled =  scale(value, 0, 127, 0, 300);
    //$(`#fader_${channel}`).css({ top: '100px' }
    // var note = obj.note;
    // var velocity = obj.velocity;
    // $("#note").val(note);
    // $("#velocity").val(velocity);
});

socket.on('player2-note-direct', function(data) {
    console.log(JSON.stringify(data));
});


socket.on('player2-control', function(obj) {
    console.log(JSON.stringify(obj));
    // var note = obj.note;
    // var velocity = obj.velocity;
    // $("#note").val(note);
    // $("#velocity").val(velocity);
});

socket.on('player2-control-direct', function(data) {
    console.log(JSON.stringify(data));
});

function loadGUI() {
    var html = Handlebars.compile(document.getElementById('template').innerText)(blockInfo);
    var blockCount = blockInfo.blockCount;

    document.getElementById('blocks').innerHTML = html;
    initDraggables();
}

function initDraggables() {
    var draggableFaderElems = document.querySelectorAll('.draggable-fader');
    for ( var i=0; i < draggableFaderElems.length; i++ ) {
        var draggableFaderElem = draggableFaderElems[i];
        var draggie = Draggable.create("#fader_" + i, {
            type: 'y',
            bounds: '.meter',
            onDrag:function() {
                console.log(this.y);
                // var level = scale(this.y, -50, 250, 12, -60);
                // var trackNo = Number(this._eventTarget.id.split('_')[1]);
                // var obj = {track:trackNo, key:"fader", value:level};
                // trackInfo[trackNo] = trackInfo[trackNo] || {settings:{}};
                // trackInfo[trackNo].settings["fader"] = level;
                // socket.emit('track-info', obj);
            }
        })[0];
    }

}

// convert a value from one scale to another
// e.g. scale(-96, -192, 0, 0, 100) to convert
// -96 from dB (-192 - 0) to percentage (0 - 100)
function scale( val, f0, f1, t0, t1 ) {
    return (val - f0) * (t1 - t0) / (f1 - f0) + t0;
}


loadGUI();


