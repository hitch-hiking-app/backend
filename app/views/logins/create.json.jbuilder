json.user do
  json.id @user.id
  json.user_name @user.user_name
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.email @user.email
  json.auth_token @user.auth_token
  json.driver @user.driver
end
