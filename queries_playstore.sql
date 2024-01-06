playstore=# \dt
           List of relations
 Schema |   Name    | Type  |  Owner
--------+-----------+-------+----------
 public | analytics | table | ryanfair

playstore=# SELECT * from analytics;
id  |                                                                                              app_name                                                                                              |      category       | rating | reviews  |        size        | min_installs | price  | content_rating  |                   genres                    | last_updated |                  current_version                   |  android_version
------


-- 1.	Find the app with an ID of 1880
playstore=# SELECT id, app_name FROM analytics WHERE id = 1880;
  id  |        app_name
------+-------------------------
 1880 | Web Browser for Android
(1 row)


-- 2.	Find the ID and app name for all apps that were last updated on August 01, 2018.
playstore=# SELECT id, app_name, last_updated FROM analytics WHERE last_updated = '2018-08-01';
 id  |                                     app_name                                      | last_updated
------+-----------------------------------------------------------------------------------+--------------
   10 | Clash Royale                                                                      | 2018-08-01
   11 | Candy Crush Saga                                                                  | 2018-08-01
   12 | UC Browser - Fast Download Private & Secure                                       | 2018-08-01
   74 | Score! Hero                                                                       | 2018-08-01
  101 | Tiny Flashlight + LED                                                             | 2018-08-01
  102 | Crossy Road                                                                       | 2018-08-01
  103 | SimCity BuildIt                                                                   | 2018-08-01
  111 | FIFA Soccer                                                                       | 2018-08-01
  112 | Angry Birds 2                                                                     | 2018-08-01
  125 | Need for Speed™ No Limits                                                         | 2018-08-01
  126 | YouCam Makeup - Magic Selfie Makeovers                                            | 2018-08-01
  152 | Fallout Shelter                                                                   | 2018-08-01
  159 | DU Recorder – Screen Recorder, Video Editor, Live                                 | 2018-08-01
  160 | Bike Race Free - Top Motorcycle Racing Games                                      | 2018-08-01
  161 | KakaoTalk: Free Calls & Text                                                      | 2018-08-01
  162 | Dolphin Browser - Fast, Private & Adblock🐬                                        | 2018-08-01
  163 | Opera Browser: Fast and Secure                                                    | 2018-08-01
  164 | MARVEL Contest of Champions                                                       | 2018-08-01
  184 | Video Editor Music,Cut,No Crop                                                    | 2018-08-01
  226 | Frozen Free Fall                                                                  | 2018-08-01
  260 | Chess Free                                                                        | 2018-08-01
  276 | ► MultiCraft ― Free Miner! 👍                                                      | 2018-08-01
  277 | Vlogger Go Viral - Tuber Game                                                     | 2018-08-01
  300 | Bad Piggies                                                                       | 2018-08-01
  301 | Skater Boy                                                                        | 2018-08-01
  356 | S Photo Editor - Collage Maker , Photo Collage                                    | 2018-08-01
  357 | Magisto Video Editor & Maker                                                      | 2018-08-01
  358 | Itau bank                                                                         | 2018-08-01
  359 | DEER HUNTER 2018                                                                  | 2018-08-01
  360 | Mobizen Screen Recorder for SAMSUNG                                               | 2018-08-01
  362 | Bike Racing 3D                                                                    | 2018-08-01
  425 | Bomber Friends                                                                    | 2018-08-01
  426 | Lep’s World 3 🍀🍀🍀                                                                 | 2018-08-01
  431 | MakeupPlus - Your Own Virtual Makeup Artist                                       | 2018-08-01
  436 | Photo Collage Maker                                                               | 2018-08-01
  465 | ivi - movies and TV shows in HD                                                   | 2018-08-01
  466 | Calculator Plus Free                                                              | 2018-08-01
  467 | Indeed Job Search                                                                 | 2018-08-01
  507 | MakeMyTrip-Flight Hotel Bus Cab IRCTC Rail Booking                                | 2018-08-01
  569 | Waplog - Free Chat, Dating App, Meet Singles                                      | 2018-08-01
  570 | ESPN                                                                              | 2018-08-01
  580 | Galaxy Attack: Alien Shooter                                                      | 2018-08-01

-- 3.	Count the number of apps in each category, e.g. “Family | 1972”.
playstore=# SELECT category, COUNT(app_name) FROM analytics GROUP BY category;
      category       | count
