module ApplicationHelper
  def default_meta_tags
    {
      title:       'Member Login',
      description: 'Member login page.',
      keywords:    'Site, Login, Members',
      separator:   "&mdash;".html_safe,
    }
  end

end
