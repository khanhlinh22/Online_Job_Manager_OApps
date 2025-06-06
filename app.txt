import { createNativeStackNavigator } from "@react-navigation/native-stack";
import Home from "./components/Home/Home";
import New from "./components/Home/New";
import { NavigationContainer } from "@react-navigation/native";
import NewDetails from "./components/Home/NewDetails";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import Register from "./components/User/Register";
import Login from "./components/User/Login";
import { Icon } from "react-native-paper";

const Stack = createNativeStackNavigator();


const StackNavigator = () => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="index" component={Home} />
      <Stack.Screen name="news" component={New} />
      <Stack.Screen name="newDetails" component={NewDetails} />

    </Stack.Navigator>
  )
}

const Tab = createBottomTabNavigator();

const TabNavigator = () => {
  return (
    <Tab.Navigator>
      <Tab.Screen name="Home" component={StackNavigator} options={{ title: "Main Screen" , tabBarIcon: () => <Icon source={"home-circle"}/>}} />
      <Tab.Screen name="Login" component={Login} options={{  tabBarIcon: () => <Icon source={"login"}/>}}/>
      <Tab.Screen name="Register" component={Register} options={{  tabBarIcon: () => <Icon source={"account-plus"}/>}}/>
    </Tab.Navigator>

  )
}

export default function App() {
  return (

    <NavigationContainer>
      <TabNavigator />
    </NavigationContainer>
  );
}