---------------------+-------
 BOOKS_AND_REFERENCE |   191
 COMMUNICATION       |   342
 BEAUTY              |    46
 EVENTS              |    52
 PARENTING           |    59
 PHOTOGRAPHY         |   313
 GAME                |  1110
 BUSINESS            |   313
 SOCIAL              |   269
 MEDICAL             |   350
 TOOLS               |   753
 TRAVEL_AND_LOCAL    |   234
 ART_AND_DESIGN      |    63
 LIFESTYLE           |   319
 WEATHER             |    79
 COMICS              |    59
 PRODUCTIVITY        |   360
 PERSONALIZATION     |   329
 FINANCE             |   331
 SPORTS              |   338
 ENTERTAINMENT       |   149
 NEWS_AND_MAGAZINES  |   249
 HOUSE_AND_HOME      |    82
 SHOPPING            |   241
 DATING              |   204
 HEALTH_AND_FITNESS  |   298
 EDUCATION           |   156
 MAPS_AND_NAVIGATION |   129
 LIBRARIES_AND_DEMO  |    80
 FOOD_AND_DRINK      |   110
 FAMILY              |  1789
 VIDEO_PLAYERS       |   165
 AUTO_AND_VEHICLES   |    75
(33 rows)

-- 4.	Find the top 5 most-reviewed apps and the number of reviews for each.
playstore=# SELECT app_name, reviews FROM analytics ORDER BY reviews desc LIMIT 5;
                 app_name                 | reviews
------------------------------------------+----------
 Facebook                                 | 78158306
 WhatsApp Messenger                       | 78128208
 Instagram                                | 69119316
 Messenger – Text and Video Chat for Free | 69119316
 Clash of Clans                           | 69109672
(5 rows)

-- 5.	Find the app that has the most reviews with a rating greater than equal to 4.8.
playstore=# SELECT app_name, rating, reviews FROM analytics WHERE rating >= 4.8 ORDER BY reviews desc LIMIT 1;
  app_name  | rating | reviews
------------+--------+---------
 Chess Free |    4.8 | 4559407
(1 row)

-- 6.	Find the average rating for each category ordered by the highest rated to lowest rated.
playstore=# SELECT category, AVG(rating) AS avg_rating FROM analytics GROUP BY category ORDER BY avg_rating DESC;
      category       |     avg_rating
---------------------+--------------------
 EVENTS              |  4.395238104320708
 EDUCATION           |   4.38903223006956
 ART_AND_DESIGN      |  4.347540949211746
 BOOKS_AND_REFERENCE | 4.3423728633061645
 PERSONALIZATION     |    4.3283387457509
 BEAUTY              |  4.299999970656175
 GAME                |  4.287167731498383
 PARENTING           |  4.285714266251545
 HEALTH_AND_FITNESS  | 4.2743944663902464
 SHOPPING            |  4.253648051376507
 SOCIAL              |  4.245669291244717
 WEATHER             |   4.24399998664856
 SPORTS              |  4.233333332576449
 PRODUCTIVITY        |  4.212173904543338
 AUTO_AND_VEHICLES   |  4.200000017881393
 HOUSE_AND_HOME      |  4.197368430463891
 PHOTOGRAPHY         |  4.196116511489967
 MEDICAL             | 4.1926829182520144
 FAMILY              | 4.1904873752761995
 LIBRARIES_AND_DEMO  | 4.1784615259904125
 FOOD_AND_DRINK      |  4.155660354866172
 COMICS              |  4.155172401461108
 COMMUNICATION       |  4.151234589241169
 FINANCE             |  4.146835436549368
 NEWS_AND_MAGAZINES  |  4.130131007281974
 ENTERTAINMENT       |   4.12617449632427
 BUSINESS            |  4.116666667004849
 TRAVEL_AND_LOCAL    |   4.10179372753263
 LIFESTYLE           |  4.077076400237226
 VIDEO_PLAYERS       |  4.059748438919115
 MAPS_AND_NAVIGATION |  4.058196711735647
 TOOLS               |  4.050627608678331
 DATING              |  3.993684190825412
(33 rows)


-- 7.	Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
playstore=# SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;
      app_name      | price  | rating
--------------------+--------+--------
 Naruto & Boruto FR | 379.99 |    2.9
