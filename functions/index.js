const functions = require('firebase-functions');
const admin = require("firebase-admin");
admin.initializeApp();


exports.homePageNotification = functions.firestore
    .document("users/{userId}/homePage/{docId}").onCreate((messageContent,context)=>{
        admin.firestore().collection("users")
            .doc("abdulmalik")
            .collection('tokens')
            .doc('deviceToken').get().then((tokenSnap)=>{
                var regToken=tokenSnap.data().token;
                var message = {
                    notification:{
                        title: "Home Page",
                        body: "Hello from the Home Page notification system",
                    },
                    data:{
                        title: "Home Page",
                        body: "Hello from the Home Page notification system",
                        click_action: "FLUTTER_NOTIFICATION_CLICK",
                        screen: "homePage"
                    },
                    token: regToken
                }
        
                return admin.messaging().send(message).then((response)=>{
                    console.log("Successfully sent message: ",response);
                }).catch((error=>{
                    console.log("Error sending message: ",error);
                }));
            });
    });

    exports.secondScreenNotification = functions.firestore
    .document("users/{userId}/secondScreen/{docId}").onCreate((messageContent,context)=>{
        admin.firestore().collection("users")
            .doc("abdulmalik")
            .collection('tokens')
            .doc('deviceToken').get().then((tokenSnap)=>{
                var regToken=tokenSnap.data().token;
                var message = {
                    notification:{
                        title: "Second Screen",
                        body: "Hello from the Second Screen notification system",
                    },
                    data:{
                        title: "Second Screen",
                        body: "Hello from the Second Screen notification system",
                        click_action: "FLUTTER_NOTIFICATION_CLICK",
                        screen: "secondScreen"
                    },
                    token: regToken
                }
        
                return admin.messaging().send(message).then((response)=>{
                    console.log("Successfully sent message: ",response);
                }).catch((error=>{
                    console.log("Error sending message: ",error);
                }));
            });
    });

    exports.thirdScreenNotification = functions.firestore
    .document("users/{userId}/thirdScreen/{docId}").onCreate((messageContent,context)=>{
        admin.firestore().collection("users")
            .doc("abdulmalik")
            .collection('tokens')
            .doc('deviceToken').get().then((tokenSnap)=>{
                var regToken=tokenSnap.data().token;
                var message = {
                    notification:{
                        title: "Third Screen",
                        body: "Hello from the Third Screen notification system",
                    },
                    data:{
                        title: "Third Screen",
                        body: "Hello from the Third Screen notification system",
                        click_action: "FLUTTER_NOTIFICATION_CLICK",
                        screen: "thirdScreen"
                    },
                    token: regToken
                }
        
                return admin.messaging().send(message).then((response)=>{
                    console.log("Successfully sent message: ",response);
                }).catch((error=>{
                    console.log("Error sending message: ",error);
                }));
            });
    });
