import { Text, View } from "react-native"
import MyStyles from "../../styles/MyStyles";
import { Button, TextInput } from "react-native-paper";
import { useState } from "react";
import APIs, { authApis, endpoints } from "../../configs/APIs";
import AsyncStorage from "@react-native-async-storage/async-storage";

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
                "grant_type": 'password',
                "client_id": 'HYkRTzJuI1HIJ8KpaNugOrtXgNmNlHISrIqk3zGJ',
                "client_secret": 'h2b0qR8DeQZuVifUM4KzwqWUoJ4DNaCTwsB2xnLmxp2NoCfthf1KgCazW4a7zMxrMu0OCbvf3G2TQFMDvPZZbCcVSm1azdE7YuageXQLRmg6VvKiL5rH8igJ4b7QuYmy',
            });
            // console.info(res.data);
            // AsyncStorage.setItem('token', res.data.access_token);

            // let user = await authApis(res.data.access_token).get(endpoints['current-user']);
            // console.info(res.data);
        } catch (ex) {
            if (ex.response) {
                console.error("❌ Server error:", ex.response.data);
            } else {
                console.error("❌ Other error:", ex.message);
            }
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