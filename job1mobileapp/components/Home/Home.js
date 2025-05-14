import { View, Text } from 'react-native';
import MyStyles from "../../styles/MyStyles";
import { useEffect, useState } from 'react';
import APIs, { endpoints } from '../../configs/APIs';

const Home = () => {

    const [categories, setCategories] = useState([]);
    const loadCates = async () =>{
        let res = await APIs.get(endpoints['categories']);
        console.info(res.date);
        setCategories(res.data);
    }

    useEffect(() => {
        loadCates();
    }, []);

    return (
        <View style={MyStyles.container}> 
            <Text style={MyStyles.subject}>DANH MỤC CÔNG VIỆC</Text>
        </View>
    );
}

export default Home;