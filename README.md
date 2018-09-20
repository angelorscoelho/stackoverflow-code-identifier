# stackoverflow-code-identifier
Untagged code identifier for StackOverflow posts.
Some ammount of StackOverflow Q&A forums have code snippets which aren't identified with the &lt;code&gt; &lt;/code&gt; tags. This is a partial solution to this problem using REGEX with C/FLEX and scripting with Python3.

# Prerequisites

For this program to run you will need FLEX, GCC and Python3.

For FLEX installation on a Linux machine you need to run the following commands:
  ```
  sudo apt-get update 
  sudo apt-get upgrade 
  sudo apt-get install flex bison
  ```
  or for Mac, using the brew install manager:
  ```
  brew install flex
  ```

For GCC, on Linux machine:
  ```
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install build-essential
  ```
  For Mac, use the brew command:
  ``` 
  brew install gcc
  ```
For Python3 installation on Linux it would be the command:
  ```
  sudo apt-get update
  sudo apt-get install python3.6
  ```
  Or, again, in a Mac:
  ```
  brew install Python3
  ```


# Usage
For this package usage you would need to download the StackExchange forum of your like at https://archive.org/download/stackexchange. Inside this archive you downloaded will be all data and meta-data of that particular forum. It will be of interest the "Posts.xml" file since it's where the real posts body is stored. 

After this procedure you must change directory to the run.py directory and run the following command:
```
python3 run.py
```
At this point you'll be asked which file to analyze and you may type
``` 
Posts.xml
```
but note, you can analyze any XML file that follows the StackOverflow Posts.xml pattern.


