function(head, req) {
    // !json templates.indicators
    // !code _attachments/js/collections_list.js

    var chart1; // globally available
    var Mustache = require('vendor/couchapp/lib/mustache');
    var register = null;
    var body = null;
    start({
        "headers": {
            "Content-Type": "text/html"
        }
    });    

    var post = new Array();
    while (row = getRow()) {
      //row.value["collection_info"] = collections_list[row.key[0]];
      //row.value["type"] = collections_list[row.key[1]];
      post.push(row);
    }


    registers = {"rows" : post };
    return Mustache.to_html(templates.indicators,registers);

}