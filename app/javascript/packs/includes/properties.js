$(function(){
    // 18.00 P2    

    $("#show-tel").on("click", function(){
        var $this = $(this);
        $this.find("span").text( $this.data("telephone") );
    });

    $("#toggleDetails").on("click", function(){
        var details = $("#prop-details");
        details.toggleClass("open");
        if(details.hasClass("open")) {
            $(this).text("Show Less");
        } else {
            $(this).text("Show More");
        }
    });
});