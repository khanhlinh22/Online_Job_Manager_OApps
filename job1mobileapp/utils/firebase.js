// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
import { getFirestore } from "firebase/firestore";

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyB_Q4Is97D0mV1rawVUm2mLfyM06nYT-3c",
  authDomain: "ojob-1bd4c.firebaseapp.com",
  databaseURL: "https://ojob-1bd4c-default-rtdb.firebaseio.com",
  projectId: "ojob-1bd4c",
  storageBucket: "ojob-1bd4c.firebasestorage.app",
  messagingSenderId: "1016735024759",
  appId: "1:1016735024759:web:5c4c10e493cf350de16872"
};

// Initialize Firebase
export const FIREBASE_APP = initializeApp(firebaseConfig);
export const FIREBASE_AUTH = getAuth(FIREBASE_APP);
export const FIRESTORE_DB = getFirestore(FIREBASE_APP);