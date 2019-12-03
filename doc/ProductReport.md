# **Product Report**
This report is suppose to reflect the usage & creation of my product.

## **Content**
1. [Introduction](#Introduction)
2. [Case & Thesis Statement](#Case-&-Thesis-Statement)
    1. [Case](#Case)
    2. [Tesis Statement](#Thesis-Statement)
3. [Product Description](#Product-Description)
    1. [Product Requirements](#Product-Requirements)
    1. [Used Technologies](#Used-Technologies)
        1. [Software](#Software)
        2. [Hardware](#Hardware)
4. [Product workflow](#Product-Workflow)
    1. [Screens](#Screens)
    2. [Interactions](#Interactions)
        1. [App -> DB](#App-->-DB)
        2. [REST Interface](#REST-Interface)
    3. [Connections](#Connections)
5. [Conclusion](#Conclusion)

## **Introduction**

The sole purpose of this report is to give the reader an overview & understanding of the product created. The product's usage and functionality should be reflected by this report.

## **Case & Thesis Statement**

This read should give you an overview of what problem(s) I am trying to solve.  
The case is a specific scenario, where the problem occurs.  
Thesis Statement is the specific problem.

### **Case**

You've just purchased a brand new smart home device, which you're going to install into your home, the product is nice, you're very excited about it, but then comes the setup process.  
This process is long and entangled in multiple steps.  
You wish there were an easier way to install it into your current system at home.

### **Thesis Statement**

How are we going to make the smart home integration more seemless?

We have multiple ways of solving this:  
* Add NFC to all Smart Devices so that when you hold the device close to your phone(e.g) it'll automatically integrate itself into the system.
* Create a layer between the smart device gateway and some sort of UI, that can handle multiple gateways & devices. (This is the way that I have chosen)

## **Product Description**
My way of solcing the problem is by making a layer between the gateway and some UI.

I've created an app where you are able to save devices connected to a specific gateway.  
When the device is saved in the app it's sending a request to my REST interface with the required information  
to save it in a SQLite3 database contained on the server side.  

FOR THIS PROJECT IT IS NOT USER BASED, BUT SHOULD BE.  

The REST interface is handling all the request send to and from the gateway.  
This interface should be able to handle different manifactures gateways, but as I only  
have one gateway to test this on, it's the one that I am using.

## **Product Requirements**

### **Used Technologies**
Here is a quick overview of the technologies that I've chosen to use.

#### Software
* Python 3.7 (REST Interface)
    * Flask (webserver)
    * pytraadfri (A package for handling request to the IKEA gateway)
* SQLite3 (Database)
* Flutter (UI)
* Git (Version control)

#### Hardware
* IKEA Traadfri set (3 bulbs and 1 gateway)

## **Product Workflow**
This should give you a well defined overview of the workflow and the system as a whole.

### **Screens**

### **Interactions**

#### **App -> DB**

#### **REST Interface**


### **Connections**

## **Conclusion**