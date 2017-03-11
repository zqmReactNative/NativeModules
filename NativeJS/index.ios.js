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


const {RNEventEmitterManager} = NativeModules;
const kLoginSuccessEvent = "kLoginSuccessEvent";

const rnEventEmitterManager = new NativeEventEmitter(RNEventEmitterManager);

const subscription = rnEventEmitterManager.addListener(
  kLoginSuccessEvent,
  (info) => console.log(info)
);

export default class NativeJS extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          {this.props.account}
        </Text>
        <Text style={styles.instructions}>
          To get started, edit index.ios.js
        </Text>
        <Text style={styles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
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
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('NativeJS', () => NativeJS);
