# My Money

All in one solution for tracking and analysing all of your spendings.
This is a project that I wish to make for my own usecase.

I used a really amazing native app called [MyMoney](https://play.google.com/store/apps/details?id=com.raha.app.mymoney.free&hl=en_IN), but I needed more from it, to start off, I really dislike the fact that I have to create each and every entry on my own. I have three different bank accounts and I either spend or get money from either of them, I don't want to have to create a multiple entries per day, one by one.

## Possible Solutions

### Bank Statement Analyser

I built a bank statement PDF analyser with in Swift. It was amazing as I could get all the entries from a PDF, now all I have to do is manually select a category for each and every one of these expenses or incomes so that it becomes easier for me to run queries on them.

### Track every expense

Track expenses from the moment they are made from any payment app, but that seems like a lot of work. I could look directly into users messages, so that every time they make an expense and a relevant SMS is sent, I could either record that into the DB or send a notification reminding the user to log that expense, that is something I can look into, however I don't believe it would be extremely reliable.

## Implementation

1. I need a robust and fast local database with great querying capability and sqflite or the floor DB is the obvious choice. While it is great, I need to look at the promised reactive capability, because I would want almost real-time change listener if possible, otherwise I can see that I would have to manage state at a lot of places.

## Flutter

I am a bit skeptical about the flutter version that I should use since the default one that I have installed on my machine is 3.24.3, and I can also manage the latest version via FVM. However, it's quite tricky sometimes to setup Android studio as per the requirements when working with FVM, as opposed to the default version, so I'll just move ahead with the default flutter version and figure things out in the future.

