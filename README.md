# stackoverflow-code-identifier
Untagged code identifier for StackOverflow posts.

Some ammount of StackOverflow Q&A forums have code snippets which aren't identified with the &lt;code&gt; &lt;/code&gt; tags. This is a partial solution to this problem using REGEX with C/FLEX and scripting with Python3.

There is a focus on C/Java alike code but also recognising some Python, Bash Prompt and PHP. There has been the effort to parse markup languages but it's handling with REGEX has showned unpredictable, even with the escape characters, due to the body content text extraction.

# Prerequisites

For this program to run you will need FLEX, GCC and Python3.
The Mac installation it's made with Homebrew, whick it's installed with  <code>/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"</code>. 

There is a similar package manager to Linux machines called Linuxbrew and it can be fount at http://linuxbrew.sh/. I leave it's installation up to those interested, being the examples shown bellow accepted in most Linux-like OS.

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

# Results
Some StackOverflow forums data have hundreds of MB and it's result may take a while to finish. There is indeed a status briefing in the form of <code> 4  de  11  ( 36.36363636363637 % ) posts identificados com mais codigo - Last body:  122764  </code> and when it's finished the result can be verified in the Posts.xml file named before, having the same content but with added tags.


