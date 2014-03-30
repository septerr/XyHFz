$(function () {
    //todo does this js cause error on index, since there is no video-container there
    //campaigns#show
    var $videoContainers = $(".video-container");
    $videoContainers.each(
        function () {
            var $videoContainer = $(this);
            var $video = $($videoContainer.find("iframe, object, embed")[0]);
            $video.attr('data-aspectRatio', $video.height() / $video.width()).removeAttr('height').removeAttr('width'); // jQuery .data does not work on object/embed elements
        }
    );
    $(window).resize(function () {
        $videoContainers.each(
            function () {
                var $videoContainer = $(this);
                var newWidth = $videoContainer.width();
                var $video = $($videoContainer.find("iframe, object, embed")[0]);
                $video.width(newWidth).height(newWidth * $video.attr('data-aspectRatio'));
            }
        );
    }).resize();
});