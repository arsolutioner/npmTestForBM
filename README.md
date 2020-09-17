
# Build Machine readme test for . 

----------
**❗️Important** <br>
Cordova AppsFlyer plugin version **4.4.0** and higher are meant to be used with **cordova-android@7.0.0**
<br>For lower versions of cordova-android please use plugin version 4.3.3 available @ https://github.com/AppsFlyerSDK/cordova-plugin-appsflyer-sdk/tree/4.3.3

----------
🛠 In order for us to provide optimal support, we would kindly ask you to submit any issues to support@appsflyer.com

*When submitting an issue please specify your AppsFlyer sign-up (account) email , your app ID , reproduction steps, code snippets, logs, and any additional relevant information.*

----------



### <a id="plugin-build-for"> This plugin is built for

- iOS AppsFlyerSDK **v3.4.0**
- Android AppsFlyerSDK **v4.4.3**


## <a id="installation">📲Installation

```
$ cordova plugin add cordova-plugin-appsflyer-sdk
```

To install cordova manually check out the doc [here](/docs/Installation.md).

> **_NOTE:_** for Ionic installation see [this](#ionic) section


 ## <a id="guides"> 📖 Guides

Great installation and setup guides can be viewed [here](/docs/Guides.md).
- [init SDK Guide](/docs/Guides.md#init-sdk)
- [Deeplinking Guide](/docs/Guides.md#deeplinking)
- [Uninstall Guide](/docs/Guides.md#uninstall)
- [Set plugin for IOS 14](/docs/Guides.md#ios14)


## <a id="setup"> 🚀 Setup

####  Set your App_ID (iOS only), Dev_Key and enable AppsFlyer to detect installations, sessions (app opens) and updates.  
> This is the minimum requirement to start tracking your app installs and is already implemented in this plugin. You **MUST** modify this call and provide:  
 **devKey** - Your application devKey provided by AppsFlyer.<br>
**appId**  - ***For iOS only.*** Your iTunes Application ID.<br>
**timeToWaitForAdvertiserID**  - ***For iOS14 only.*** Time for the sdk to wait before launch.


Add the following lines to your code to be able to initialize tracking with your own AppsFlyer dev key:


```javascript
document.addEventListener('deviceready', function() {

   window.plugins.appsFlyer.initSdk({
      devKey: 'K2***************99', // your AppsFlyer devKey
      isDebug: false,
      appId: '41*****44', // your ios appID
      timeToWaitForAdvertiserID: 10, //time for the sdk to wait before launch - IOS 14 ONLY!
    },
      (result) => {
        console.log(result);
      },
      (error) => {
        console.error(error);
      }
    );
  
}, false);
```
---


## <a id="api"> 📑 API
  
See the full [API](/docs/API.md) available for this plugin.


## <a id="demo"> 📱 Demo
Check out the demo for this project [here](docs/Guides.md#demo).

There is 1 demo project called ```demoC```.<br>run ```npm run setup_c``` in the appsflyer-cordova-plugin folder and then open the project ios in Xcode to see implementation for IOS 14

## <a id="ionic"> 📍 Ionic

In case you are using Ionic framework, you have 2 options:
### 1 - Using Ionic native plugin
####  Ionic 4
run this commands:
**With Cordova**:
```
$ ionic cordova plugin add cordova-plugin-appsflyer-sdk
$ npm install @ionic-native/appsflyer
```
**With Capacitor**:
```
$ npm install cordova-plugin-appsflyer-sdk
$ npm install @ionic-native/appsflyer
ionic cap sync
```
Then add the following to `app.module.ts`
```
import { Appsflyer } from "@ionic-native/appsflyer/ngx";
...
providers: [
Appsflyer,
...,
]
```
and in your main ts file:
```
import { Appsflyer } from '@ionic-native/appsflyer/ngx';

constructor(private appsflyer: Appsflyer) { }
...
this.appsflyer.initSdk(options);
```
####  Ionic 2/3
If you're using Ionic 2/3, you'd need to install a previous version of the Ionic Native dependency (notice the **@4** at the end of the npm install command):
```
$ ionic cordova plugin add cordova-plugin-appsflyer-sdk
$ npm install @ionic-native/appsflyer@4
```
Then add the following to `app.module.ts`(with no **/ngx**)
```
import { Appsflyer } from "@ionic-native/appsflyer";
...
providers: [
Appsflyer,
...,
]
```
And finally in your main ts file:
```
import { Appsflyer } from '@ionic-native/appsflyer';
```
###  2. Using the `window` object directly
 You can use the plugin the same way like in Cordova with only one exception:
instead of `window.plugins...` use `window['plugins']...`
Check out the full [API](/docs/API.md) for more information
