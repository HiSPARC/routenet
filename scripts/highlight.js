// Auteur: N.G. Schultheiss
// This script controls the css classes: '.vervolg#' to highlight cells.

// Add hover event handlers to all non-empty cells
$(document).ready(function () {
    $('#routenet td').not('.empty').hover(
        function() {select($(this));},
        function() {deselect();}
    );
});

function getRelated(source) {
    return $(source.data("next"));
}

function select(source) {
    var level1 = getRelated(source);
    var level2 = $();
    var level3 = $();
    var level4 = $();

    level1.each(function() {
        level2 = level2.add(getRelated($(this)));
    })

    level2.each(function() {
        level3 = level3.add(getRelated($(this)));
    })

    level3.each(function() {
        level4 = level4.add(getRelated($(this)));
    })

    source.addClass('vervolg0');
    level1.addClass('vervolg1');
    level2.addClass('vervolg2');
    level3.addClass('vervolg3');
    level4.addClass('vervolg4');
}


// Met deze functie zijn de klassen weer op 'nietGekozen' te zetten.
function deselect() {
    $('#routenet td').removeClass('vervolg0 vervolg1 vervolg2 vervolg3 vervolg4');
}
