import React, { useState } from 'react';
import {
  SafeAreaView,
  KeyboardAvoidingView,
  Platform,
  TouchableWithoutFeedback,
  Keyboard,
  Text,
  TextInput,
  TouchableOpacity,
  ActivityIndicator,
  Alert,
  View
} from 'react-native';

import MyStyles from '../../styles/MyStyles';  // Đường dẫn tùy theo dự án bạn

import { auth, db } from '../../FireBase/FirebaseConfig';
import { signInWithEmailAndPassword } from 'firebase/auth';
import { getDoc, doc } from 'firebase/firestore';
import { useNavigation } from '@react-navigation/native';

const firebaseErrorMessages = (code) => {
  switch (code) {
    case 'auth/user-not-found':
      return 'Email không tồn tại';
    case 'auth/wrong-password':
      return 'Mật khẩu không đúng';
    case 'auth/invalid-email':
      return 'Email không hợp lệ';
    default:
      return 'Đăng nhập thất bại. Vui lòng thử lại.';
  }
};

export default function Login({ setIsLoggedIn }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);

  const navigation = useNavigation();

  const signIn = async () => {
    if (!email.trim() || !password.trim()) {
      Alert.alert('Lỗi', 'Email và mật khẩu không được để trống');
      return;
    }
    setLoading(true);
    try {
      const userCredential = await signInWithEmailAndPassword(auth, email, password);
      const uid = userCredential.user.uid;
      const docSnap = await getDoc(doc(db, 'users', uid));
      if (docSnap.exists()) {
        const { role } = docSnap.data();
        Alert.alert('Thành công', `Đăng nhập thành công với vai trò: ${role}`);
        setIsLoggedIn(true);
      } else {
        Alert.alert('Lỗi', 'Không tìm thấy thông tin người dùng trong Firestore.');
      }
    } catch (error) {
      Alert.alert('Lỗi', firebaseErrorMessages(error.code));
    } finally {
      setLoading(false);
    }
  };

  return (
    <SafeAreaView style={MyStyles.loginScreen}>
      <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
        style={{ flex: 1, width: '100%' }}
      >
        <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
          <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', width: '100%' }}>
            <Text style={MyStyles.title}>Đăng Nhập</Text>

            <TextInput
              style={MyStyles.input}
              placeholder="Email"
              autoCapitalize="none"
              keyboardType="email-address"
              value={email}
              onChangeText={setEmail}
              editable={!loading}
            />

            <TextInput
              style={MyStyles.input}
              placeholder="Mật khẩu"
              secureTextEntry
              value={password}
              onChangeText={setPassword}
              editable={!loading}
            />

            <TouchableOpacity
              style={MyStyles.button}
              onPress={signIn}
              disabled={loading}
            >
              {loading ? (
                <ActivityIndicator color="#fff" />
              ) : (
                <Text style={MyStyles.buttonText}>Đăng nhập</Text>
              )}
            </TouchableOpacity>
          </View>
        </TouchableWithoutFeedback>
      </KeyboardAvoidingView>
    </SafeAreaView>
  );
}
