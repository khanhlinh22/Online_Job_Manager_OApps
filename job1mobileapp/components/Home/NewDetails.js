import { useEffect, useState } from "react";
import { ActivityIndicator, ScrollView, Text, View } from "react-native"
import APIs, { endpoints } from "../../configs/APIs";
import { Card } from "react-native-paper";
import RenderHTML from "react-native-render-html";
import moment from "moment";


const NewDetails = ({ route }) => {

    const newId = route.params?.newId;
    const [news, setNews] = useState(null);
    const [comments, setComments] = useState(null);

    const loadNew = async () => {
        let res = await APIs.get(endpoints['new-details'](newId));
        console.log(res.data);  // thêm dòng này
        setNews(res.data);
    }

    const loadComment = async () => {
        let res = await APIs.get(endpoints['comments'](newId));

        setComments(res.data);
        console.info(res.data);
    }

    useEffect(() => {
        loadNew();
    }, [newId])

    const isCloseToBottom = ({ layoutMeasurement, contentOffset, contentSize }) => {
        return layoutMeasurement.height + contentOffset.y >= contentSize.height - 20;
    }

    const reachBottom = ({ nativeEvent }) => {
        if (isCloseToBottom(nativeEvent) && comments === null)
            loadComment
    }

    return (
        <ScrollView onScroll={reachBottom}>
            {news === null ? <ActivityIndicator /> : <>
                <Card>
                    <Card.Title title={news.subject} subtitle={moment(news.created_date).fromNow()} />
                    <Card.Cover source={{ uri: news.image }} />

                    <Card.Content>
                        <RenderHTML source={{ html: news.content }} />
                        {/* Hiển thị lương và thể loại */}
                        {news.recruitment && (
                            <View style={{ marginTop: 10 }}>
                                <Text><Text style={{ fontWeight: 'bold' }}>Lương: </Text>{news.recruitment.salary} VND</Text>
                                <Text><Text style={{ fontWeight: 'bold' }}>Thể loại: </Text>{news.recruitment.type}</Text>
                            </View>
                        )}
                    </Card.Content>
                </Card>
            </>}

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
                                    style={MyStyles.box}
                                    source={{ uri: c.user.avatar }}
                                />
                            )}
                        />
                    ))
                )}
            </View>
        </ScrollView>
    );

}

export default NewDetails;