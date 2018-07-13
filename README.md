# Chrome Pwned Passwords Checker

This extension uses an export of passwords from Google Smart Lock (Chrome's password manager)
and checks them against [Pwned Passwords](https://haveibeenpwned.com/Passwords) using the k-anonymity
checker (i.e. it never sends your actual password, it sends a substring of a hashed version of your
password).

You can get the `Chrome Passwords.csv` file by going to chrome://settings/passwords in Google Chrome,
then clicking the three dots to the right of the Saved Passwords header and downloading it somewhere.

## Usage

    bundle install
    bundle exec ruby check-passwords.rb Chrome\ Passwords.csv

## Output

Will check each password line by line. If a password has been pwned over 10,000 times it'll be red,
otherwise it's yellow. It's up to you to decide whether you'd accept the risk of using a password that's
shown up in plain text in breaches once, 10 times, 100 times...