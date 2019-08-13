# Oystercard

For this week's project, I was challenged to build a more complex system based on TFL's Oystercard model. This allowed me to develop my skills in Ruby, TDD and object-oriented design.

## Approach

I created a single class which holds a number of methods allowing the user to: **top-up**, **touch-in**, **touch-out**, **store journey**. The program has been designed to throw an error if the minium or maximum balance is breached.

## User Stories / Requirements

```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## How to Install

```
git clone {URL}
```

```
bundle install
```

```
run program in IRB
```

## Run Tests

```
rspec
```

## Screenshot of program

![alt text](screenshot/oysterscreenshot.png?raw=true"screenshot")

The user stories are incomplete.
