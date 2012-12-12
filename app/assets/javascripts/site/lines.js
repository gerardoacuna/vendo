window.onload = function(){
	var canvas = document.getElementById('lines');
  var context = canvas.getContext('2d');

  // set line width for all lines
  var lineWidth = 15;
  var lineJoin = 'round';
  var startY = 10;

  // Orange Line
  orangeLine(context, '#ff7d00', lineWidth, lineJoin, canvas.width * 0.145, startY);
  magentaLine(context, '#e40090', lineWidth, lineJoin, canvas.width * 0.385, startY);
  blueLine(context, '#008cd2', lineWidth, lineJoin, canvas.width * 0.62, startY);
  greenLine(context, '#00af4d', lineWidth, lineJoin, canvas.width * 0.855, startY);

  // Magenta Line


};

function orangeLine(context, color, width, join, x, y) {

	context.save();
  context.strokeStyle = color;
  context.lineWidth = width;
  context.lineJoin = join;

	context.beginPath();
  context.moveTo(x, y);
  context.lineTo(x, y * 4.5);
  context.stroke();

  // Line
	context.beginPath();
  context.moveTo(x, y * 8.5);
  context.lineTo(x, y += 110);
  context.lineTo(x -= 145, y);
  context.lineTo(x, y + 70);
  context.lineTo(x += 600, y += 600);
  context.lineTo(x -= 600, y);
  context.lineTo(x, y += 130);
  context.lineTo(x += 70, y);
  context.lineTo(x, y += 100);

  context.stroke();
}

function magentaLine(context, color, width, join, x, y) {

	context.save();
  context.strokeStyle = color;
  context.lineWidth = width;
  context.lineJoin = join;

  // Starting Line
	context.beginPath();
  context.moveTo(x, y);
  context.lineTo(x, y * 4.5);
  context.stroke();

	// Line
	context.beginPath();
  context.moveTo(x, y * 8.5);
  context.lineTo(x, y += 130);
  context.lineTo(x -= 380, y);
  context.lineTo(x, y += 400);
  context.lineTo(x += 1000, y);
  context.lineTo(x, y += 370);

  context.stroke();
}

function blueLine(context, color, width, join, x, y) {

	context.save();
  context.strokeStyle = color;
  context.lineWidth = width;
  context.lineJoin = join;

  // Starting Line
	context.beginPath();
  context.moveTo(x, y);
  context.lineTo(x, y * 4.5);
  context.stroke();

	// Line
	context.beginPath();
  context.moveTo(x, y * 8.5);
  context.lineTo(x, y += 130);
  context.lineTo(x += 370, y);
  context.lineTo(x, y += 200);
  context.lineTo(x -= 1000, y += 350);
  context.lineTo(x, y += 350);

  context.stroke();
}

function greenLine(context, color, width, join, x, y) {

	context.save();
  context.strokeStyle = color;
  context.lineWidth = width;
  context.lineJoin = join;

  // Starting Line
	context.beginPath();
  context.moveTo(x, y);
  context.lineTo(x, y * 4.5);
  context.stroke();

	// Line
	context.beginPath();
  context.moveTo(x, y * 8.5);
  context.lineTo(x, y += 110);
  context.lineTo(x += 140, y);
  context.lineTo(x, y += 630);

  context.stroke();
}






