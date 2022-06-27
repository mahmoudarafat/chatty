importScripts('https://www.gstatic.com/firebasejs/8.7.0/firebase-app.js')
importScripts('https://www.gstatic.com/firebasejs/8.7.0/firebase-messaging.js')


try {

    const firebaseConfig =  {
        apiKey: "AIzaSyCSw053Pe6ByE9iS4_VUrRimb-Sr6Kifqc",
        authDomain: "technicalsupport-83bd4.firebaseapp.com",
        databaseURL: "https://technicalsupport-83bd4-default-rtdb.firebaseio.com",
        projectId: "technicalsupport-83bd4",
        storageBucket: "technicalsupport-83bd4.appspot.com",
        messagingSenderId: "828220723279",
        appId: "1:828220723279:web:79d0199ea164571b925a3a",
        measurementId: "G-VVPEYWLH82"
      };

    firebase.initializeApp(firebaseConfig);
    const messaging = firebase.messaging();


    messaging.setBackgroundMessageHandler(function (payload) {
        console.log("payload: >>> " , payload);
        const title = payload.data.title;
        let iconPath = '';
        const options = {
            body: payload.data.content,
            icon: 'public/tt.bmp'
        }

        return self.registration.showNotification(title, options)

    });

}
catch (err) {
    console.log('note error: ' + err)
}