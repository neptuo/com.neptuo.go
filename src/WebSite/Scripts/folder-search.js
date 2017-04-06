﻿var isHistorySupported = 'history' in window;
var isNewStateRequired = true;
var folders = document.querySelectorAll('.folder[data-search]');

var searchBox = document.getElementById('search');
searchBox.addEventListener('keydown', function (e) {
    if (e.keyCode == 13)
        e.preventDefault();
});
searchBox.addEventListener('keyup', function (e) {
    var box = e.target;
    var value = box.value.toLowerCase();
    filterFolders(value, true);
});

if (isHistorySupported) {
    window.addEventListener('popstate', function (e) {
        var search = null;
        if (e.state != null) {
            search = e.state.q;
        }

        searchBox.value = search;
        filterFolders(search, true);
    });
}

function filterFolders(value, isHistoryUpdate) {
    if (value == null) {
        for (var i = 0; i < folders.length; i++) {
            var folder = folders[i];
            folder.style.display = 'block';
        }

        return;
    }

    for (var i = 0; i < folders.length; i++) {
        var folder = folders[i];

        var name = folder.dataset['search'];
        var index = name.indexOf(value);
        if (index > -1)
            folder.style.display = 'block';
        else
            folder.style.display = 'none';
    }

    if (value == '') {
        isNewStateRequired = true;
    }

    if (isHistoryUpdate && isHistorySupported) {
        var method = null;
        if (isNewStateRequired) {
            method = window.history.pushState;
            isNewStateRequired = false;
        }
        else {
            method = window.history.replaceState;
        }

        method.call(window.history, { q: value }, "Searching '" + value + "'", getSearchUrl(value));
    }
}

function getSearchUrl(value) {
    var origin = null;
    if ('origin' in window.location) {
        origin = window.location.origin;
    } else {
        origin = window.location.protocol + "//" + window.location.host;
    }

    var url = window.location.origin + window.location.pathname
    if (value != "") {
        url += "?q=" + encodeURIComponent(value);
    }

    return url;
}

var queryString = window.location.search;
if (queryString != '') {
    var params = queryString.substr(1, queryString.length - 1).split('&');
    for (var i = 0; i < params.length; i++) {
        var keyValue = params[i].split('=');
        if (keyValue[0] == 'q') {
            var value = keyValue[1];
            if (value != '') {
                searchBox.value = value;
                filterFolders(value, false);
            }
        }
    }
}