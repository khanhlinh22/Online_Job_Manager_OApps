import { View, Text, ScrollView, TouchableOpacity, FlatList, RefreshControl } from 'react-native';
import MyStyles from "../../styles/MyStyles";
import { useEffect, useState } from 'react';
import APIs, { endpoints } from '../../configs/APIs';
import { ActivityIndicator, Chip, List, Searchbar } from 'react-native-paper';
import { Image } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import Items from './Items';

const Home = () => {

    const [categories, setCategories] = useState([]);
    const [recruitments, setRecruitments] = useState([])
    const [loading, setLoading] = useState(false);
    const [cateId, setCateId] = useState("");
    const [page, setPage] = useState(1);
    const [q, setQ] = useState("");
    const nav = useNavigation();


    const loadCates = async () => {
        let res = await APIs.get(endpoints['categories']);
        console.info(res.data);
        setCategories(res.data);


    }

    const loadRecruits = async () => {
        if (page > 0) {
            setLoading(true);

            let url = `${endpoints['recruitments']}?page=${page}`;
            try {
                if (cateId || q)
                    url = `${url}&category_id=${cateId}&q=${q}`
                console.info(url);

                let res = await APIs.get(url);

                if (page > 1)
                    setRecruitments([...recruitments, ...res.data.results]) // tai them du lieu neu page >1
                else
                    setRecruitments(res.data.results);

                if (res.data.next == null)
                    setPage(0);
            }

            catch (ex) {
                console.error(ex);
            } finally {
                setLoading(false);
            }
        }

    }

    useEffect(() => {
        loadCates();
    }, []);

    useEffect(() => {
        let timer = setTimeout(() => loadRecruits(), 500);

        return () => clearTimeout(timer);

    }, [cateId, page, q]);

    const loadMore = () => {
        if (page !== 0)
            setPage(prev => prev + 1); //  Tăng trang
    }


    const search = (value, callback) => {
        setPage(1);
        callback(value);
        setRecruitments([]); // Xóa kết quả cũ để tránh trộn lẫn

    }

    const refesh = () => {
        setPage(1);
        setRecruitments([]); // clear danh sách cũ để không trộn dữ liệu
        loadCates();
        loadRecruits();      // tải lại công việc

    }
    return (
        <View style={[MyStyles.container, MyStyles.margin]}>
            <Text style={MyStyles.subject}>Common Job Categories</Text>
            <View style={MyStyles.row}>
                <TouchableOpacity onPress={() => search("", setCateId)}  ><Chip style={MyStyles.margin} icon="label">All</Chip></TouchableOpacity>
                {categories.map(c => <TouchableOpacity onPress={() => search(c.id, setCateId)} key={c.id} ><Chip style={MyStyles.margin} icon="label">{c.name}</Chip></TouchableOpacity>)}
            </View>

            {loading && <ActivityIndicator />}

            <Searchbar
                placeholder="Search Job" value={q} onChangeText={t => search(t, setQ)} />
            <FlatList refreshControl={<RefreshControl refreshing={loading} onRefresh={refesh} />}
                onEndReached={loadMore} data={recruitments} renderItem={({ item }) => (<Items
                    item={item}
                    routeName="news"
                    params={{ 'recruitmentId': item.id }}
                />)
                }></FlatList>



        </View>
    );
}

export default Home;