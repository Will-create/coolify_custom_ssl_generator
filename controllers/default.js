exports.install = function() {
    ROUTE('GET /', index);

    // Post request to generate ssl /generate
    ROUTE('POST /generate', generate);
    
}

function index($) {
    $.view('index');
}

async function generate($) {
    var data = $.body;
    var domain = data.domain;

    // what if domain is empty
    if (domain == '') {
        $.invalid('Domain is empty');
        return;
    }



    // Call synchronous FUNC.generate_ssl( domaine ) function to generate SSL certificate
    var result = await FUNC.generate_ssl(domain);
    if (result == 0) {
        $.invalid('Error generating SSL certificate');
        return;
    } else {
        $.success('SSL certificate generated successfully');
        return;
    }
}