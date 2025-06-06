
# ZigBee2MQTT

I started using Home Assistant with devices that only connected to Wi-Fi so I never had a need for a hub to control or receive updates. After getting comfortable, I decided to try using sensors to make my apartment smarter. I decided to get the [SONOFF Zigbee 3.0 USB Dongle Plus - P](https://a.co/d/00dGtYj) as the reviews seemed to make this the most straight forward device to get started. I also decided to pick up a motion sensor to start my Zigbee sensor network. Unfortunately, this ended up being anything but smooth. The dongle I received from Amazon refused to work Plug-And-Play as advertised. I even followed the install instructions from the manufacture and updated the firmware. After a few hours of struggling to get the adapter to work with home-assistant I decided to attempt to use the ZigBee2MQTT & Mosquitto Broker that comes as a home-assistant add-on. After following a guide I was able to get a working network.

### Update 1:

After a few days of using the `SONOFF Zigbee 3.0 USB Dongle Plus - P` and adding more sensors, I noticed devices were starting to drop and not reconnect. Luckily while making an Amazon purchase, I forgot to remove the [SONOFF Zigbee 3.0 USB Dongle Plus - E](https://a.co/d/fkjkeBF) from my cart. Wham, Bahm, and now we have a new adapter to test with. I have updated my ZigBee2MQTT settings to use the `SONOFF Zigbee 3.0 USB Dongle Plus-E`. I was also to change my Wi-Fi settings to move the 2.4GH band to channel 6 to allow for my MQTT network to run on channel 11.

### Update 2: 

After using the `SONOFF Zigbee 3.0 USB Dongle Plus-E` for about a week now, my connection strength has been excellent. My devices are no longer dropping off the network, and my automations are responding more quickly.

