var states, cities, options, country, option;
jQuery(function() {
  //var states, cities;
  $('#user_state_id').parent().hide();
  states = $('#user_state_id').html();
  $('#user_city_id').parent().hide();
  cities = $('#user_city_id').html();
  console.log(states);
  return $('#user_country_id').change(function() {
    //var country, options;
    country = $('#user_country_id :selected').text();
    options = $(states).filter("optgroup[label=" + country + "]").html();
    console.log(options);
    if (options) {
      $('#user_state_id').html(options);
      return $('#user_state_id').parent().show();
    } else {
      $('#user_state_id').empty();
      return $('#user_state_id').parent().hide();
    }
  });

  console.log(cities);
  return $('#user_state_id').change(function(){
    state1 = $('#user_state_id :selected').text();
    option = $(cities).filter("optgroup[label=" + state1 + "]").html();
    console.log(option);
    if(option){
     $('#user_city_id').html(option);
      return $('#user_city_id').parent().show();   
    } else {
      $('#user_city_id').empty();
      return $('#user_city_id').parent().hide();  
    }
  });
});