(1 row)



-- 8.	Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
playstore=# SELECT app_name, rating, min_installs FROM analytics WHERE min_installs < 50 AND rating >.1 ORDER BY rating DESC;
                    app_name                    | rating | min_installs
------------------------------------------------+--------+--------------
 Radio FG Paris Underground                     |      5 |           10
 My CW                                          |      5 |           10
 Q Actions - Digital Assistant                  |      5 |           10
 AQ: First Contact                              |      5 |            5
 AQ wisdom +                                    |      5 |           10
 British Columbia Transit Info                  |      5 |           10
 HR Team CQ Region Ed Qld                       |      5 |            5
 db Meter - sound level meter with data logging |      5 |           10
 Otto DM                                        |      5 |            5
 DM Adventure                                   |      5 |            1
 FK Events                                      |      5 |           10
 BTK-FH Online Campus                           |      5 |           10
 Popsicle Launcher for Android P 9.0 launcher   |      5 |           10
 DT CLOTHINGS                                   |    4.8 |           10
 CY Spray nozzle                                |    4.8 |           10
 DY Fitness                                     |    4.8 |           10
 Miller’s Bar B-Q                               |    4.8 |           10
 Custos F.O.                                    |    4.7 |           10
 Ec Solutions Mobile                            |    4.5 |           10
 Ek IRA                                         |    4.2 |           10
 EC-Contractors                                 |      4 |           10
 F-1 watchface by Delta                         |    3.5 |           10
(22 rows)


-- 9.	Find the names of all apps that are rated less than 3 with at least 10000 reviews.
playstore=# SELECT app_name, rating, reviews FROM analytics WHERE rating < 3 AND reviews > 10000;
                    app_name                     | rating | reviews
-------------------------------------------------+--------+---------
 The Wall Street Journal: Business & Market News |    2.8 |  107441
 Vikings: an Archer’s Journey                    |    2.9 |   31596
 Shoot Em Down Free                              |    2.4 |   11773
(3 rows)


-- 10.	Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
playstore=# SELECT app_name, reviews, price FROM analytics WHERE price BETWEEN .10 AND 1.00 LIMIT 10;
                  app_name                   | reviews | price
---------------------------------------------+---------+-------
 Free Slideshow Maker & Video Editor         |  408292 |  0.99
 Couple - Relationship App                   |   85468 |  0.99
 Anime X Wallpaper                           |   84114 |  0.99
 Dance On Mobile                             |   61264 |  0.99
 Marvel Unlimited                            |   58617 |  0.99
 FastMeet: Chat, Dating, Love                |   58614 |  0.99
 IHG®: Hotel Deals & Rewards                 |   48754 |  0.99
 Live Weather & Daily Local Weather Forecast |   38419 |  0.99
 DreamMapper                                 |   32496 |  0.99
 Můj T-Mobile Business                       |   32344 |  0.99
(10 rows)



-- 11.	Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/
playstore=# SELECT app_name, last_updated FROM analytics ORDER BY last_updated LIMIT 1;
  app_name  | last_updated
------------+--------------
 CP Clicker | 2010-05-21
(1 row)



-- 12.	Find the most expensive app (the query is very similar to #11).
playstore=# SELECT app_name, price FROM analytics ORDER BY price DESC LIMIT 1;
      app_name      | price
--------------------+-------
 Cardi B Piano Game |   400
(1 row)



-- 13.	Count all the reviews in the Google Play Store.
playstore=# SELECT SUM(reviews) FROM analytics;
    sum
------------
 4814575866
(1 row)


-- 14.	Find all the categories that have more than 300 apps in them.
playstore=# SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;
    category
-----------------
 COMMUNICATION
 PHOTOGRAPHY
 GAME
 BUSINESS
 MEDICAL
 TOOLS
 LIFESTYLE
 PRODUCTIVITY
 PERSONALIZATION
 FINANCE
 SPORTS
 FAMILY
(12 rows)


-- 15.	Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.
playstore=# SELECT app_name, reviews, min_installs, min_installs/reviews AS proportion FROM analytics WHERE min_installs >=10000 ORDER BY proportion DESC LIMIT 1;
     app_name     | reviews | min_installs | proportion
------------------+---------+--------------+------------
 Kim Bu Youtuber? |      66 |     10000000 |     151515
(1 row)
