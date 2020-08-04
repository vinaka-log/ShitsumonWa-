# ShitsumonWa?

## Site information

- URL: https://www.shitsumonwa.com
 
![image](https://user-images.githubusercontent.com/61833409/88449166-a4d7dc80-ce7f-11ea-821f-5f130757ed09.png)


## About "ShitsumonWa?"

This is a Web service where you can easily ask questions about Japan. You can share small questions about Japanese and recommended sightseeing spots.

## Why "Shitsumon Wa?" service?

- “I like Japan, but it costs money to come to study in Japan.” (Azerbaijani man in his early twenties)
- "I often travel to Japan, so I want to know the spots where local people go, not famous tourist spots." (Middle 20s Hong Kong woman)
- "I am self-taught because my Japanese lessons have disappeared in Corona, but I want a place where I can feel free to ask questions because the grammar of Japanese is difficult." (Russian women in their early thirties)

From the opinions of my friends above, I knew that there was a need for a service that could share information about Japan, and I thought that having a service close to me would help my friends deepen their understanding of Japan.

##  Development environment
- Ruby 2.6.3
- Rails 6.0.3

## Function list of "Shitsumon Wa?"

- User CRUD function
- Login function (sorcery)
- Email activation (sorcery,ActionMailer)
- Password reset (sorcery,ActionMailer)
- Remeber me (sorcery)
- Twitter, Facebook login (sorcery)
- CRUD function for question posting
- Like function (Ajax)
- Stock function (Ajax)
- Follow function (Ajax)
- Sort function
- Pagination function (Kaminari)
- Show SNS link on profile (Twitter, Facebook, Instagram)
- Display Japan Score on your profile (total number of likes for your post)
- Image upload (carrierwave, mini_magick, AWS S3, fog)

## "Shitsumon Wa?" Technology List

- Platform (AWS EC2)
- Infrastructure (AWS (ALB Route53))
- Web server (Nginx)
- AP server (Unicorn)
- Database (PostgreSQL)
- Test (Rspec, Capybara, factory_bot)
- Automated test (Circle CI)
- CSS framework (Bootstrap4)
- JavaScript library (jQuery)
- Code check (rubocop)
- Performance Monitoring Tool (New Relic)
- Error notification and analysis service (Rollbar)
- Development environment (Docker)
- Version control (Git)
- Repository management (Github)

## Issues of "ShitsumonWa?" ・Functions to be additionally implemented

- Improved response speed ([PageSpeed ​​Insights](https://developers.google.com/speed/pagespeed/insights/?hl=JA&url=https%3A%2F%2Fwww.shitsumonwa.com%2F&tab=mobile))


  - 1.Deliver a CDN file of static files around Rails Assets with CloudFront (AWS)
  - 2.Erase all unnecessary CSS files
  - 3.Write common CSS directly in head
  
  
   - computer
  
![image](https://user-images.githubusercontent.com/61833409/88448643-e914ae00-ce7a-11ea-9538-653217df2447.png)

   - mobile
  
![image](https://user-images.githubusercontent.com/61833409/88448702-78ba5c80-ce7b-11ea-9323-7c4ab123fcd0.png)

- SEO measures (google-analytics-rails, meta-tags, sitemap_generator)
- Slack notification function
- Deployment automation (Circle CD)
- Send and receive messages asynchronously with DM function
- Question tag function
