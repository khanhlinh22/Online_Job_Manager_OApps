import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  Image,
  TextInput,
  TouchableOpacity,
  Alert,
  ActivityIndicator,
  KeyboardAvoidingView,
  Platform,
  TouchableWithoutFeedback,
  Keyboard,
} from 'react-native';
import * as ImagePicker from 'expo-image-picker';
import { auth, db } from '../../FireBase/FirebaseConfig';
import { doc, getDoc, updateDoc } from 'firebase/firestore';
import { updatePassword, updateProfile } from 'firebase/auth';
import { uploadToCloudinary } from '../../utils/Cloudinary';
import { Button } from 'react-native-paper';
import { useNavigation } from '@react-navigation/native';
import MyStyles from '../../styles/MyStyles';

export default function Profile({ setIsLoggedIn }) {
  const [userData, setUserData] = useState(null);
  const [newPassword, setNewPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const nav = useNavigation();

  const user = auth.currentUser;

  useEffect(() => {
    fetchUserProfile();
  }, []);

  const fetchUserProfile = async () => {
    if (!user) {
      Alert.alert('Lỗi', 'Người dùng chưa đăng nhập');
      return;
    }

    setLoading(true);
    try {
      const docSnap = await getDoc(doc(db, 'users', user.uid));
      if (docSnap.exists()) {
        setUserData(docSnap.data());
      } else {
        Alert.alert('Lỗi', 'Không tìm thấy dữ liệu người dùng');
      }
    } catch (error) {
      Alert.alert('Lỗi', 'Không lấy được thông tin: ' + error.message);
    } finally {
      setLoading(false);
    }
  };

  const pickImageAndUpload = async () => {
    try {
      // Xin quyền truy cập thư viện ảnh
      const permission = await ImagePicker.requestMediaLibraryPermissionsAsync();
      if (permission.status !== 'granted') {
        Alert.alert('Lỗi', 'Bạn cần cấp quyền truy cập ảnh');
        return;
      }

      // Mở thư viện ảnh
      const result = await ImagePicker.launchImageLibraryAsync({
        mediaTypes: ImagePicker.MediaTypeOptions.Images,
        quality: 0.7,
      });
      console.log('Kết quả chọn ảnh:', result); // kiểm tra log

      // Kiểm tra kết quả chọn
      if (!result.canceled && result.assets && result.assets.length > 0) {
        const photoUri = result.assets[0].uri;
        setLoading(true);

        try {
          const cloudinaryUrl = await uploadToCloudinary(photoUri);
          if (cloudinaryUrl) {
            await updateDoc(doc(db, 'users', user.uid), { avatar: cloudinaryUrl });
            await updateProfile(user, { photoURL: cloudinaryUrl });
            await fetchUserProfile();
            Alert.alert('Thành công', 'Ảnh đại diện đã được cập nhật');
          } else {
            Alert.alert('Lỗi', 'Upload ảnh thất bại');
          }
        } catch (error) {
          Alert.alert('Lỗi', 'Không thể cập nhật ảnh: ' + error.message);
        } finally {
          setLoading(false);
        }
      } else {
        console.log('Người dùng đã hủy chọn ảnh hoặc không chọn ảnh hợp lệ.');
      }
    } catch (error) {
      Alert.alert('Lỗi', 'Đã xảy ra lỗi khi chọn ảnh: ' + error.message);
    }
  };

  const handleChangePassword = async () => {
    if (newPassword.length < 6) {
      Alert.alert('Lỗi', 'Mật khẩu phải có ít nhất 6 ký tự');
      return;
    }

    try {
      await updatePassword(user, newPassword);
      setNewPassword('');
      Alert.alert('Thành công', 'Mật khẩu đã được thay đổi');
    } catch (error) {
      if (error.code === 'auth/requires-recent-login') {
        Alert.alert('Lỗi', 'Bạn cần đăng nhập lại để đổi mật khẩu.');
      } else {
        Alert.alert('Lỗi', 'Không thể đổi mật khẩu: ' + error.message);
      }
    }
  };

  const handleLogout = async () => {
    try {
      await auth.signOut();
      setIsLoggedIn(false);
    } catch {
      Alert.alert('Lỗi', 'Đăng xuất thất bại');
    }
  };

  if (loading || !userData) {
    return (
      <View style={[MyStyles.centered, { flex: 1 }]}>
        <ActivityIndicator size="large" />
      </View>
    );
  }

  return (
    <KeyboardAvoidingView
      behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      style={{ flex: 1 }}
    >
      <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
        <View style={MyStyles.profileContainer}>
          <TouchableOpacity onPress={pickImageAndUpload}>
            <Image
              source={
                userData.avatar
                  ? { uri: userData.avatar }
                  : require('../../assets/default-avatar.jpg')
              }
              style={MyStyles.avatar}
            />
          </TouchableOpacity>

          <Text style={MyStyles.label}>Email:</Text>
          <Text style={MyStyles.text}>{userData.email || 'Chưa cập nhật'}</Text>

          <Text style={MyStyles.label}>Họ tên:</Text>
          <Text style={MyStyles.text}>{userData.name || 'Chưa cập nhật'}</Text>

          <Text style={MyStyles.label}>Ngày tạo tài khoản:</Text>
          <Text style={MyStyles.text}>
            {userData.createdAt?.seconds
              ? new Date(userData.createdAt.seconds * 1000).toLocaleString()
              : 'Không có dữ liệu'}
          </Text>

          <TextInput
            placeholder="Mật khẩu mới"
            style={MyStyles.input}
            secureTextEntry
            value={newPassword}
            onChangeText={setNewPassword}
          />
          <TouchableOpacity style={MyStyles.button} onPress={handleChangePassword}>
            <Text style={MyStyles.buttonText}>Đổi mật khẩu</Text>
          </TouchableOpacity>

          <Button
            mode="outlined"
            onPress={() => nav.navigate('HomeStack', { screen: 'AppliedNews' })}
            style={{ marginTop: 10 }}
          >
            Xem tin đã ứng tuyển
          </Button>

          {/* <TouchableOpacity
            style={[MyStyles.button, { backgroundColor: 'red', marginTop: 15 }]}
            onPress={handleLogout}
          >
            <Text style={MyStyles.buttonText}>Đăng xuất</Text>
          </TouchableOpacity> */}
        </View>
      </TouchableWithoutFeedback>
    </KeyboardAvoidingView>
  );
}
