# Step-by-Step guide to an EarnzCoin Masternode setup
A novices guide to an Ubuntu 16.04 install

***

## 1. Send 8000 coins to yourself.

If you haven't done so already, install the windows wallet from https://github.com/Frenzel1337/EarnzCoin-Windows-Wallet-v1.1.0.2/raw/master/EarnzCoin-qt-win32-v1102.zip 
Create a new receive address and call it something like MN1. Although I like to call mine the name of my server so it's easier to track which VPS each MN is installed on.

Then send 8000 ERZ coins to the address you just created. Make sure the address receives EXACTLY 8000 coins.
We now need to **wait** for 15 confirmations of the transaction so we'll get on with the remote VPS install.



## 2. VPS

Order a VPS. I choose the Ubuntu 16.04 (server version without a desktop) operating system to install on it would be ideal.
A tried and tested place to get a VPS is from: https://01VPS.net 



## 3. PuTTY Install

If you haven't got any SSH client installed already, please download and run PuTTY from https://www.putty.org/



## 4. New Server Setup

Your VPS provider will give you an IP address and a root password for your new server.
Login in to your server with PuTTY using the IP address. Your username will be "root" and the password is the root password.

Now, update your server and install some dependencies by copying the follwing code:

```
wget -O serz.sh https://git.io/fbjHT && sh serz.sh
```

Paste into the putty window by right clicking with your mouse.

It may ask you some questions while installing the dependencies, if it asks to reinstall things which are already installed, just choose yes.

The script will create a new system user named **erzuser** and will generate a random password.
You'll be told the password when the script has finished.

Save your password and reboot the server by typing:

```
reboot
```



## 5. INSTALL

Now log back in using the same IP address, but with the username "erzuser" and the password that was generated for you.

Copy and paste the following into the command line. Enter your erzuser password if asked and let it run. It may take a while.

```
wget -O erz.sh https://git.io/fbjHt && sh erz.sh
```

At the end it'll tell you your masternode key which you'll need to copy and paste into your windows wallet masternode configuration file.


## 6. Configure Windows wallet

Once the 8000 coins you sent earlier has 15 confirmations, you can grab your Transaction ID and VOUT.
Go to the debug console and type:

```
masternode outputs
```

You'll see something like this:

```
"txhash" : "f90eaujc198869319fd2f0ed30c8e3b681d49bc1ebf3108baa2d12b69dc11ae6",
"outputidx" : 0
```

The first part is your TxHash - the second part is your Output Index.
Now add your masternode by entering the "Masternodes" tab and clicking the "Create..." button.

A window will popup where you'll need to fill in all the details from what the script provided and what you got from the masternode outputs.

Close and restart the wallet.


## 7. Start your Masternode

Then start it by going to the masternode tab, clicking on your masternode and choosing to "Start".


***


# Donations

Any donation is highly appreciated  





**ERZ**: EKfoweMJVUdBSmK9vHAHnsxKkyfbRv7bRR 

**BTC**: 3MprejNeXAHVvNA4mfrMzymZakE7x2Efra 

**ETH**: 0x9B11A49423bb65936D03df9abB98d00B438b0010 

**LTC**: MC7HmFHhHPQg3pFbzeuTPPXXPe3SZWJJHE 





**Good luck!**