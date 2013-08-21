module CitiesHelper
  def city_row(city)
    toPrint = '<tr id="' + city._id.to_s + '">
    <td>' + city.code.to_s + '</td>
    <td>' + city.name.to_s + '</td>
    <td>' + link_to( city.departament.name.to_s, cities_path(depart_id: city.departament.code.to_s ) )+ '</td>
    <td>' + city.cap.to_s + '</td>
    <td>' + link_to( 'Show', city ) + '</td>
    <td>' + link_to( 'Edit', edit_city_path(city) ) + '</td>
    <td>' + link_to( 'Destroy', city, { method: :delete, data: { confirm: 'Are you sure?', remote: true } } ) + '</td>
  </tr>'    
    return (toPrint)
  end
  
  def city_option(city)
    toPrint = '<option value="' + city.code.to_s + '">' + city.name.to_s + '</option>'
    return (toPrint)
  end
end
