# Residence-Registration-System-Prototype
(Software Engineering Group Project)

As Lakehead University does not have a mobile application for most of its core services 
such as admissions, student housing, fee payments etc, we decided to build a prototype for student housing on the mobile platform. The application provides dorm information, pricing, meal plan and a payment screen. All the information was sourced form the official University website.

# 🚩 Table of contents
1. [App Screenshots](#part1)
2. [Features and Libraries used](#part2)
3. [What I have Learnt](#part3)

## App Screenshots <a name="part1"></a>

![image3](https://user-images.githubusercontent.com/82283086/153281902-a5a29ef2-9d5e-4e1c-beaf-6ec3b29dc4a6.jpg)
![image4](https://user-images.githubusercontent.com/82283086/153281906-6a33d03b-1d54-465e-82cb-0a760369a4a9.jpg)
![image5](https://user-images.githubusercontent.com/82283086/153281910-59c311fe-1185-4b1f-b714-851743126a17.jpg)
![image6](https://user-images.githubusercontent.com/82283086/153281911-7e1a6046-8712-4929-a5aa-c0b679c99600.jpg)


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
