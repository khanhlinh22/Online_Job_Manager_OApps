import { Text, TouchableOpacity, View } from "react-native"
import MyStyles from "../../styles/MyStyles";
import { useState } from "react";
import { Button, TextInput } from "react-native-paper";
import *as ImagePicker from 'expo-image-picker'
import { Image } from "react-native";

const Register = () => {

    const [user, setUser] = useState({});

    const users = {
        first_name: {
            title: "First Name",
            field: "first_name",
            icon: "account",
            secureTextEntry: false
        },
        last_name: {
            title: "Last Name",
            field: "last_name",
            icon: "account",
            secureTextEntry: false
        },

        username: {
            title: "Username",
            field: "username",
            icon: "account",
            secureTextEntry: false
        }, password: {
            title: "Password",
            field: "password",
            icon: "eye",
            secureTextEntry: true
        }
    }


    const change = (value, field) => {
        setUser({ ...user, [field]: value });
    }
    const pickImage = async () => {
        let { status } =
            await ImagePicker.requestMediaLibraryPermissionsAsync();
        if (status !== 'granted') {
            alert("Permissions denied!");
        } else {
            const result =
                await ImagePicker.launchImageLibraryAsync();
            if (!result.canceled)
                setImage(result.assets[0])
        }
    }
    const register = async () => {

    }



    return (<View>
        {Object.values(users).map(u => <TextInput secureTextEntry={u.secureTextEntry} key={u.field}
            value={user[u.field] || ""}
            onChangeText={t => change(t, u.field)}
            style={MyStyles.margin}
            placeholder={u.title}
            right={<TextInput.Icon icon={u.icon} />} />)}

        <TouchableOpacity onPress={pickImage}>
            <Text style={MyStyles.margin}>Choose avatar</Text>
        </TouchableOpacity>

        {user.image ? <Image source={{ uri: user.avatar.uri }}
            style={{ width: 100, height: 100 }} /> : ""}
        <Button style={MyStyles.margin} mode="contained" onPress={register}>Sign Up</Button>
    </View>
    );
}

export default Register;