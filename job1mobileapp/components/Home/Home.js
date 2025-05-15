import { View, Text, ScrollView } from 'react-native';
import MyStyles from "../../styles/MyStyles";
import { useEffect, useState } from 'react';
import APIs, { endpoints } from '../../configs/APIs';
import { ActivityIndicator, Chip, List } from 'react-native-paper';
import { Image } from 'react-native';

const Home = () => {

    const [categories, setCategories] = useState([]);
    const [recruitments, setRecruitments] = useState([])
    const [loading, setLoading] = useState(false);

    const loadCates = async () => {
        let res = await APIs.get(endpoints['categories']);
        console.info(res.date);
        setCategories(res.data);
    }

    const loadRecruits = async () => {
        setLoading(true);

        try {
            let res = await APIs.get(endpoints['recruitments']);
            setRecruitments(res.data.results);
        }

        catch (ex) {
            console.error(ex);
        } finally {
            setLoading(false);
        }

    }

    useEffect(() => {
        loadCates();
    }, []);

    useEffect(() => {

        loadRecruits();
    }, []);
    return (
        <View style={MyStyles.container}>
            <Text style={MyStyles.subject}>DANH MỤC CÔNG VIỆC</Text>
            <View style={MyStyles.row}>
                {categories.map(c => <Chip style={MyStyles.margin} icon="label" key={c.id}>{c.name}</Chip>)}
            </View>

            <ScrollView style={MyStyles.margin}>
                {loading && <ActivityIndicator />}
                {recruitments.map(c => <List.Item
                    title={c.subject}
                    description={c.created_date}
                    left={props => <Image style={MyStyles.box} source={{ uri: c.image }} />}
                />)}
            </ScrollView>
        </View>
    );
}

export default Home;