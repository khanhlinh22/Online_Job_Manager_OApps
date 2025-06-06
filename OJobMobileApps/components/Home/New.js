import { ScrollView, View, Text, TextInput, TouchableOpacity } from "react-native";
import MyStyles from "../../styles/MyStyles";
import { useEffect, useState } from "react";
import APIs, { endpoints } from "../../configs/APIs";
import { ActivityIndicator, Chip, Searchbar, Button } from "react-native-paper";
import Items from "./Items";

const New = ({ route }) => {
  const recruitmentId = route.params?.recruitmentId;
  const [q, setQ] = useState(route.params?.q || "");
  const [minSalary, setMinSalary] = useState("");
  const [maxSalary, setMaxSalary] = useState("");
  const [news, setNews] = useState(null);
  const [categories, setCategories] = useState([]);
  const [cateId, setCateId] = useState("");
  const [loading, setLoading] = useState(false);
  const [loadingCates, setLoadingCates] = useState(false);

  // Load categories để lọc category trong New (nếu cần)
  const loadCates = async () => {
    setLoadingCates(true);
    try {
      let res = await APIs.get(endpoints['categories']);
      setCategories(res.data);
    } catch (ex) {
      console.error(ex);
    } finally {
      setLoadingCates(false);
    }
  };

  const loadNews = async () => {
    setLoading(true);
    try {
      let url = endpoints["news"](recruitmentId) + `?q=${q}`;
      if (minSalary) url += `&min_salary=${minSalary}`;
      if (maxSalary) url += `&max_salary=${maxSalary}`;
      if (cateId) url += `&category_id=${cateId}`;
      let res = await APIs.get(url);
      setNews(res.data);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  const search = (value, setter) => {
    setter(value);
    setNews([]);
  };

  useEffect(() => {
    loadCates();
  }, []);

  useEffect(() => {
    loadNews();
  }, [recruitmentId, q, minSalary, maxSalary, cateId]);

  return (
    <ScrollView style={{ padding: 10 }}>
      <Text style={MyStyles.subject}>Filter Jobs</Text>

      {/* Category chips */}
      <View style={MyStyles.row}>
        <TouchableOpacity onPress={() => search("", setCateId)}>
          <Chip style={MyStyles.margin} icon="label">All</Chip>
        </TouchableOpacity>
        {loadingCates ? (
          <ActivityIndicator />
        ) : (
          categories.length > 0 && categories.map(c => (
            <TouchableOpacity key={c.id} onPress={() => search(c.id, setCateId)}>
              <Chip style={MyStyles.margin} icon="label" selected={cateId === c.id}>
                {c.name}
              </Chip>
            </TouchableOpacity>
          ))
        )}
      </View>

      {/* Searchbar */}
      <Searchbar
        placeholder="Search Job"
        value={q}
        onChangeText={text => search(text, setQ)}
        style={{ marginVertical: 10 }}
      />

      {/* Salary input */}
      <View style={{ flexDirection: 'row', justifyContent: 'space-between', marginBottom: 10 }}>
        <TextInput
          style={[MyStyles.input, { flex: 1, marginRight: 5 }]}
          placeholder="Min Salary"
          keyboardType="numeric"
          value={minSalary}
          onChangeText={text => setMinSalary(text)}
        />
        <TextInput
          style={[MyStyles.input, { flex: 1, marginLeft: 5 }]}
          placeholder="Max Salary"
          keyboardType="numeric"
          value={maxSalary}
          onChangeText={text => setMaxSalary(text)}
        />
      </View>

      <Button mode="contained" onPress={loadNews} style={{ marginBottom: 15 }}>
        Lọc
      </Button>

      {/* List news */}
      {loading && <ActivityIndicator />}

      {!loading && (!news || news.length === 0) && (
        <Text>Không có tin tuyển dụng phù hợp.</Text>
      )}

      {news && news.length > 0 && news.map(ne => (
        <Items
          key={ne.id}
          item={ne}
          routeName="NewDetails"
          params={{ newId: ne.id }}
          showApplyButton={true}
          showSalary={true}
        />
      ))}

    </ScrollView>
  );
};

export default New;
