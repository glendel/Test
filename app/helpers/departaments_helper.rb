module DepartamentsHelper
  def departament_row( departament )
    toPrint = '<tr id="' + departament._id.to_s + '">
        <td>' + departament.code.to_s + '</td>
        <td>' + departament.name.to_s + '</td>
        <td>' + Country.find_by(code: departament.country_id).name.to_s + '</td>
        <td>' + link_to( 'Show', departament ) + '</td>
        <td>' + link_to( 'Edit', edit_departament_path(departament) ) + '</td>
        <td>' + link_to( 'Destroy', departament, method: :delete, data: { confirm: 'Are you sure?', remote: true } ) + '</td>
      </tr>'
    return (toPrint)
  end
end
