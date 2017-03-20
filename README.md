# handshake-cracker


Handshake cracker

Includes a tool to efficiently perform capturing of handshakes.

It intelligently manages all the words of the dictionaries to be tested, as well as keeps a history of everything that has already been tested, so that the same attempts are not repeated.

In addition to using the process of modifying words with john the ripper, it also divides the process into parts, making discoveries easier.

Also includes custom rules not included in jumbo rules.


Manual installation
-------------------

1) Copy all files to a system folder.
2) Copy the file `john.conf.custom` to `/etc/john`
3) Install in the system all necessary dependencies (if they are not installed)
4) Run the program with:
   `./crack`


Installing with git
-------------------

1) Clone the repository:
   `git clone https://github.com/semeion/handshake-cracker.git`
2) cd into directory:
   `cd handshake-cracker`
3) Copy john rules:
   `cp john.conf.custom /etc/john`
4) Install in the system all necessary dependencies (if they are not installed)
5) Execute the script:
   `./crack`


Installation on Arch Linux
--------------------------

If you are using __Arch Linux__ (Manjaro, BlackArch, etc) do not need to install manually, copy the `PKGBUILD` file in a directory and as normal user (not root) type:

   `makepkg -sri`

To uninstall run (as root):

   `pacman -Rcns handshake-cracker`


Configuring
-----------
You can safely ignore this step, the script no need be configured. But if you preffer can do it.

The config file is located in: `${HOME}/.config/handshake-cracker/scripts.conf`

```sh
handshakes_dir=/home/example/.config/handshake-cracker/handshakes               # Handshakes directory - used by crack script
sessions_dir=/home/example/.config/handshake-cracker/crack-sessions             # Script work directory - used by crack script
wordlist_dir=/home/example/.config/handshake-cracker/wordlists                  # Directory to save wordlists - used by wordlist script
wordlist=/home/example/.config/handshake-cracker/wordlists/wordlist.dic         # Password file - used by crack/wordlist scripts
maxlength=50                                                                    # Max length of words to be used from wordlist - used by crack script
john_incr=Digits8                                                               # John incremental mode to be used - used by crack script
john_rule=My                                                                    # John rule to be used - used by crack script
deauth_time=3                                                                   # Tries to Deauth Clients Quickly - used by handshake script
```

Do not modify the settings after starting the sessions, the configuration is an initial step prior to the crack process.

It is also worth saying that when a new version of john the ripper comes up and you install it, it sometimes modifies the mangle rules, you should not upgrade john to a future version without first finishing your cracking sessions because The update modifying the rules may fail some cracking process.


Notes
-----

If the user wants to add some dictionary to be used, it should be copied to `wordlist_dir` (it must be in text format and with a `.txt` extension). You can add as many dictionaries as you wish, but __DO NOT ADD MANGLED WORDLIST DO BE USED WITH THIS SCRIPT.__ Else the crack process maybe take a long time.

Each time the user update his wordlist, the sessions will be automatically restarted from 1 (on next step), but no worries, all tested words will be preserved and the cracking process will use not tested words only.
If necessary adjust 'maxlength' var to up after update the dictionary to use more words in new round.

The passwords will be saved with extension `.cracked` on directory `sessions_dir`.

The __My__ john rule incorporates __jumbo__ john rule and some special goodies.

Keep in mind that our project was originally meant to be used with any dictionary, however, the wordlist script captures some specific dictionaries of the Portuguese and English language.

If your language is not Portuguese, it is recommended that you edit the code for the wordlist script and remove the parts that download these dictionaries.

The openwall project includes several dictionaries in several languages and is recommended for use with our project.

The project address is:
Http://www.openwall.com/john/

The dictionaries are in:
Http://www.openwall.com/mirrors/

After downloading the desired language, you can use a command like this to make your dictionary customized for your language:

   `zcat passwords/* languages/English/3-large/* languages/English/4-extra/* | grep -v '^#!comment:' | unique English.txt`

You can get more information on this post:
Http://www.openwall.com/lists/john-users/2007/06/05/2

__DO NOT ADD MANGLED WORDLISTS DO BE USED WITH THIS SCRIPT, USE A SMART AND CLEAN WORDLIST, LET THE MANGLE WORK WITH JOHN THE RIPPER.__

For example, don´t use dictionaries with words like maria1234, maria321, m4r14, house*, House007, h0u53, h0us3, etc. Just use maria and house, john will mangle it for you.


__<<< Contributors and feedbacks are welcome! >>>__



Required Programs
-----------------

* aircrack-ng (airodump-ng aireplay-ng airmon-ng)
* pyrit
* scapy
* mdk3
* xterm
* john (jumbo version)
* less
* sha1sum
* sudo
* iconv
* zcat
* bzcat
* unzip
* wget


Licensing
---------

handshake-cracker is licensed under the GNU General Public License version 3 (GNU GPL v3).

_(C) 2017 Alexandre Bolelli_
