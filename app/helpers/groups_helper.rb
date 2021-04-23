module GroupsHelper
  def imageurl(_group)
    return group.icon unless group.icon.nil?

    'https://bitsofco.de/content/images/2018/12/broken-1.png'
  end

  def name(wish)
    User.find(wish.author_id).name
  end
end
