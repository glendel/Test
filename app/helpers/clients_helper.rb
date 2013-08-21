module ClientsHelper
  def printRow( client, fields = [] )
    toPrint = '<tr id="' + client.id.to_s + '">'
    toPrint += '<td><img src="' + client.avatar.to_s + '" alt="Avatar"/></td>'
    
    fields.each do |key|
      if ( key == 'country' )
        toPrint += '<td>' + link_to( client.country.name.to_s, clients_path(country_id: client.country.code.to_s ) )  + '</td>'
        #toPrint += '<td>' + client.country.name.to_s + '</td>'
      elsif ( key == 'departament' )
        toPrint += '<td>' + link_to( client.departament.name.to_s, clients_path(depart_id: client.departament.code.to_s ) )  + '</td>'
        #toPrint += '<td>' + client.departament.name.to_s + '</td>'
      elsif ( key == 'city' )
        toPrint += '<td>' + link_to( client.city.name.to_s, clients_path(city_id: client.city.code.to_s ) )  + '</td>'
        #toPrint += '<td>' + client.city.name.to_s + '</td>'
      else
        toPrint += '<td>' + client[ key ].to_s + '</td>'
      end
    end
    
    toPrint += '
    <td>' + link_to( 'Show', client, { :onClick => 'return( processShowClient( this ) );' } ) + '</td>
    <td>' + link_to( 'Edit', edit_client_path( client ), { :onClick => 'return( processShowClient( this, { remote : true } ) );' } ) + '</td>
    <td>' + link_to( 'Destroy', client, { method: :delete, data: { confirm: 'Are you sure?', remote: true } } ) + '</td></tr>'
    
    return( toPrint )
  end
end