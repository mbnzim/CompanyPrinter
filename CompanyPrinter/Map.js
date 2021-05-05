function loadMapScenario() {
    var map;
    map = Microsoft.Maps.Map('#myMap', {});
    Microsoft.Maps.loadModule('Microsoft.Maps.AutoSuggest', {
        callback: onLoad,
        errorCallback: onError
    });
    function onLoad() {
        var options = { maxResults: 5 };
        var manager = new Microsoft.Maps.AutosuggestManager(options);
        manager.attachAutosuggest('#txtaddress', '#searchBoxContainer', selectedSuggestion);
    }
    function onError(message) {
        document.getElementById('printoutPanel').innerHTML = message;
    }
    function selectedSuggestion(suggestionResult) {
        //document.getElementById('printoutPanel').innerHTML =
        //    'Suggestion: ' + suggestionResult.formattedSuggestion;
        //'<br> Lat: ' + suggestionResult.location.latitude +
        //'<br> Lon: ' + suggestionResult.location.longitude;
        map.entities.clear();
        //var push = new Microsoft.Maps.Pushpin(suggestionResult.location);
        //map.entities.push(push);
        map.setView({ bounds: suggestionResult.bestView });
    }
}