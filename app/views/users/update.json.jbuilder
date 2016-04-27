json.user do
json.first_name @user.first_name
json.last_name @user.last_name
json.phone @user.phone
json.car_info @user.car_info
json.home_city @user.home_city
json.license_plate @user.license_plate
json.license_number @user.license_number
json.credit_card_number @user.credit_card_number
json.driver @user.driver
end
