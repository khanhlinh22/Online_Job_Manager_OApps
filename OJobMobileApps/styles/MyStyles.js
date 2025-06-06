import { StyleSheet } from 'react-native';

export default StyleSheet.create({
  // Mặc định cho các màn hình auth
  loginScreen: {
    flex: 1,
    backgroundColor: '#fff',
    paddingHorizontal: 20,
    justifyContent: 'center',
    alignItems: 'center'
  },

  title: {
    fontSize: 28,
    marginBottom: 30,
    textAlign: 'center'
  },

  input: {
    width: '100%',
    borderWidth: 1,
    borderColor: '#ddd',
    padding: 12,
    borderRadius: 8,
    marginBottom: 15
  },

  button: {
    width: '100%',
    backgroundColor: '#007AFF',
    padding: 14,
    borderRadius: 8,
    marginBottom: 10
  },

  buttonText: {
    color: '#fff',
    textAlign: 'center',
    fontWeight: '600'
  },

  buttonOutline: {
    width: '100%',
    borderWidth: 1,
    borderColor: '#007AFF',
    padding: 14,
    borderRadius: 8
  },

  buttonOutlineText: {
    color: '#007AFF',
    textAlign: 'center',
    fontWeight: '600'
  },

  // Các style phụ trợ khác nếu cần
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap'
  },
  margin: {
    margin: 5
  },
  subject: {
    fontSize: 25,
    color: 'red',
    fontWeight: 'bold'
  },
  box: {
    width: 80,
    height: 80,
    borderRadius: 20
  },
  filterInput: {
    width: '100%',
    borderWidth: 1,
    borderColor: '#aaa',
    padding: 10,
    borderRadius: 8,
    marginBottom: 10,
    backgroundColor: '#f9f9f9',
  },
  centered: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },

  // ===== Style cho màn hình Profile =====
  profileContainer: {
    flex: 1,
    padding: 20,
  },

  avatar: {
    width: 100,
    height: 100,
    borderRadius: 50,
    alignSelf: 'center',
    marginVertical: 10,
  },

  label: {
    fontWeight: 'bold',
    marginTop: 10,
  },

  text: {
    marginBottom: 10,
  },
  // trong MyStyles.js, thêm phần riêng cho Register
  registerInput: {
    width: '100%',
    borderWidth: 1,
    borderColor: '#ddd',  // màu viền chuẩn, không vàng
    padding: 12,
    borderRadius: 8,
    marginBottom: 15,
  },

  registerInputWithIcon: {
    flexDirection: 'row',
    alignItems: 'center',
    borderWidth: 1,
    borderColor: '#ddd', // cũng dùng màu này để không vàng
    borderRadius: 8,
    paddingHorizontal: 10,
    marginBottom: 10,
    width: '100%',
    height: 50,
  },

  registerErrorText: {
    color: 'red',
    marginBottom: 10,
    alignSelf: 'flex-start',
  },
});
