import axios from "axios";

const BASE_URL = 'https://linhdiep.pythonanywhere.com/';

export const endpoints = {
    'categories': '/categories/',
    'recruitments': '/recruitments/',
    'news': (recruitmentId) => `/recruitments/${recruitmentId}/news`,
    // 'news': () => '/news/',
    'new-details': (newId) => `/news/${newId}`,
    'delete-news': (id) => `/news/${id}/`,
    'comments': (newId) => `/news/${newId}/comments`,
    'login': '/o/token/',
    'current-user': '/users/current-users/',
    'register': '/users/'
}

export const authApis = (token) => {
    return axios.create({
        baseURL: BASE_URL, 
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        }
    });
}


export default axios.create({
    baseURL: BASE_URL
});