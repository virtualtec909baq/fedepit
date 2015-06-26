$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( ".slider-range" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#skull_width" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_skull_width_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_skull_width_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#skull_width" ).val( "" + $( ".slider-range" ).slider( "values", 0 ) +
    " - " + $( ".slider-range" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_skull_high" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#skull_high" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_skull_high_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_skull_high_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#skull_high" ).val( "" + $( "#feature_skull_high" ).slider( "values", 0 ) +
    " - " + $( "#feature_skull_high" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_skull_diameter" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#skull_diameter" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_skull_diameter_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_skull_diameter_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#skull_diameter" ).val( "" + $( "#feature_skull_diameter" ).slider( "values", 0 ) +
    " - " + $( "#feature_skull_diameter" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_head_length" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#head_length" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_head_length_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_head_length_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#head_length" ).val( "" + $( "#feature_head_length" ).slider( "values", 0 ) +
    " - " + $( "#feature_head_length" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_skull_length" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#skull_length" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_skull_length_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_skull_length_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#skull_length" ).val( "" + $( "#feature_skull_length" ).slider( "values", 0 ) +
    " - " + $( "#feature_skull_length" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_skull_percentage" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#skull_percentage" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_skull_percentage_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_skull_percentage_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#skull_percentage" ).val( "" + $( "#feature_skull_percentage" ).slider( "values", 0 ) +
    " - " + $( "#feature_skull_percentage" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_muzzle_high_skull" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#muzzle_high_skull" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_muzzle_high_skull_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_muzzle_high_skull_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#muzzle_high_skull" ).val( "" + $( "#feature_muzzle_high_skull" ).slider( "values", 0 ) +
    " - " + $( "#feature_muzzle_high_skull" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_muscular_general" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#muscular_general" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_muscular_general_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_muscular_general_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#muscular_general" ).val( "" + $( "#feature_muscular_general" ).slider( "values", 0 ) +
    " - " + $( "#feature_muscular_general" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_muscular_masetero" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#muscular_masetero" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_muscular_masetero_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_muscular_masetero_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#muscular_masetero" ).val( "" + $( "#feature_muscular_masetero" ).slider( "values", 0 ) +
    " - " + $( "#feature_muscular_masetero" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_muscle_parietale" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#muscle_parietale" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_muscle_parietale_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_muscle_parietale_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#muscle_parietale" ).val( "" + $( "#feature_muscle_parietale" ).slider( "values", 0 ) +
    " - " + $( "#feature_muscle_parietale" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_body_long" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#body_long" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_body_long_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_body_long_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#body_long" ).val( "" + $( "#feature_body_long" ).slider( "values", 0 ) +
    " - " + $( "#feature_body_long" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_body_raised" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#body_raised" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_body_raised_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_body_raised_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#body_raised" ).val( "" + $( "#feature_body_raised" ).slider( "values", 0 ) +
    " - " + $( "#feature_body_raised" ).slider( "values", 1 ) );
});

$(function() {
  var minimo =  parseInt($("#skull").attr("data-skullgt"));
  var maximo = parseInt($("#skull").attr("data-skulllt"));
  $( "#feature_diamter_thorax" ).slider({
    range: true,
    min: minimo,
    max: maximo,
    slide: function( event, ui ) {
      $( "#diamter_thorax" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      $( "#q_feature_diamter_thorax_gt" ).val( ui.values[ 0 ] );
      $( "#q_feature_diamter_thorax_lt" ).val( ui.values[ 1 ] );
    }
  });
  $( "#diamter_thorax" ).val( "" + $( "#feature_diamter_thorax" ).slider( "values", 0 ) +
    " - " + $( "#feature_diamter_thorax" ).slider( "values", 1 ) );
});

$(function(){
  $('#bite_pin_true').click(function() {
    if(document.getElementById('bite_pin_true').checked) {
      $('#q_feature_bite_pin_true').val("1");
    }else{
      $('#q_feature_bite_pin_true').val("");
    }
  });
});

$(function(){
  $('#bite_crusade_inside').click(function() {
    if(document.getElementById('bite_crusade_inside').checked) {
      $('#q_feature_bite_crusade_inside_true').val("1");
    }else{
      $('#q_feature_bite_crusade_inside_true').val("");
    }
  });
});

$(function(){
  $('#bite_prognato').click(function() {
    if(document.getElementById('bite_prognato').checked) {
      $('#q_feature_bite_prognato_true').val("1");
    }else{
      $('#q_feature_bite_prognato_true').val("");
    }
  });
});

$(function(){
  $('#bite_enognato').click(function() {
    if(document.getElementById('bite_enognato').checked) {
      $('#q_feature_bite_enognato_true').val("1");
    }else{
      $('#q_feature_bite_enognato_true').val("");
    }
  });
});

$(function(){
  $('#bite_fork_inverted').click(function() {
    if(document.getElementById('bite_fork_inverted').checked) {
      $('#q_feature_bite_fork_inverted_true').val("1");
    }else{
      $('#q_feature_bite_fork_inverted_true').val("");
    }
  });
});

$(function(){
  $('#bite_right').click(function() {
    if(document.getElementById('bite_right').checked) {
      $('#q_feature_bite_right_true').val("1");
    }else{
      $('#q_feature_bite_right_true').val("");
    }
  });
});

$(function(){
  $('#dental_full_true').click(function() {
    if(document.getElementById('dental_full_true').checked) {
      $('#q_feature_dental_full_true').val("1");
    }else{
      $('#q_feature_dental_full_true').val("");
    }
  });
});

$(function(){
  $('#dental_incisor_true').click(function() {
    if(document.getElementById('dental_incisor_true').checked) {
      $('#q_feature_dental_incisor_true').val("1");
    }else{
      $('#q_feature_dental_incisor_true').val("");
    }
  });
});
$(function(){
  $('#dental_canine_true').click(function() {
    if(document.getElementById('dental_canine_true').checked) {
      $('#q_feature_dental_canine_true').val("1");
    }else{
      $('#q_feature_dental_canine_true').val("");
    }
  });
});

$(function(){
  $('#dental_molar_true').click(function() {
    if(document.getElementById('dental_molar_true').checked) {
      $('#q_feature_dental_molar_true').val("1");
    }else{
      $('#q_feature_dental_molar_true').val("");
    }
  });
});

$(function(){
  $('#dental_premolar_true').click(function() {
    if(document.getElementById('dental_premolar_true').checked) {
      $('#q_feature_dental_premolar_true').val("1");
    }else{
      $('#q_feature_dental_premolar_true').val("");
    }
  });
});