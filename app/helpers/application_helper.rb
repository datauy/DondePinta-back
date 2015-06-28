module ApplicationHelper
  def navbar_tab_class(tab)
    'active' if controller_name == tab
  end
end
