import React, { useState, useEffect } from "react";
import { View, Text, TouchableOpacity, Alert } from "react-native";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { Icon } from "react-native-paper";

import Home from "./components/Home/Home";
import New from "./components/Home/New";
import NewDetails from "./components/Home/NewDetails";
import Login from "./components/User/Login";
import Register from "./components/User/Register";
import Profile from "./components/User/Profile";
import AppliedNews from "./components/Home/AppliedNews";
import ChatScreen from "./components/Chat/ChatScreen";
import UploadCV from "./components/CV/UploadCV";

import { onAuthStateChanged } from "firebase/auth";
import { auth } from "./FireBase/FirebaseConfig";

const Stack = createNativeStackNavigator();
const Tab = createBottomTabNavigator();

// 👉 Home Stack
const HomeStackScreen = ({ setIsLoggedIn }) => (
  <Stack.Navigator screenOptions={{ headerShown: true }}>
    <Stack.Screen name="Home">
      {(props) => <Home {...props} setIsLoggedIn={setIsLoggedIn} />}
    </Stack.Screen>
    <Stack.Screen name="New" component={New} />
    <Stack.Screen name="NewDetails" component={NewDetails} />
    <Stack.Screen
      name="AppliedNews"
      component={AppliedNews}
      options={{ title: "Ứng tuyển" }}
    />
  </Stack.Navigator>
);

// 👉 Chat Stack
const ChatStack = () => (
  <Stack.Navigator>
    <Stack.Screen name="Chat" component={ChatScreen} options={{ title: "Chat" }} />
  </Stack.Navigator>
);

// 👉 Upload CV Stack
const UploadStack = () => (
  <Stack.Navigator>
    <Stack.Screen name="UploadCV" component={UploadCV} options={{ title: "Upload CV" }} />
  </Stack.Navigator>
);

// 👉 Profile Stack
const ProfileStack = () => (
  <Stack.Navigator>
    <Stack.Screen name="Profile" component={Profile} options={{ title: "Tài khoản" }} />
  </Stack.Navigator>
);

// 👉 Dummy Logout screen
const LogoutScreen = () => null;

// ✅ Tab Navigator
const TabNavigator = ({ isLoggedIn, setIsLoggedIn }) => (
  <Tab.Navigator screenOptions={{ headerShown: false }}>
    {isLoggedIn ? (
      <>
        <Tab.Screen
          name="HomeStack" // ✅ Đã đổi tên từ "HomeTab" → "HomeStack"
          options={{
            title: "Trang chủ",
            tabBarIcon: ({ color, size }) => <Icon source="home" color={color} size={size} />,
          }}
        >
          {(props) => <HomeStackScreen {...props} setIsLoggedIn={setIsLoggedIn} />}
        </Tab.Screen>

        <Tab.Screen
          name="ChatTab"
          component={ChatStack}
          options={{
            title: "Chat",
            tabBarIcon: ({ color, size }) => <Icon source="chat" color={color} size={size} />,
          }}
        />

        <Tab.Screen
          name="UploadTab"
          component={UploadStack}
          options={{
            title: "Upload CV",
            tabBarIcon: ({ color, size }) => <Icon source="upload" color={color} size={size} />,
          }}
        />

        <Tab.Screen
          name="ProfileTab"
          component={ProfileStack}
          options={{
            title: "Tài khoản",
            tabBarIcon: ({ color, size }) => <Icon source="account" color={color} size={size} />,
          }}
        />

        <Tab.Screen
          name="Logout"
          component={LogoutScreen}
          options={{
            tabBarButton: (props) => (
              <TouchableOpacity
                {...props}
                style={{ flex: 1, justifyContent: "center", alignItems: "center" }}
                onPress={() =>
                  Alert.alert("Xác nhận", "Bạn có chắc chắn muốn đăng xuất?", [
                    { text: "Hủy", style: "cancel" },
                    {
                      text: "Đăng xuất",
                      style: "destructive",
                      onPress: () => {
                        auth.signOut();
                        setIsLoggedIn(false);
                      },
                    },
                  ])
                }
              >
                <Icon source="logout" size={24} />
                <Text style={{ fontSize: 12 }}>Đăng xuất</Text>
              </TouchableOpacity>
            ),
          }}
        />
      </>
    ) : (
      <>
        <Tab.Screen
          name="Login"
          options={{
            title: "Đăng nhập",
            tabBarIcon: ({ color, size }) => <Icon source="login" color={color} size={size} />,
          }}
        >
          {(props) => <Login {...props} setIsLoggedIn={setIsLoggedIn} />}
        </Tab.Screen>

        <Tab.Screen
          name="Register"
          component={Register}
          options={{
            title: "Đăng ký",
            tabBarIcon: ({ color, size }) => <Icon source="account-plus" color={color} size={size} />,
          }}
        />
      </>
    )}
  </Tab.Navigator>
);

export default function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    const unsubscribe = onAuthStateChanged(auth, (user) => {
      setIsLoggedIn(!!user);
    });
    return unsubscribe;
  }, []);

  return (
    <NavigationContainer>
      <TabNavigator isLoggedIn={isLoggedIn} setIsLoggedIn={setIsLoggedIn} />
    </NavigationContainer>
  );
}
