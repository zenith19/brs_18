Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vn/ do
  end
end
