function(doc) {
// !code _attachments/js/includes.js

  if (doc.v706[0]["_"] == 't'){
     for (i in doc.v441){
         emit([doc.v441[i]["_"],hex_md5(doc.v441[i]["_"])],1);
     }
  }
}