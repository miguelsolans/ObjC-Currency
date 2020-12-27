# ObjC-Currency
A Currency calculator built on Apple's Objective-C and UIKit Framework.

## How to Run

This project requires AFNetworking, therefore it is important to install all required CocoaPods. To do such, type the following command on terminal

```
$ pod install
```

## APIs

Currency App uses Fixer external API to fetch coin rates. You can get your API key at their [website](https://fixer.io). This key should be set on the Xcode project, under Scheme configuration, on the environment variable called *api_key*. 


![](set_api_key.gif)
