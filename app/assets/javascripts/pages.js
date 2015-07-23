$(document).on("ready page:load", function(){
  $('.my_button').click(function() {
    userInput = ($(this).attr("value"));
    console.log(userInput);
      if (userInput == "Business"){
        alert("Business");
      } else if (userInput == "Education") {
        alert("Education");
      } else if (userInput == "Recreation") {
        alert("Recreation");
      } else if (userInput == "Charity") {
        alert("Charity");
      }
  })
})

