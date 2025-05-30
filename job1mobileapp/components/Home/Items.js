import { Image, TouchableOpacity } from "react-native";
import { List } from "react-native-paper";
import MyStyles from "../../styles/MyStyles";
import { useNavigation } from "@react-navigation/native";
import moment from "moment";

const Items = ({item, routeName, params}) =>{
    const nav =useNavigation();
    return <List.Item
                       
                        title={item.subject}
                        description={`Posting date: ${moment(item.created_date).fromNow()} `}
                        left={props => <TouchableOpacity onPress={()=> nav.navigate(routeName, params)}><Image style={MyStyles.box} source={{ uri: item.image }} /></TouchableOpacity>}
                    />
}

export default Items;