[![GitHub last commit](https://img.shields.io/github/last-commit/Pundah/Home-Assistant.svg?style=plasticr)](https://github.com/Pundah/Home-Assistant/commits/main)

# Overview
My personal [Home Assistant Container](https://home-assistant.io) configurations.  These are the active automations and configurations that I use every day and are updated frequently as I add more devices and devise increasingly complex methods for performing simple tasks.

# <a name="menu">Menu</a>
 | [Hubs](#hubs) | [Lighting](#lighting) | [Outlets & Switches](#outlets)|  [Voice Assistants](#voice) | [Media](#media) | [Sensors](#sensors) | [Cameras](#cameras) | [Retired](#retired) |


# <a name="menu">Menu</a>
 | [Appliances](#appliances) | [Cameras](#cameras) | [Hubs](#hubs) | [Lighting](#lighting) | [Media](#media) | [Outlets & Switches](#outlets) | [Sensors](#sensors) | [Tablet Dashboards](#tablet) | [Vaccums](#vaccum) | [Voice Assistants](#voice) | [Retired](#retired) |

## <a name="appliances">Appliances</a>

| [Menu](#menu) 

| Device  | Quantity | Connection | Home Assistant | Notes |
| :-------------: | :---: | :-------------: | :-------------: | :-------------: |
| [Bambu Lab P1S + AMS Combo](https://us.store.bambulab.com/products/p1s?srsltid=AfmBOor9MhYrmW1lfWPpqaKrj6rPlrrvvUycE5BykwILS7JQCg2Aqp2Y&id=583855874739507208) | 1 | Wi-Fi | [Bambu Lab](https://github.com/greghesp/ha-bambulab)| 3D Printer for 3D Printing; Multi-color support. |

## <a name="cameras">Cameras</a>

| [Menu](#menu) 

| Device  | Quantity | Connection | Home Assistant | Notes |
| :-------------: | :---: | :-------------: | :-------------: | :-------------: |
| [Blink Mini 2](https://a.co/d/h4z799B) | 2 | Wi-Fi | [Blink](https://www.home-assistant.io/integrations/blink) | Indoor cameras to watch my cats during the day. |
| [Blink Mini Pan-Tilt Camera](https://a.co/d/9Qg8UXz) | 1 | Wi-Fi | [Blink](https://www.home-assistant.io/integrations/blink) | Indoor cameras to watch my cats during the day. |
| [Blink Video Doorbell](https://a.co/d/b8CBksi) | 1 | Wi-Fi | [Blink](https://www.home-assistant.io/integrations/blink) | Outdoor video doorbell camera to detect motion at the front door. |
| [Blink Outdoor 4](https://a.co/d/inN5MFv) | 1 | Wi-Fi | [Blink](https://www.home-assistant.io/integrations/blink) | Wireless video camera to detect motion. |

## <a name="hubs">Hubs</a>

| [Menu](#menu) 

| Device  | Quantity | Connection | Home Assistant | Notes |
| :-------------: | :---: | :-------------: | :-------------: | :-------------: |
| [Decora Smart Wi-Fi Bridge](https://www.homedepot.com/p/Leviton-Decora-Smart-Wi-Fi-Bridge-Use-with-DN6HD-DN15S-No-Neutral-Dimmers-and-Switches-MLWSB-1RW-R02-MLWSB-1RW/320528382) | 1 | Wi-Fi | [HomeKit](https://www.home-assistant.io/integrations/homekit) | Used to control all Leviton Decora Smart devices. |
| [SONOFF Zigbee 3.0 USB Dongle Plus-E](https://a.co/d/fkjkeBF) | 1 | USB | [Zigbee2MQTT](https://www.home-assistant.io/integrations/mqtt/) | Used to control all Zigbee smart bulbs and sensors. Home-Assistant could not detect the dongle by default, so I switched to Zigbee2MQTT. |

## <a name="lighting">Lighting</a>

| [Menu](#menu) 

| Device  | Quantity | Connection | Home Assistant | Notes |
| :-------------: | :---: | :-------------: | :-------------: | :-------------: |
| [EcoSmart 60-Watt A19 Clolor Changing Lightbulb](https://www.homedepot.com/p/EcoSmart-60-Watt-Equivalent-Smart-A19-Color-Changing-CEC-LED-Light-Bulb-with-Voice-Control-1-Bulb-Powered-by-Hubspace-12A19060WRGBWH1/322660146) | 5 | Hubspace | [Hubspace](https://github.com/jdeath/Hubspace-Homeassistant) | Color changing smart bulbs. |
| [Merkury Smart A19 Color Changing Light Bulbs ](https://a.co/d/8A3ckgv) | 1 | Tuya Smart | [Tuya](https://www.home-assistant.io/integrations/tuya/) | Color changing smart bulbs. These are slowly being phased out. |
| [Decora Smart No-Neutral 600-Watt Dimmer ](https://www.homedepot.com/p/Leviton-Decora-Smart-No-Neutral-600-Watt-Dimmer-Requires-MLWSB-Wi-Fi-Bridge-White-DN6HD-1RW-R02-DN6HD-1RW/320528139) | 1 | HomeKit | [HomeKit](https://www.home-assistant.io/integrations/homekit) | No-Neutral Dimmer switch for smart light control. |

## <a name="media">Media</a>

| [Menu](#menu) 

| Device  | Quantity | Connection | Home Assistant | Notes |
| :-------------: | :---: | :-------------: | :-------------: | :-------------: |
| [Fire TV 4k](https://a.co/d/1XLB6FU) | 1 | Wi-Fi | [Home Assistant Cloud](https://www.home-assistant.io/cloud/) | 75" 4k TV |

## <a name="outlets">Outlets & Switches</a>

| [Menu](#menu) 

| Device  | Quantity | Connection | Home Assistant | Notes |
| :-------------: | :---: | :-------------: | :-------------: | :-------------: |
| [THIRDREALITY ZigBee Smart Plug](https://a.co/d/8JaNTos) | 4 | Zigbee2MQTT | [Zigbee2MQTT](https://www.home-assistant.io/integrations/mqtt/) | Smart outlets are utilized to control various devices by powering the outlet on/off.  These devices feature real-time energy monitoring and are Zigbee repeaters. |
| [Geeni Dot Smart Wi-Fi Outlet Plug](https://a.co/d/8JaNTos) | 1 | Wi-Fi | [Tuya](https://www.home-assistant.io/integrations/tuya/) | Wi-Fi Smart outlets utilized to control various devices.  These are slowly being phased out. |

## <a name="sensors">Sensors</a>

| [Menu](#menu) 

| Device  | Quantity | Connection | Home Assistant | Notes |
| :-------------: | :---: | :-------------: | :-------------: | :-------------: |
| [SONOFF ZigBee Wireless Door/Window Sensor](https://a.co/d/bZpSKbk) | 1 | Zigbee2MQTT | [Zigbee2MQTT](https://www.home-assistant.io/integrations/mqtt/) | Door sensors are used to automate Lights when doors are opened. |
| [SONOFF ZigBee Motion Sensor](https://a.co/d/dklTW3n) | 1 | Zigbee2MQTT | [Zigbee2MQTT](https://www.home-assistant.io/integrations/mqtt/) | Motion sensors are used to automate Lights when motion is sensed. |
| [SONOFF Zigbee Water Leak Sensor](https://a.co/d/9wEHtbz) | 3 | Zigbee2MQTT | [Zigbee2MQTT](https://www.home-assistant.io/integrations/mqtt/) | Water Leak sensors are used to detect leaks under pipes. |
| [THIRDREALITY Zigbee Vibration Sensor](https://a.co/d/8NfjLfm) | 2 | Zigbee2MQTT | [Zigbee2MQTT](https://www.home-assistant.io/integrations/mqtt/) | Vibration sensors are used to assist in automations around the house. |

## <a name="tablet">Tablet Dashboards</a>

| [Menu](#menu) 

| Device  | Quantity | Connection | Home Assistant | Notes |
| :-------------: | :---: | :-------------: | :-------------: | :-------------: |
| [Apple Ipdad 7.5](https://support.apple.com/en-us/111911) | 1 | Wi-Fi | [Home-Assistant App](https://www.home-assistant.io/docs/quality_scale/#-internal/) | Kitchen dashboard |
| [Amazon Fire HD 10](https://a.co/d/5niRkJl) | 1 | Wi-Fi | [Home-Assistant App](https://www.home-assistant.io/docs/quality_scale/#-internal/) | Bedroom Dashboard |

## <a name="vacuum">Vacuums</a>

| [Menu](#menu) 

| Device  | Quantity | Connection | Home Assistant | Notes |
| :-------------: | :---: | :-------------: | :-------------: | :-------------: |
| [Shark RV1100A](https://a.co/d/ehNCmZ7) | 1 | Wi-Fi | [Shark IQ](https://www.home-assistant.io/integrations/sharkIQ)| Automated to run at specific times. |

## <a name="voice">Voice Assistants</a>

| [Menu](#menu) 

| Device  | Quantity | Connection | Home Assistant | Notes |
| :-------------: | :---: | :-------------: | :-------------: | :-----------------------------------: |
| [Amazon Echo Dot](https://amzn.to/2wSreSW) | 2 | Wi-Fi | [Home Assistant Cloud](https://www.home-assistant.io/cloud/) | Audio only Voice Assistant. |
| [Amazon Echo Show 8](https://amzn.to/3sPEh09) | 1 | Wi-Fi | [Home Assistant Cloud](https://www.home-assistant.io/cloud/) |Voice Assistant with display. |

## <a name="retired">Retired</a>

| [Menu](#menu) 

| Device  | Quantity | Connection | Home Assistant | Notes |
| :-------------: | :---: | :-------------: | :-------------: | :-------------: |
| [SONOFF Zigbee 3.0 USB Dongle Plus-P](https://a.co/d/00dGtYj) | 1 | USB | [Zigbee2MQTT](https://www.home-assistant.io/integrations/mqtt/) | Used to control all Zigbee smart bulbs and sensors. Home-Assistant could not detect the dongle by default, so I switched to Zigbee2MQTT. |