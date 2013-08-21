module CountriesHelper
  def country_row( country )
    toPrint = '<tr id="' + country._id.to_s + '">
        <td>' + country.code.to_s + '</td>
        <td>' + country.name.to_s + '</td>
        <td>' + link_to( 'Show', country ) + '</td>
        <td>' + link_to( 'Edit', edit_country_path(country) ) + '</td>
        <td>' + link_to( 'Destroy', country, { method: :delete, data: { confirm: 'Are you sure?', remote: true } } ) + '</td>
      </tr>'
    return (toPrint)
  end
end
