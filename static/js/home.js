function jumpToLink(endpoint) {
    const url = "http://127.0.0.1:5000"+endpoint;
    window.open(url, "_self");
}

function search(url){
    const name = document.getElementById("srch").value 
    if (name === ""){
        return ""
    }
    jumpToLink(url+name)
}