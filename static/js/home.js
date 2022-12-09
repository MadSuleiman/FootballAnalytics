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

function having(url){
    const stat = document.getElementById("stat").value
    const comparison = document.getElementById("comparison").value
    const integ = document.getElementById("having").value 
    const haver = stat+comparison+integ
    jumpToLink(url+haver)
}