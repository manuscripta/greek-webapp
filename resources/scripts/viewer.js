$(document).ready(function () {
    /* Get the @id from h1 to automatically generate url:s to objectData and ImageDir */
    var xml_id = $('h1').attr('id');
    var ms_id = xml_id.match(/\d+/g);  
    
    var digitized = $('h1').attr('class');
    if (digitized == "digitized" || digitized == "digitized_partly") {
        $('#diva-wrapper').diva({
            iipServerURL: "https://iiif-dev.manuscripta.se/iipsrv/iipsrv.fcgi",
            objectData: "../iiif/" + ms_id + "/manifest.json",
            isIIIF: true,
            imageDir: ms_id,
            viewerWidthPadding: 0,
            enableAutoWidth: true,
            enableAutoHeight: false,            
            fixedHeightGrid: true,            
            enableFilename: false,
            minZoomLevel: 0,
            zoomLevel: 2,
            pagesPerRow: 5,
            maxPagesPerRow: 10,
            verticallyOriented: true,
            inFullscreen: false,
            inGrid: false,
            inBookLayout: false,
            enableLinkIcon: false,
            enableAutoTitle: false,
            enableDownload: true,
            blockMobileMove: false
        });
    }
});

//Initial load of page
$(document).ready(sizeContent);

//Every resize of window
$(window).resize(sizeContent);

//Dynamically assign height
function sizeContent() {
    var newHeightRight = $("html").height() - 107;
    $(".diva-outer").css("height", newHeightRight);
    var newHeightLeft = $("html").height() - 50;
    $(".col-lg-6").css("height", newHeightLeft);
}

// Generate links for images
var facs = document.getElementsByClassName("facsimile");
var facsimile = function () {
var index = $(this).attr("data-diva-index");
    $('#diva-wrapper').data('diva').gotoPageByIndex(index);
}
for (var i = 0; i < facs.length; i++) {
    facs[i].addEventListener("click", facsimile);
}

// split.js
Split(['#ms-desc', '#diva-wrapper'], {
                sizes: [50, 50],
                minSize: 10
});
