module UiHelper

  def edit_link(resource)
    link_to icon('fas', 'edit') + 'Edit', resource
  end

  def destroy_link(resource)
    link_to icon('fas', 'trash') + 'Delete', resource, method: :delete, data: { confirm: 'Are you sure?' }
  end
end