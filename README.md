# with-detox-tests

Demonstrates integration of the Detox gray box end-to-end testing library with Expo. Uses [detox](https://github.com/wix/Detox), [detox-expo-helpers](https://github.com/expo/detox-expo-helpers) and [expo-detox-hooks](https://github.com/expo/detox-tools).

## Try it out

### 1. Install dependencies.

This is taken from Step 1 here: https://github.com/wix/detox/blob/master/docs/Introduction.GettingStarted.md#step-1-install-dependencies

#### Install the latest version of [Homebrew](http://brew.sh)

Homebrew is a package manager for macOS, we'll need it to install other command line tools.

> TIP: Verify it works by typing in terminal `brew -h` to output list of available commands

#### Install [Node.js](https://nodejs.org/en/)

Node is the JavaScript runtime Detox will run on. **Install Node 8.3.0 or above**

 ```sh
 brew update && brew install node
 ```

> TIP: Verify it works by typing in terminal `node -v` to output current node version, should be 8.3.0 or higher

#### Install [applesimutils](https://github.com/wix/AppleSimulatorUtils)

A collection of utils for Apple simulators, Detox uses it to communicate with the simulator.

```sh
brew tap wix/brew
brew install applesimutils
```

> TIP: Verify it works by typing in terminal `applesimutils` to output the tool help screen

#### Install Detox command line tools (detox-cli)

This package makes it easier to operate Detox from the command line. `detox-cli` should be installed globally, enabling usage of the command line tools outside of your npm scripts. `detox-cli` is merely a script that passes commands through to a the command line tool shipped inside `detox` package (in `node_modules/.bin/detox`).

  ```sh
  npm install -g detox-cli
  ```

### 2. Run `yarn`.
This installs all the packages then runs `./scripts/download_expo_app.sh`. This should grab the latest [Expo app](https://expo.io/tools) and place it inside `bin/`

### 3. Start the packager:
`expo start` (if you don't have `expo` installed, `yarn global add expo`).

### 4. `npm run e2e`

## Notes

This example includes a patch to the version of the detox library used (version 14.4.1).

This is needed to prevent a timeout issue running tests.  The live reloading in expo seems to need detox to blacklist some URLs that is otherwise sees as network activity and waits until they stop.

The docs for this paramater are here: https://github.com/wix/Detox/blob/master/docs/APIRef.DeviceObjectAPI.md#10-initialize-the-url-blacklist-at-device-launch

However it seems this commit broke this functionality: https://github.com/wix/Detox/commit/32be293774383d631d0938300175204d4222dd13

🤷‍

For more information see these links:
https://github.com/wix/Detox/issues/1422#issuecomment-516033748
https://github.com/wix/Detox/issues/1627

