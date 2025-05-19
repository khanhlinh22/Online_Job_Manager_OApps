import { useEffect, useState } from "react";
import { ActivityIndicator, ScrollView, Text } from "react-native"
import APIs, { endpoints } from "../../configs/APIs";
import { Card } from "react-native-paper";
import RenderHTML from "react-native-render-html";


const NewDetails = ({ route }) => {

    const newId = route.params?.newId;
    const [news, setNews] = useState(null);
    const [comments, setComments] = useState([]);

    const loadNew = async () => {
        let res = await APIs.get(endpoints['new-details'](newId));
        setNews(res.data);
    }

    useEffect(() => {
        loadNew();
    }, [newId])

    return (
        <ScrollView>
            {news === null ? <ActivityIndicator />:<>
                <Card>
                    <Card.Title title={news.subject} subtitle={news.created_date} />
                    <Card.Cover source={{ uri: news.image }} />
                    
                    <Card.Content>
                        <RenderHTML source={{html: news.content}} />
                    </Card.Content>
                </Card>
            </>}
        </ScrollView>
    );

}

export default NewDetails;