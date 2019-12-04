# **Process Report**
This report is suppose to reflect the process & thoughts made during the creating of this product.

## **Content**
1. [Introduction](#Introduction)

2. [Case & Thesis statement](#Case-&-Thesis-statement)
    1. [Case](#Case)
    2. [Thesis statement](#Thesis-statement)
3. [Thought going into the project](#Thought-going-into-the-project)
    1. [First iteration of project](#First-iteration-of-project)
4. [The thoughts during the project](#The-thoughts-during-the-project)
5. [Technologies](#Technologies)
    1. [Why have I chosen these?](#Why-have-I-chosen-these?)
    2. [Alternative Technologies](#Alternative-Technologies)
6. [Conclusion](#Conclusion)

## **Introduction**
In this report you're going get some information about the thoughts and process that went into developing this product.  

Some of the stuff written in here, will also be in the product report.  

## **Case & Thesis statement**

### **Case**
You've just purchased a brand new smart home device, which you're going to install into your home, the product is nice, you're very excited about it, but then comes the setup process.  
This process is long and entangled in multiple steps.  
You wish there were an easier way to install it into your current system at home.

### **Thesis statement**
How are we going to make the smart home integration more seemless?

## **Thoughts going into the project**
A lot of enthusiasm, because this project is something i believe would make for an easier integration of smart home devices.

### **First iteration of project**
My first iteration of this project were to use, if there were, the NFC in the smart bulbs, and create an app on the phone to get the NFC to add the device to the gateway.  

So the function would be: Take the smart device, hold it close to the phone, the phone should then notify that you're trying to connect this new smart device to the network and you would then be able to agree or deny.  

This could not be done, as NFC is not in the smart devices...  

I then had to change my plan.  

So the project I went with is to create a layer that makes it easy to use different manifacturers gateways for controlling the smart devices.

## **The thoughts during the project**
When initializing the project I was very focused on making this as easy integratable as possible.  

I made my file structure and created the different files.  

File structure is as follows:
* doc
* src
    * app
        * nadir_app
    * webserver
        * asyncs
            * async_methods.py
        * Main server file (server.py)

These are the important files that I needed for the project to work.

## **Technologies**
For software I chose to go with the following:

* Python 3.7 (REST Interface)
    * Flask (webserver)
    * pytraadfri (A package for handling request to the IKEA gateway)
* JSON (Database file)
* Flutter (UI)
    * I chose to use flutter as my App development tool, since I believe that this will be the new black.
* Git (Version control)

* IKEA Traadfri set (3 bulbs and 1 gateway)

### **Why have i chosen these?**
A small explenation of why I chose the certain technologies.  

I wanted a lightweight language, something that could be easily further develop & something that other developers could get into, so Python was my language of choise. I had no earlier experience with async programming with this language, so that was also part of why I chose Python.  
Python is a "easy to learn, fast to use" language, it's also well documented, this played a role aswell.  

My original plan was to use the Phillips Hue smart devices, but I could not get these, so the Ikea traadfri set was the next best thing.

### **Alternative Technologies**
I had some thoughts about other technologies to use, these can be seen here, with a small explenation of why I didn't chose them.  

* C# (for REST Interface)
    * C# is also a well matured & well documented language, but I based on current knowledge and the urge to create the REST Interface from the bottom, I chose Python.
        * Pros
            * When compiled, this can run faster than python.
            * An emmence amount of documentation
        * Cons
            * Not as easy to share (Open source wise)
            * longer development time (Due to compiling)
* C++ (for REST Interface)
    * This was a hard one not to choose. C++ is a very cool language (by my opinion), and I could've gotten a micro controller to handle the REST Interface, which would create further complexity of the system, all tho this system was created to be simple, and not confuse the user, I chose the solution of creating something that could be spin up on a raspberry (or equal), with an easy docker container, so Python was the choise.
        * Pros
            * Shows more skill, as you'll need emmence knowledge of pointers, memory and more.
            * Extremely good for embeded systems.
        * Cons
            * Easy to mess up (memory leaks, null pointers and more)
            * Big setup needed (Build systems)
* SQLite (for Database)
    * As I am still using a file based DB, a json file, but if I were using SQLite the posiblity of a very storage heavy file would be eliminated, also, SQLite is more secure. But for this small project, I chose to go with a single json file as my DB.
        * Pros
            * More secure
            * Small size, due to single db file structure
        * Cons
            * File DB, only one user at a time
* MySQL (for Database)
    * Pros
        * Secure
        * Scaleable
    * Cons
        * Takes alot of space
* Phillips Hue (Used for hardware)
    * As I mentioned earlier, I wanted to develop this system using the Phillips Hue, but as I could not get these I went with the IKEA Traadfri.
    * Phillips has a emmence developt python package which would be much easier to work with.


## **Conclusion**
Actually, I am a bit disappointed about this project, as the first iteration is so much more cool, and much more usefull, but I am still pretty happy with the result, as this is also a usefull piece of software, that is handy for people with multiple manufacturers gateways.

I believe that I've completed my project. It's easy to integrate & easy to use.