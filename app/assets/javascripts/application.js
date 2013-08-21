// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
/*<script type='text/javascript' src='app/assets/javascripts/jquery.table_filter.js'></script>*/
function updateLists( selector, url, options ) {
  options = jQuery.extend( true, {}, {
    remote : true,
    dataType : 'html'
  }, options );
  
  //jQuery( selector ).load( url );
  var ajaxOptions = {
    url : url,
    dataType : options.dataType,
    data : options.data, 
    success : function( result, textStatus, jqXHR ) {
      if ( options.dataType === 'json' ) {
        console.log( result );
      } else if ( options.dataType === 'xml' ) {
        console.log( result );
      } else if ( options.dataType === 'script' ) {
        alert( 'The JS source returned by the server is executed automatically.' );
      } else {
        jQuery( selector ).html( result );
      }
    }
  };
  jQuery.ajax( ajaxOptions );
}
