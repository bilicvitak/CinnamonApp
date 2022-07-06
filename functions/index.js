const functions = require("firebase-functions");
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');
const { firestore } = require("firebase-admin");

require('dotenv').config();

admin.initializeApp();

async function sendVerification(userId, email) {
    const code = Math.floor(100000 + Math.random() * 900000);
    const link = `https://us-central1-cinnamonapp-73a64.cloudfunctions.net/validateAccount?userId=${userId}`;

    try {
        let result = await admin.firestore().collection('users').doc(userId).update({
            isValid: false,
            code: code.toString(),
            codeIsVerified: false
        });
    } catch (error) {
        console.log(error);
    }

    let transporter = nodemailer.createTransport({
        host: 'smtp.gmail.com',
        port: 465,
        secure: true,
        auth: {
            user: process.env.EMAIL,
            pass: process.env.PASSWORD,
        }
    });

    const htmlMessage = `<div style="max-width: 425px; margin: 0 auto;"><table style="border: none !important;"><tbody><tr><td style="border: none !important;"><h1 style="text-align: center; font-family: Helvetica;">Welcome!</h1><p style="font-family: Helvetica;">Your verification code is <span style="font-weight: bold;">${code}</span>.</p></td></tr><tr><td style="border: none !important;"><p style="font-family: Helvetica;">Please activate your account with the link below:</p><a style="font-family: Helvetica;" href="${link}">${link}</a></td></tr></tbody></table></div>`

    try {
        let info = await transporter.sendMail({
            from: `Cinnamon App <${process.env.EMAIL}>`,
            to: `${email}`,
            subject: "Activate your account",
            html: htmlMessage,
        });
    } catch (error) {
        console.log(error);
    }
}

exports.createUser = functions.firestore
    .document('users/{userId}')
    .onCreate(async (snap, context) => {
        const data = snap.data();
        await sendVerification(data.id, data.email);
    });

exports.validateAccount = functions.https.onRequest(async (req, res) => {
    const userId = req.query.userId || 'Unknown';

    try {
        let result = await admin.firestore().collection('users').doc(userId).update({
            isValid: true
        });

        res.status(200).json({ message: 'You successfully verified your account!' });
    } catch (error) {
        console.log(error);
        res.status(404).json({ error: error });
    }
});

exports.sendEmailAgain = functions.https.onRequest(async (req, res) => {
    const userId = req.query.userId || 'Unknown';

    try {
        const user = await admin.firestore().collection('users').doc(userId).get();
        const email = user.data().email;

        await sendVerification(userId, email);
        res.status(200).json({ message: 'Email resend successfull' });
    } catch (error) {
        console.log(error);
        res.status(400).json({ error: error });
    }
});

exports.sendLectureNotification = functions.pubsub.schedule('0 12 * * *').timeZone('Europe/Zagreb').onRun(async (context) => {
    try {
        var lectureSnapshot = await admin.firestore().collection('lectures')
            .where('lectureStart', '>=', firestore.Timestamp.now())
            .orderBy('lectureStart')
            .limit(1)
            .get();

        var lecture = lectureSnapshot.docs.at(0);
        var timeInterval = lecture.data().lectureStart - firestore.Timestamp.now();

        if (timeInterval > 86400) return { result: 'There are more than 2 days until next lecture.' };

        var usersSnapshot = await admin.firestore().collection('users').get();
        var notificationRefs = usersSnapshot.docs.map((doc) =>
            admin.firestore().collection('notifications').doc(doc.id));

        var newNnotification = {
            'title': lecture.data().lessonName,
            'description': lecture.data().description,
            'isRead': false,
            'lectureId': lecture.ref
        }

        for (let i = 0; i < notificationRefs.length; i++) {
            const doc = await notificationRefs[i].get();
            var notifications = [];

            if (doc.exists) {
                var existingNotifications = Array.from(doc.data().notification);
                var index = existingNotifications.findIndex((elem) => elem['lectureId'].toString() == newNnotification.lectureId.toString());

                if (index > -1) existingNotifications.splice(index, 1);

                notifications.push(...existingNotifications);
            }

            notifications.push(newNnotification);

            await notificationRefs[i].set({ 'notification': notifications });
        }

        let result = await admin.messaging().sendToTopic('lectures', {
            notification: {
                title: 'Lecture is coming...',
                body: newNnotification.title,
                
            },
            data: {
                'clickAction': 'FLUTTER_NOTIFICATION_CLICK'
            },
        });

        return result;
    } catch (error) {
        console.log(error);
        return { error: error };
    }
});