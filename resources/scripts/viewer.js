$(document).ready(function () {
/* Get the @id from h1 to automatically generate url:s to objectData and ImageDir */
    var shelfmark = $('h1').attr('id');
    $('#diva-wrapper').diva({                
        iipServerURL: "http://www.manuscripta.se/iipsrv/iipsrv.fcgi",
        objectData: "metadata/diva/" + shelfmark + ".json",
        imageDir: shelfmark,
//      If using IIIF omit iipServerURL and imageDir and comment out the following line
//      objectData: "iiif/" + shelfmark + "/manifest.json",
        viewerWidthPadding: 0,        
        enableAutoWidth: false,
        enableAutoHeight: false,
        fixedHeightGrid: true,
        enableFilename: false,
        minZoomLevel: 0,
        zoomLevel: 2,
        pagesPerRow: 2,
        maxPagesPerRow: 10,        
        verticallyOriented: true,
        inFullscreen: false,
        inGrid: false,
        enableLinkIcon: false,
        enableAutoTitle: false,
        enableDownload: true,
        blockMobileMove: false        
    });
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