function Open(popupWin) {
    var window = document.getElementById(popupWin);
    window.control.Show();
}


function OnClientClose(radWindow) {
    var masterTable = $find("<%= gvReceivers.ClientID %>").get_masterTableView();
    masterTable.rebind();
    radWindow.remove_close(OnClientClose);
}
