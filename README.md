# Simple calculation validator

A store owner has a simple calculcator to keep track of when he sells products and issues refunds.  He only deals in dollar amounts, so there is no change involved.  When using the calculator, there are 2 different actions that he can take:

1. enter a number and hit the enter key
2. enter an operator and hit the enter key

* The results of his actions are recorded in an array of strings.  
* The first item in the array must be a number, the next two should be an operator and a number followed by an operator and a number and so forth.

E.g., 

```
50 - 25 + 25 + 150 - 15 + 25 + 50
=> 260
```

* It's also possible to represent negative numbers with a minus sign, but numbers cannot include a plus sign.
* Simply raise any exception if an invalid format is encountered.
* Return the value represented as a string if the array format is valid.

### Install

```
rvm use 2.3.0
bundle install
```

### Run tests

```
rspec
```
