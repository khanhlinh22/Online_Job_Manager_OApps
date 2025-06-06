export const FirebaseErrorMessages = (code) => {
  const messages = {
    'auth/email-already-in-use': 'Email đã tồn tại. Hãy đăng nhập.',
    'auth/invalid-email': 'Email không hợp lệ.',
    'auth/weak-password': 'Mật khẩu quá yếu. Phải có ít nhất 6 ký tự.',
    'auth/user-not-found': 'Email không tồn tại.',
    'auth/wrong-password': 'Mật khẩu không đúng.',
    'auth/requires-recent-login': 'Bạn cần đăng nhập lại để thực hiện thao tác này.'
  };

  return messages[code] || 'Lỗi không xác định. Vui lòng thử lại.';
};
