import { use, useEffect, useState } from "react"
import MyStyles from "../../styles/MyStyles";
import { Alert, FlatList, RefreshControl, View } from "react-native";
import Items from "./Items";
import { ActivityIndicator, Button, Text } from "react-native-paper";
import AsyncStorage from "@react-native-async-storage/async-storage";
import moment from "moment";


const PAGE_SIZE = 5;

const AppliedNews = () => {
    const [applied, setApplied] = useState([]);
    const [loading, setLoading] = useState(false);
    const [visibleItems, setVisibleItems] = useState([]);
    const [page, setPage] = useState(1);

    const loadApplied = async () => {
        setLoading(true);
        try {
            let saved = await AsyncStorage.getItem('appliedNews');
            saved = saved ? JSON.parse(saved) : [];
            //sap  xep theo ngay ung tuyen moi nhat
            saved.sort((a, b) => new Date(b.applied_at) - new Date(a.applied_at));
            setApplied(saved);
            setVisibleItems(saved.slice(0, PAGE_SIZE));
            setPage(1);
        } catch (ex) {
            console.error('Lỗi khi đọc dữ liệu', ex);
            alert('Không thể tải dữ liệu ứng tuyển');
        } finally {
            setLoading(false);
        }
    };

    const loadMore = () => {
        const nextPage = page + 1;
        const nextItems = applied.slice(0, nextPage * PAGE_SIZE);
        setVisibleItems(nextItems);
        setPage(nextPage);
    }

    const handleRemove = (itemId) => {
        Alert.alert(
            "Gỡ ứng tuyển?",
            "Bạn có chắc chắn muốn gỡ tin này khỏi danh sách?",
            [
                { text: "Hủy", style: "cancel" },
                {
                    text: "Gỡ",
                    style: "destructive",
                    onPress: async () => {
                        try {
                            const updated = applied.filter(item => item.id !== itemId);
                            await AsyncStorage.setItem("appliedNews", JSON.stringify(updated));
                            setApplied(updated);
                            setVisibleItems(updated.slice(0, page * PAGE_SIZE));
                            alert("Đã gỡ ứng tuyển.");
                        } catch (err) {
                            console.error("Lỗi khi gỡ:", err);
                            alert("Gỡ không thành công.");
                        }
                    }
                }
            ]
        );

    };
    useEffect(() => {
        loadApplied();
    }, []);

    const renderItem = ({ item }) => (
        <View>
            <Items
                item={item}
                routeName="NewDetails"
                params={{ newId: item.id }}
                showApplyButton={false}
                showSalary={true}
            />
            <Text style={{ marginLeft: 15, marginBottom: 5, color: 'gray' }}>
                📌 Ứng tuyển: {moment(item.applied_at).fromNow()}
            </Text>
            <Button
                icon="delete"
                mode="outlined"
                onPress={() => handleRemove(item.id)}
                style={{ marginHorizontal: 15, marginBottom: 15 }}
            >
                Gỡ ứng tuyển
            </Button>
        </View>
    );


    return (
        <View style={[MyStyles.container, MyStyles.margin]}>
            <Text style={MyStyles.subject}>Tin bạn đã ứng tuyển</Text>

            {loading ? (
                <ActivityIndicator />
            ) : visibleItems.length === 0 ? (
                <Text>Bạn chưa ứng tuyển tin nào.</Text>
            ) : (
                <FlatList
                    data={visibleItems}
                    keyExtractor={item => item.id.toString()}
                    renderItem={renderItem}
                    onEndReached={() => {
                        if (visibleItems.length < applied.length) loadMore();
                    }}
                    onEndReachedThreshold={0.2}
                    refreshControl={
                        <RefreshControl refreshing={loading} onRefresh={loadApplied} />
                    }
                />
            )}
        </View>
    );
};

export default AppliedNews;
