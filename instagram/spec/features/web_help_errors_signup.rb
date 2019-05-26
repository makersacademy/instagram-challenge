
def fill_in_details_with_out_name
  fill_in(:user_email, with: "a@demo.com")
  fill_in(:user_name, with: "")
  fill_in(:user_username, with: "demozz")
  fill_in(:user_password, with: "123456")
end


def fill_in_details_with_out_username
  fill_in(:user_email, with: "a@demo.com")
  fill_in(:user_name, with: "demo")
  fill_in(:user_username, with: "")
  fill_in(:user_password, with: "123456")
end

def fill_in_details_with_out_password
  fill_in(:user_email, with: "a@demo.com")
  fill_in(:user_name, with: "demo")
  fill_in(:user_username, with: "demozz")
  fill_in(:user_password, with: "")
end

def fill_in_details_with_short_password
  fill_in(:user_email, with: "a@demo.com")
  fill_in(:user_name, with: "demo")
  fill_in(:user_username, with: "demozz")
  fill_in(:user_password, with: "33")
end

def fill_in_details_with_long_password
  fill_in(:user_email, with: "a@demo.com")
  fill_in(:user_name, with: "demo")
  fill_in(:user_username, with: "demozz")
  fill_in(:user_password, with: "33mmmmmmmmmmmmm")
end


def fill_in_detail_for_login
  fill_in(:session_email, with: "a@demo.com")
  fill_in(:session_password, with: "sarpon")
end