=begin
Before do |scenario|
  def browser
    @browser = Watir::Browser.new browser_name
    Watir.default_timeout = 20
    @browser.cookies.clear
    @browser.window.maximize
  end

  if  browser_name == :firefox
    Selenium::WebDriver::Firefox::Binary.path='C:\Program Files\Mozilla Firefox\firefox.exe'
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['geoDisabled.setPreference'] = false
    @browser = Watir::Browser.new :firefox, profile: profile

  elsif browser_name ==:ie
    IO.popen("C:\\Users\\ogboi\\OneDrive\\Documents\\GitHub\\LORA\\features\\support\\authwibdow.exe")
    browser

  elsif browser_name ==:chrome
    browser
  end


  if environment == :dev
    @browser.goto   "https://storefront:loreal1@staging-apac-loreal.demandware.net/on/demandware.store/Sites-nyxcosmetics-hk-Site/zh_HK/Default-Start"
  elsif environment == :stg
    @browser.goto   "https://storefront:loreal1@staging-apac-loreal.demandware.net/on/demandware.store/Sites-nyxcosmetics-hk-Site/zh_HK/Default-Start"
  elsif environment == :prod
    @browser.goto   "http:nyxcosmetics.hk"
  end

end


=end


After do |scenario|
  if scenario.failed?
    @browser.screenshot.save (scenario.name+".png")
    embed(scenario.name+".png", 'image/png')
  end
  @browser.quit
end
