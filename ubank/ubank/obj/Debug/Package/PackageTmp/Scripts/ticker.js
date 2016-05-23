function startTicker(id, numberToShow, duration) {
    $(id).attr('numberToShow', numberToShow);
    $(id + ' li').slice(numberToShow).hide();

    setInterval('rotateTicker("' + id + '")', duration);
}

function rotateTicker(id) {
    var numberToShow = parseInt($(id).attr('numberToShow'));

    var firstItem = $(id + ' li:first');
    var firstItemMarkup = firstItem.html();

    firstItem.fadeOut(999, function() {
        $(this).remove();

        $(id).append('<li style="display:none">' + firstItemMarkup + '</li>');
        $(id + ' li').slice(0, numberToShow).show();
        $(id + ' li').slice(numberToShow).hide();
    });
}