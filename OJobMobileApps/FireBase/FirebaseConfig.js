import AsyncStorage from '@react-native-async-storage/async-storage';
import { initializeApp, getApps, getApp } from 'firebase/app';
import { initializeAuth, getAuth, getReactNativePersistence } from 'firebase/auth';
import { getFirestore } from 'firebase/firestore';

const FirebaseConfig = {
  apiKey: "AIzaSyB_Q4Is97D0mV1rawVUm2mLfyM06nYT-3c",
  authDomain: "ojob-1bd4c.firebaseapp.com",
  databaseURL: "https://ojob-1bd4c-default-rtdb.firebaseio.com",
  projectId: "ojob-1bd4c",
  storageBucket: "ojob-1bd4c.appspot.com",
  messagingSenderId: "1016735024759",
  appId: "1:1016735024759:web:5c4c10e493cf350de16872"
};

// Initialize Firebase app if not initialized yet
const app = getApps().length ? getApp() : initializeApp(FirebaseConfig);

// Initialize auth with AsyncStorage persistence once
let auth;
try {
  auth = initializeAuth(app, {
    persistence: getReactNativePersistence(AsyncStorage),
  });
} catch (e) {
  auth = getAuth(app);
}

const db = getFirestore(app);

export { app, auth, db };
