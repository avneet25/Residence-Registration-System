# Residence-Registration-System-Prototype
(Software Engineering Group Project)

As Lakehead University does not have a mobile application for most of its registration facilities 
such as admissions, student housing, fee payments etc, we built a prototype for student housing on the mobile platform. The application provides dorm information, pricing, meal plan and a payment screen.
<br/> - Complete: User selection in various categories integrated with API response
<br> - Pending: WebView of extended article, Bookmarking favourite/certain articles for future reference

# 🚩 Table of contents
1. [App Screenshots](#part1)
2. [Features and Libraries used](#part2)
3. [What I have Learnt](#part3)

## App Screenshots <a name="part1"></a>

<img width="247" alt="Screen Shot 2022-02-04 at 2 48 01 PM" src="https://user-images.githubusercontent.com/82283086/152594185-04befab7-f3fb-473c-be77-4140d40ec384.png"><img width="244.3" alt="Screen Shot 2022-02-04 at 2 48 42 PM" src="https://user-images.githubusercontent.com/82283086/152594188-3bb8f460-3815-49de-8e00-70b4094fcdf6.png"><img width="247" alt="Screen Shot 2022-02-04 at 2 49 04 PM" src="https://user-images.githubusercontent.com/82283086/152594191-13a64b68-afa4-4788-a3f0-a87a300e2cb4.png"><img width="247" alt="Screen Shot 2022-02-04 at 2 52 02 PM" src="https://user-images.githubusercontent.com/82283086/152594192-ce0e8035-9ad5-47da-9591-12ec3ebea18f.png">

## Features and Libraries used <a name="part2"></a>

* Used [mediastack API](https://mediastack.com) (Free, Simple REST API for Live News & Blog Articles).
* It offers extensive options in various categories. For NewsApp I have provided 13 Languages (single select), 52 countries (select upto three) and 6 categories with "general" set as the default (multiselect).
* Searchbar option provided for finding language/country of choice
* [Flagkit](https://github.com/madebybowtie/FlagKit) used for displaying round flag images
* [Alamofire](https://github.com/Alamofire/Alamofire) for API response
* [SDWebImage](https://github.com/SDWebImage/SDWebImage) for displaying article images from url

___

## What I have Learnt <a name="part3"></a>

* (array_name).filter [$0]
* Data in JSON (Dictionaries and arrays)
* Search bar delegates
* override func prepare(for segue: ...) to pass data between screens