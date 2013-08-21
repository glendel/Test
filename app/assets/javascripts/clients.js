// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
function processShowClient( objLnk, options ) {
  if ( jQuery.isPlainObject( options ) && !jQuery.isEmptyObject( options ) && options.remote === true ) {//if ( typeof( options ) !== 'undefined' ) {
    alert( 'Lo que se me ocurra hacer con este link Siempre y cuando sea remote.' );
  } else {
    alert( 'Lo que se me ocurra hacer con este link.' );
  }
  
  return( false );
}
