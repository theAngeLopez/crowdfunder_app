$(document).on("ready page:load", function(){

    $('#Business').hide();
    $('#Education').hide();
    $('#Recreation').hide();
    $('#Charity').hide();


  $('.my_button').click(function() {
    userInput = ($(this).attr("value"));
    console.log(userInput);
      if (userInput == "Business"){
        $('#Business').show();
        $('#Education').hide();
        $('#Recreation').hide();
        $('#Charity').hide();
      } else if (userInput == "Education") {
        $('#Business').hide();
        $('#Education').show();
        $('#Recreation').hide();
        $('#Charity').hide();
      } else if (userInput == "Recreation") {
        $('#Business').hide();
        $('#Education').hide();
        $('#Recreation').show();
        $('#Charity').hide();
      } else if (userInput == "Charity") {
        $('#Business').hide();
        $('#Education').hide();
        $('#Recreation').hide();
        $('#Charity').show();
      }
  })
})

