function(doc) {
    if (doc.v706["0"]["_"] === "t"){
        if (doc.v50["0"]["_"] === "C")
            if (! doc.v51["0"]["d"])
            emit([doc.v980["0"]["_"],doc.v706[0]["_"]], 1);
    }else{
        emit([doc.v980["0"]["_"],doc.v706[0]["_"]], 1);
    }
}