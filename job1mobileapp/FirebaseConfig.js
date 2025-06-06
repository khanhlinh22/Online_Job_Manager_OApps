import AsyncStorage from '@react-native-async-storage/async-storage';
import { initializeApp } from "firebase/app";
import { getReactNativePersistence, initializeAuth } from 'firebase/auth';
import { getFirestore } from "firebase/firestore";
import { getStorage } from 'firebase/storage';

const FFirebaseConfig = {
    apiKey: "AIzaSyB_Q4Is97D0mV1rawVUm2mLfyM06nYT-3c",
    authDomain: "ojob-1bd4c.firebaseapp.com",
    databaseURL: "https://ojob-1bd4c-default-rtdb.firebaseio.com",
    projectId: "ojob-1bd4c",
    storageBucket: "ojob-1bd4c.appspot.com",
    messagingSenderId: "1016735024759",
    appId: "1:1016735024759:web:5c4c10e493cf350de16872"
};

const app = initializeApp(FFirebaseConfig);

export const auth = initializeAuth(app, {
    persistence: getReactNativePersistence(AsyncStorage),
});
export const db = getFirestore(app);
export const storage = getStorage(app);
