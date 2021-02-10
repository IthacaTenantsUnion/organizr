module UiHelper

  def edit_link(resource)
    link_to icon('fas', 'edit') + 'Edit', resource
  end

  def destroy_link(resource)
    link_to icon('fas', 'trash') + 'Delete', [:union] + Array.wrap(resource), method: :delete, data: { confirm: 'Are you sure?' }
  end
end

=begin

<!-- Primary -->
<button class="flex items-center shadow bg-teal-500 px-4 py-2 text-white hover:bg-teal-400">
    Default
</button>
<!-- Border bottom --> 
<button
  class="bg-blue-500 py-2 px-4 border-b-4 border-blue-800 rounded text-white hover:border-blue-lighter hover:bg-blue-400">
  Default
</button>
<!-- Border-->
<button class="border-2 border-blue-500 px-4 py-2 text-blue-500 hover:text-white hover:bg-blue-500 rounded">
    <p>Default</p>
</button>
<!-- Line down -->
<button class="mt-4 px-4 py-2 border-b-2 border-blue-400 font-bold text-blue-500 hover:border-blue-500">
    Default
</button>

<!-- Button with icon -->
<button class="flex items-center shadow bg-blue-500 px-4 py-2 text-white hover:bg-blue-400">
    <i class="material-icons mr-2">message</i> Messages
</button>
<!-- Button with icon & badge -->
 <button class="flex items-center relative shadow bg-teal-500 pt-2 pb-2 pl-4 pr-4 text-white hover:bg-teal-400">
  <i class="material-icons mr-2">message</i> Messages
  <span class="absolute right-0 top-0 -mt-2 -mr-2 rounded-full bg-red-500 p-1 text-xs shadow w-6 h-6">12</span>

=end