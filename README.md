# react-native-gemius

## Getting started

`$ npm install react-native-gemius --save`

No specific native installation required since this module uses auto linking

## Usage
```javascript
import RNReactNativeGemius from 'react-native-gemius';


RNReactNativeGemius.setAppInfo('atHome.lu', '0.0.3');
RNReactNativeGemius.setGemiusInfo(
'https://galu.hit.gemius.pl',
    'appIdentiFierIOS',
    'appIdentiFierAndroid',
);
console.log('TRACKING::GEMIUS::VieWed page: ', 'example screen');
RNReactNativeGemius.sendPageViewedEvent();
```
