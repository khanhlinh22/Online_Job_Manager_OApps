import { Text, View } from "react-native"
import MyStyles from "../../styles/MyStyles";
import { Button, TextInput } from "react-native-paper";
import { useState } from "react";
import APIs, { endpoints } from "../../configs/APIs";

const Login = () => {

    const [user, setUser] = useState({});
    const [loading, setLoading] = useState(false);

    const users = {
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

    const login = async () => {
        try {
            let res = await APIs.post(endpoints['login'], {
                ...user,
                "grant_type":'password',
                "client_id":'R8oqau32w5HhFioPbkaNgwwNIjLmT1Rdn4cLcxis',
                "client_secret":'71R9dYP7vpFClBSD7Ia12tPioBv75dbmpaORNRAiZtmcCwUWN1YSbvNMBT6Nc6NbZzPDHU3lZQHpMfSMhdvsxJNpPRTNe8EQZzdreS4Z2zBDUMrSvUtLq2uw16i0EwI8'
            });
            console.info(res.data);
        } catch (ex) {
            console.error(ex);
        } finally {
            setLoading(false);
        }

    }

    return (
        <View>
            {Object.values(users).map(u => <TextInput key={u.field} secureTextEntry={u.secureTextEntry} 
                value={user[u.field] || ""} onChangeText={t => change(t, u.field)}
                style={MyStyles.margin}
                placeholder={u.title}
                right={<TextInput.Icon icon={u.icon} />} />)}
            <Button loading={loading} style={MyStyles.margin} mode="contained" onPress={login}>Sign In</Button>
        </View>
    );

}

export default Login;


{/* <TextInput
                value={user.username} onChangeText={t => setUser({ ...user, "username": t })}
                style={MyStyles.margin}
                placeholder="Username"
                right={<TextInput.Icon icon="account" />} /> */}
{/* <TextInput
                value={user.username} onChangeText={t => setUser({ ...user, "password": t })}
                style={MyStyles.margin}
                placeholder="Password" secureTextEntry={true}
                right={<TextInput.Icon icon="eye" />} />
            <Button style={MyStyles.margin} mode="contained">Sign In</Button> */}