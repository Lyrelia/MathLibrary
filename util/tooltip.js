$(function() {
  $('area').tooltip({
    track: true,
    content: function () {
      return $('#'+this.getAttribute('graphkey')+'_tip').html()
        <!-- return $(this).attr('href') -->
        <!-- return "tooltip"; -->
    }
  });
});
