module GroupsHelper
  def imageurl(group)
    return group.icon if group.icon

    'https://bitsofco.de/content/images/2018/12/broken-1.png'
  end
end
