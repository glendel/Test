class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :setLayout
  
  def setLayout
    if ( request.xhr? ) # Is an AJAX request ?
      return( false )
    else
      return( 'application' )
    end
  end
end
