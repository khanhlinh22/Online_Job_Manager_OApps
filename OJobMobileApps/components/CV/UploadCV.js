import { Button, View, Alert } from 'react-native';
import * as DocumentPicker from 'expo-document-picker' ;
import { uploadCVToCloudinary } from '../../utils/Cloudinary';  // hàm upload bạn đã viết

export default function UploadCV() {
  const pickDocument = async () => {
    const result = await DocumentPicker.getDocumentAsync({ type: "*/*" });

    if (!result.canceled) {
      const file = result.assets[0];
      // Gọi hàm upload lên Cloudinary
      const url = await uploadCVToCloudinary(file.uri, file.name, file.mimeType);

      if (url) {
        Alert.alert("Tải lên thành công!", url);
        // Bạn có thể lưu url vào Firestore hoặc state nếu cần
      } else {
        Alert.alert("Tải lên thất bại!");
      }
    }
  };

  return (
    <View style={{ padding: 20 }}>
      <Button title="Tải lên CV (PDF/ảnh)" onPress={pickDocument} />
    </View>
  );
}
