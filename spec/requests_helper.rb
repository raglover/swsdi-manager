def login_valid(user)
  page.driver.post user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
end