/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  NativeModules,
  NativeEventEmitter,
} from 'react-native';

import {saveUserInfo, readUserInfoById} from './js/utils/db';

const {LoginEventEmitterManager} = NativeModules;
const kLoginSuccessEvent = "kLoginSuccessEvent";

const loginEventEmitterManager = new NativeEventEmitter(LoginEventEmitterManager);

const subscription = loginEventEmitterManager.addListener(
  kLoginSuccessEvent,
  (info) => {saveUserInfo(info)}
);

export default class NativeJS extends Component {

  _popToNative = () => {
    LoginEventEmitterManager.popToNative();
  }

  _loginSuccess = () => {
    let info = {id: "RN_0001", name: "RN_Name", token: "RN_123456"};
    LoginEventEmitterManager.login(info);
    saveUserInfo(info);
  }

  render() {
    return (
      <View style={styles.container}>

        <Text style={styles.instructions}>
          {"id:" + (readUserInfoById()&&readUserInfoById().id)}
        </Text>
        <Text style={styles.instructions}>
          {"name:" + (readUserInfoById()&&readUserInfoById().name)}
        </Text>
        <Text style={styles.instructions}>
          {"token:" + (readUserInfoById()&&readUserInfoById().token)}
        </Text>
        <Text onPress={()=>{this._popToNative()}} style={styles.instructions}>
          {"返回原生"}
        </Text>
        <Text onPress={()=>{this._loginSuccess()}} style={styles.instructions}>
          {"RN端登录,通知原生"}
        </Text>
      </View>
    );
  }
  componentWillUnmount() {
    // subscription.remove();
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    // alignItems: 'center',
    padding: 20,
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    color: '#333333',
    marginBottom: 5,
  },
  button: {
    color: '#e0e0e0',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('NativeJS', () => NativeJS);
