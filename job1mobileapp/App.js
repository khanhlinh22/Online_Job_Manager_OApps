import { createNativeStackNavigator } from "@react-navigation/native-stack";
import Home from "./components/Home/Home";
import New from "./components/Home/New";
import { NavigationContainer } from "@react-navigation/native";
import NewDetails from "./components/Home/NewDetails";

const Stack = createNativeStackNavigator();


const StackNavigator = () => {
  return (
    <Stack.Navigator>
      <Stack.Screen name="index" component={Home} />
      <Stack.Screen name="news" component={New} />
      <Stack.Screen name="newDetails" component={NewDetails} />

    </Stack.Navigator>
  )
}

export default function App() {
  return (

    <NavigationContainer>
      <StackNavigator />
    </NavigationContainer>
  );
}

