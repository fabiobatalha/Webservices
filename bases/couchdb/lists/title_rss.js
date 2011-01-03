function(head, req) {
    // !json templates.titles_rss
    // !code _attachments/js/collections_list.js

    var Mustache = require('vendor/couchapp/lib/mustache');
    var register = null;
    var body = null;
    start({
        "headers": {
            "Content-Type": "text/xml"
        }
    });    
    
    var post = new Array();
    while (row = getRow()) {
      row.value["collection_info"] = collections_list[row.value["collection"]];
      post.push(row.value);
    }


    registers = {"rows" : post };
    return Mustache.to_html(templates.titles_rss,registers);

}