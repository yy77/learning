var http = require("http");
var options = {
	host: "www.csdn.net",
	port: 80
};

var req = http.request(options, function(res) {
	console.log('STATUS: ' + res.statusCode);
	//console.log('HEADERS: ' + JSON.stringify(res.headers));
	// print out header line by line
	var hds = res.headers
	for (var h in hds) {
		console.log(h + " : "+ hds[h]);
	}
	res.setEncoding('utf8');
//	res.on('data', function (chunk) {
//		console.log('BODY: ' + chunk);
//	});
});

req.on('error', function(e) {
  console.log('problem with request: ' + e.message);
});

// write data to request body
req.end();

console.log("Checking the web site http header information...");
