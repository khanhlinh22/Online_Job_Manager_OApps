import { useEffect, useState } from "react";
import { ActivityIndicator, ScrollView, View, Image, useWindowDimensions } from "react-native";
import APIs, { endpoints } from "../../configs/APIs";
import { Card, List } from "react-native-paper";
import RenderHTML from "react-native-render-html";
import moment from "moment";

const NewDetails = ({ route }) => {
    const newId = route.params?.newId;
    const [news, setNews] = useState(null);
    const [comments, setComments] = useState([]);
    const { width } = useWindowDimensions();

    const loadNew = async () => {
        let res = await APIs.get(endpoints['new-details'](newId));
        setNews(res.data);
    }

   const loadComment = async () => {
    let res = await APIs.get(endpoints['comments'](newId));
    console.info("COMMENTS RES:", res.data);
    console.info("USER TEST:", res.data.results[0]?.user);

    setComments(res.data.results);  // ✅ chỉ lấy mảng
}

    useEffect(() => {
        loadNew();
        loadComment();
    }, [newId]);

    return (
        <ScrollView>
            {news === null ? <ActivityIndicator /> : (
                <Card>
                    <Card.Title title={news.subject} subtitle={moment(news.created_date).fromNow()} />
                    <Card.Cover source={{ uri: news.image }} />
                    <Card.Content>
                        <RenderHTML contentWidth={width} source={{ html: news.content }} />
                    </Card.Content>
                </Card>
            )}

            <View>
                {comments === null ? (
                    <ActivityIndicator />
                ) : (
                    comments.map((c, index) => (
                        <List.Item
                            key={index}
                            title={c.content}
                            description={moment(c.created_date).fromNow()}
                            left={() => (
                                <Image
                                    source={{ uri: c.user.avatar }}
                                    style={{ width: 40, height: 40, borderRadius: 20, marginRight: 10 }}
                                />
                            )}
                        />
                    ))
                )}
            </View>
        </ScrollView>
    );
};

export default NewDetails;
