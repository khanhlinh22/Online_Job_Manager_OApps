import { Image, TouchableOpacity } from "react-native";
import { List, Button } from "react-native-paper"; // ✅ Thêm Button ở đây
import MyStyles from "../../styles/MyStyles";
import { useNavigation } from "@react-navigation/native";
import moment from "moment";
import AsyncStorage from "@react-native-async-storage/async-storage"; // ✅ Import thêm
import { useEffect, useState } from "react";
import { auth, db } from "../../FireBase/FirebaseConfig";
import { doc, getDoc } from "firebase/firestore";


const Items = ({ item, routeName, params, showApplyButton = false, showSalary = true }) => {
    const nav = useNavigation();
    const [isJobSeeker, setIsJobSeeker] = useState(false);


    // Nếu có salary thì format, không thì để rỗng
    const formattedSalary = item.salary
        ? new Intl.NumberFormat("vi-VN", {
            style: "currency",
            currency: "VND",
            minimumFractionDigits: 0,
        }).format(item.salary)
        : null;

    const formattedDate = moment(item.created_date).fromNow();

    const handleApply = async () => {
        try {
            let saved = await AsyncStorage.getItem("appliedNews");
            saved = saved ? JSON.parse(saved) : [];

            if (!saved.find(i => i.id === item.id)) {
                saved.push({
                    ...item,
                    applied_at: new Date().toISOString()
                });
                await AsyncStorage.setItem("appliedNews", JSON.stringify(saved));
                alert("Ứng tuyển thành công!");
            } else {
                alert("Bạn đã ứng tuyển tin này rồi.");
            }
        } catch (err) {
            console.error(err);
            alert("Lỗi khi lưu dữ liệu ứng tuyển.");
        }
    };
    useEffect(() => {
        const fetchUserRole = async () => {
            const currentUser = auth.currentUser;
            if (!currentUser) return;

            try {
                const docRef = doc(db, "users", currentUser.uid);
                const docSnap = await getDoc(docRef);
                if (docSnap.exists()) {
                    const role = docSnap.data().role;
                    setIsJobSeeker(role === "job_seeker");
                    console.log("ROLE:", `"${role}"`);
                }
            } catch (error) {
                console.error("Lỗi lấy role:", error);
            }
        };

        fetchUserRole();
    }, []);

    return (
        <List.Item
            title={item.subject}
            description={
                `${showSalary && formattedSalary ? `💰 Salary: ${formattedSalary}\n` : ""}📅 Post: ${formattedDate}`
            }
            descriptionNumberOfLines={2}
            left={props => (
                <TouchableOpacity onPress={() => nav.navigate(routeName, params)}>
                    <Image
                        style={MyStyles.box}
                        source={{ uri: item.image }}
                    />
                </TouchableOpacity>
            )}
            right={props =>
                showApplyButton && isJobSeeker && (
                    <Button mode="contained" onPress={handleApply}>Ứng tuyển</Button>
                )
            }
        />
    );
};
export default Items;
