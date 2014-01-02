function getY(oElement) {
    var iReturnValue = 0;
    while (oElement != null) {
        iReturnValue += oElement.offsetTop;
        oElement = oElement.offsetParent;
    }
    return iReturnValue;
}

function getX(oElement) {
    var iReturnValue = 0;
    while (oElement != null) {
        iReturnValue += oElement.offsetLeft;
        oElement = oElement.offsetParent;
    }
    return iReturnValue;
}