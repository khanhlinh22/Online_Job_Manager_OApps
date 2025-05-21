import { ScrollView, Text, View } from "react-native"
import MyStyles from "../../styles/MyStyles"
import { useEffect, useState } from "react";
import APIs, { endpoints } from "../../configs/APIs";
import { ActivityIndicator, List } from "react-native-paper";
import Items from "./Items";

const New = ({ route }) => {

    const recruitmentId = route.params?.recruitmentId;
    const [news, setNews] = useState(null);

    const loadNews = async () => {
        let res = await APIs.get(endpoints['news'](recruitmentId));
        setNews(res.data);
        console.info(res.data);
    }

    useEffect(() => {
        loadNews();
    }, [recruitmentId])

    return (
        <ScrollView>
            {news === null ? (
                <ActivityIndicator />
            ) : (
                <>
                    {news.map(ne => (
                        <Items
                            key={ne.id}
                            item={ne}
                            routeName="newDetails"
                            params={{
                                newId : ne.id,
                                
                            }}
                        />
                    ))}
                </>
            )}



        </ScrollView>
    );
}

export default New;