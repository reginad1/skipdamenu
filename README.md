# SkipDaMenu

## Purpose 
Have you ever felt a craving for a chicken pot pie, and you wondered to youself, Where could I just get a chicken pot pie.  Or have you ever wondered who really has the best pizza in town?  Did you ever just want to find the closest hamburger to you?  Look no further!  Skipdamenu is a website designed to skip the menu and search by a given item.

This project was created as a final project for DBC.

## Collaborators
[Apphia Mann - Founder of idea](https://github.com/apphiamann)

[Dayne Beck](https://github.com/dbeck28)

[Regina DeAngelis](https://github.com/reginad1)

[Joseph Kim](https://github.com/josekim)

## Installation
```
bundle install
export GOOGLE_CLIENT_ID = XXXXXXXXXXXXXXXXXXXXXXX
export GOOGLE_CLIENT_SECRET = XXXXXXXXXXXXXXXXXXXXXXX
export FACEBOOK_SECRET = XXXXXXXXXXXXXXXXXXXXXXX
export FACEBOOK_KEY = XXXXXXXXXXXXXXXXXXXXXXX
export FOURSQ_CLIENT = XXXXXXXXXXXXXXXXXXXXXXX
export FOURSQ_SEC = XXXXXXXXXXXXXXXXXXXXXXX
```

##Features
- User creation feature
    + Can register as a user
    + Register with facebook or google Account
- User Features
    + Item ratings and review feature
    + Picture upload Feature
- Item Search Feature
    + List price for each item
    + list ratings from Skipdamenu
    + Distance from user's current location
    + if not user, than generic Austin Location
    + Picture ability taken from Reviews
    + Google Maps Feature
        * Items searches are pinned on google maps
        * Only Relevant search Items are listed
        * custom pin icon
- Restaurant page
    + A list of all menu items
    + Phone number
    + Hours Oppen
    + Address
    + Pictures from Google images
- Nav Bar
    + Logo of Skipdamenu
    + Search Bar
    + Register/login/signout features embedded

## Technologies 
This App was built on Rails 5
### Gems 
 * Carrierwave
 * Bootstrap
 * Omniauthfacebook
 * OmniauthGoogle
 * Devise
 * cloudinary
 * geocoder
 * foursquare2

## API's
The Following API's are being used and you will need to generate your own API keys for these to work.  You will need to export them into your enviroment.  
* Google Omniauth
* Facebook Omniauth
* Google Maps
* Google Geocode
* Foursquare 

## Test
basic rspec test written
