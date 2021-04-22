class ChangeIconToLogoInGroups < ActiveRecord::Migration[6.1]
  def change
    change_column_default :groups, :icon, "https://bitsofco.de/content/images/2018/12/broken-1.png"
  end
end
