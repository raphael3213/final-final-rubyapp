module ApplicationHelper


def new_meth(page_title)
base_title="Ruby on Rails"

if page_title.empty?
base_title
else
"#{page_title} | #{base_title}"
end
end


def already_liked?(u,b)
    Like.where(user_id:u,blog_id:b).exists?
  end
end
