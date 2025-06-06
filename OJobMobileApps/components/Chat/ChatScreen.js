import React, { useEffect, useState } from 'react';
import { View, TextInput, Button, FlatList, Text } from 'react-native';
import {  db } from '../../FireBase/FirebaseConfig';
import { addDoc, collection, onSnapshot, query, orderBy } from 'firebase/firestore';

export default function ChatScreen() {
  const [messages, setMessages] = useState([]);
  const [text, setText] = useState('');

  useEffect(() => {
    const q = query(collection(db, 'messages'), orderBy('createdAt', 'desc'));
    const unsubscribe = onSnapshot(q, (snapshot) => {
      setMessages(snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() })));
    });

    return unsubscribe;
  }, []);

  const sendMessage = async () => {
    if (text.trim()) {
      await addDoc(collection(db, 'messages'), {
        text,
        createdAt: Date.now()
      });
      setText('');
    }
  };

  return (
    <View style={{ flex: 1, padding: 20 }}>
      <FlatList
        inverted
        data={messages}
        keyExtractor={item => item.id}
        renderItem={({ item }) => <Text>{item.text}</Text>}
      />
      <TextInput value={text} onChangeText={setText} placeholder="Nhập tin nhắn" />
      <Button title="Gửi" onPress={sendMessage} />
    </View>
  );
}
