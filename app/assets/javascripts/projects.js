$(document).on('ready', function() {
  $('#search-form').on('submit', function(e) {
    e.preventDefault();
    var searchValue = $('#search').val();

    // The most basic request!
    $.ajax({
      url: '/projects?search=' + searchValue,
      dataType: 'html',
      method: 'GET',
      success: function(data) {
        $('#projects').html(data);
      }
    });
  });

  var nextPageUrl;

  $(window).on('scroll', function(e) {
    var $window = $(window);
    var bottomOfWindow = $window.scrollTop() + $window.height();
    var distanceFromBottom = $(document).height() - bottomOfWindow;
    var proposedNextPageUrl = $('.page > a[rel=next]').attr('href');

    // console.log(distanceFromBottom);

    if ( distanceFromBottom <= 100 && (nextPageUrl !== proposedNextPageUrl) ) {
      nextPageUrl = proposedNextPageUrl;

      console.log("near the bottom!");
w
      $.ajax({
        url: nextPageUrl,
        crossDomain: false
        type: 'GET',
        dataType: 'script'
        // success: function(result) {
        //   $('#projects').append(result);
        // }
      })
    }
  });














});
