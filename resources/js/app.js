/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue').default;
Vue.use(require('vue-chat-scroll'))
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

// Vue.component('example-component', require('./components/ExampleComponent.vue').default);
// Vue.component('chats', require('./components/Chat/ChatsComponent.vue').default);
// Vue.component('mobile', require('./components/Chat/MobileComponent.vue').default);

Vue.component('chat-view', require('./components/Chat/ChatView.vue').default);

Vue.prototype.$host = "https://is2host.com/support/public/"


// Vue.component('chat-messages', require('./components/Chat/ChatMessagesComponent.vue').default);
// Vue.component('client-info', require('./components/Chat/ClientInfoComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

import firebase from 'firebase/app'
import messaging from 'firebase/messaging'


const config = {
    apiKey: "AIzaSyCSw053Pe6ByE9iS4_VUrRimb-Sr6Kifqc",
    authDomain: "technicalsupport-83bd4.firebaseapp.com",
    databaseURL: "https://technicalsupport-83bd4-default-rtdb.firebaseio.com",
    projectId: "technicalsupport-83bd4",
    storageBucket: "technicalsupport-83bd4.appspot.com",
    messagingSenderId: "828220723279",
    appId: "1:828220723279:web:79d0199ea164571b925a3a",
    measurementId: "G-VVPEYWLH82"
};

// // Initialize Firebase
firebase.initializeApp(config);

navigator.serviceWorker.register('support-firebase-sw.js',
    {scope: "support-firebase-cloud-messaging-push-scope"})
    .then((registration) => {
        const messaging = firebase.messaging();
        messaging.useServiceWorker(registration);

    }).catch(err => {
    console.log("test err: " + err)
})


const app = new Vue({
    el: '#page-wrapper',

    // methods:{
    //     getMessages(){
    //
    //         axios.post('getMessages').then(res => this.messages = res.data.data)
    //         console.log('messages')
    //     }

    // }

});
