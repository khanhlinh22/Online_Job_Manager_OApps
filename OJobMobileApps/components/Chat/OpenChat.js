import React from 'react';
import { TouchableOpacity, Text, Alert } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { collection, query, where, getDocs, addDoc } from 'firebase/firestore';
import { db } from '../../FireBase/FirebaseConfig';

export default function OpenChat({ 
  currentUserId, 
  currentUserRole, 
  partnerId, 
  partnerInfo, 
  currentUserInfo 
}) {
  const navigation = useNavigation();

  async function handleOpenChat() {
    if (currentUserRole !== 'job_seeker' && currentUserRole !== 'recruiter') {
      Alert.alert('Thông báo', 'Bạn không có quyền truy cập tính năng chat.');
      return;
    }

    try {
      // Tìm conversation đã có giữa 2 người
      const q = query(
        collection(db, 'conversations'),
        where('participants', 'array-contains', currentUserId)
      );

      const querySnapshot = await getDocs(q);
      let conversationId = null;

      for (const doc of querySnapshot.docs) {
        const participants = doc.data().participants;
        if (participants.includes(partnerId)) {
          conversationId = doc.id;
          break;
        }
      }

      // Nếu chưa có thì tạo mới
      if (!conversationId) {
        const docRef = await addDoc(collection(db, 'conversations'), {
          participants: [currentUserId, partnerId],
          participantInfos: {
            [currentUserId]: currentUserInfo,
            [partnerId]: partnerInfo,
          },
          lastMessage: '',
          updatedAt: Date.now(),
        });
        conversationId = docRef.id;
      }

      // Điều hướng vào màn hình chat
      navigation.navigate('ChatDetailScreen', {
        conversationId,
        currentUserId,
        partnerInfo,
      });

    } catch (error) {
      Alert.alert('Lỗi', 'Có lỗi xảy ra khi mở chat. Vui lòng thử lại.');
      console.error('OpenChat error:', error);
    }
  }

  return (
    <TouchableOpacity 
      onPress={handleOpenChat} 
      style={{
        backgroundColor: '#007bff',
        padding: 10,
        borderRadius: 5,
        alignItems: 'center',
      }}
    >
      <Text style={{ color: '#fff', fontWeight: 'bold' }}>Chat</Text>
    </TouchableOpacity>
  );
}
