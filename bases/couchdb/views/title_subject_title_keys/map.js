function(doc) {
  if (doc.v706[0]["_"] == 't'){
     subjects = new Array();

     for (i in doc.v441){
         subjects.push(doc.v440[i]["_"]);
     }

     for (i in doc.v441){
        emit([doc.v441[0]["_"],doc.v100[0]["_"]], {"collection":doc.v980["0"]["_"], "issn":doc.v400[0]["_"], "title": doc.v100[0]["_"], "subject": subjects, "publisher": doc.v480[0], "insert_date":doc.v942[0]["_"]});
     }
  }
}