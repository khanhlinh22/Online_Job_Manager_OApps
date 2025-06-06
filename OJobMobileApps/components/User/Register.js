import React, { useState } from 'react';
import { SafeAreaView, Text, TextInput,TouchableOpacity, Alert, KeyboardAvoidingView, Platform,TouchableWithoutFeedback, Keyboard, ActivityIndicator, View,} from 'react-native';
import { auth, db } from '../../FireBase/FirebaseConfig';
import { createUserWithEmailAndPassword } from 'firebase/auth';
import { setDoc, doc } from 'firebase/firestore';
import MyStyles from '../../styles/MyStyles';
import { useNavigation } from '@react-navigation/native';
import { FirebaseErrorMessages } from '../../FireBase/FirebaseErrorMessages_TEMP';

export default function Register() {
  const [ho, setHo] = useState('');
  const [ten, setTen] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [loading, setLoading] = useState(false);

  const navigation = useNavigation();

  const isValidEmail = (email) => {
    // Regex kiểm tra định dạng email cơ bản
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
  };

  const validateInputs = () => {
    if (!ho.trim() || !ten.trim() || !email.trim() || !password.trim() || !confirmPassword.trim()) {
      Alert.alert('Lỗi', 'Vui lòng điền đầy đủ thông tin');
      return false;
    }
    if (!isValidEmail(email)) {
      Alert.alert('Lỗi', 'Email không hợp lệ');
      return false;
    }
    if (password.length < 6) {
      Alert.alert('Lỗi', 'Mật khẩu phải có ít nhất 6 ký tự');
      return false;
    }
    if (password !== confirmPassword) {
      Alert.alert('Lỗi', 'Mật khẩu xác nhận không khớp');
      return false;
    }
    return true;
  };
  const handleRegister = async () => {
    if (!validateInputs()) return;

    setLoading(true);
    try {
      const userCredential = await createUserWithEmailAndPassword(auth, email, password);
      const uid = userCredential.user.uid;
      await setDoc(doc(db, 'users', uid), {
        ho,
        ten,
        email,
        role: 'job_seeker', // hoặc mặc định role khác
        createdAt: new Date(),
      });
      Alert.alert('Thành công', 'Đăng ký tài khoản thành công!');
      navigation.goBack();
    } catch (error) {
      Alert.alert('Lỗi', FirebaseErrorMessages(error.code));
    } finally {
      setLoading(false);
    }
  };

  return (
    <KeyboardAvoidingView
      behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      style={MyStyles.loginScreen}
    >
      <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', width: '100%' }}>
          <Text style={MyStyles.title}>Đăng Ký</Text>
          <TextInput
            style={MyStyles.input}
            placeholder="Họ"
            value={ho}
            onChangeText={setHo}
            editable={!loading}
          />
          <TextInput
            style={MyStyles.input}
            placeholder="Tên"
            value={ten}
            onChangeText={setTen}
            editable={!loading}
          />
          <TextInput
            style={MyStyles.input}
            placeholder="Email"
            keyboardType="email-address"
            autoCapitalize="none"
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
          <TextInput
            style={MyStyles.input}
            placeholder="Xác nhận mật khẩu"
            secureTextEntry
            value={confirmPassword}
            onChangeText={setConfirmPassword}
            editable={!loading}
          />
          <TouchableOpacity
            style={MyStyles.button}
            onPress={handleRegister}
            disabled={loading}
          >
            {loading ? (
              <ActivityIndicator color="#fff" />
            ) : (
              <Text style={MyStyles.buttonText}>Đăng ký</Text>
            )}
          </TouchableOpacity>
        </View>
      </TouchableWithoutFeedback>
    </KeyboardAvoidingView>
  );
}
