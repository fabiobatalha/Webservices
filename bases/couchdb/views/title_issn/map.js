function(doc) {
  if (doc.v706[0]["_"] == 't'){
     subjects = new Array();

     for (i in doc.v441){
         subjects.push(doc.v441[i]["_"]);
     }

     emit(doc.v400[0]["_"], null);
  }
}