import axios from "axios";

const BASE_URL = 'https://linhdiep.pythonanywhere.com/';

export const endpoints = {
    'categories': '/categories/',
    'recruitments': '/recruitments/',
    'news': (recruitmentId) => `/recruitments/${recruitmentId}/news`,
    'new-details': (newId) => `/news/${newId}`,
    'comments': (newId) => `/news/${newId}/comments`,
    'login' : '/o/token',
    'current-user': '/users/current-users/',
    'register': '/users/'
}

export default axios.create({
    baseURL: BASE_URL
});