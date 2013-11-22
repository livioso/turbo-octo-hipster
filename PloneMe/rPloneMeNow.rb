require 'mechanize'

begin
  username = "livio.bieri"
  password = ""

  agentPlone = Mechanize.new { |agent|
    agent.follow_meta_refresh = true
    agent.pluggable_parser.default = Mechanize::Download
  }

  # We have to be logged in to upload stuff
  page = agentPlone.get('http://plone3.imvs.technik.fhnw.ch/logged_out')
  form = page.forms.first
  form.fields.each { |f| puts f.name }

  form['__ac_name'] = username
  form['__ac_password'] = password

  loggedInPage = form.submit

  agentPlone.get('http://plone3.imvs.technik.fhnw.ch/ip-113/copy_of_einfuehrungswoche-bienenberg').save('a_file_name')


end

# do |pagePlone|
#   signInPage = agentPlone.click(pagePlone.link_with(:text => 'log in'))
#    homePage = signInPage.form_with(:name => 'login-form') do |login_form|
#      login_form["login-form:__ac_name"] = username
#      login_form["login-form:__ac_password"] = password
#    end.submit
#  end