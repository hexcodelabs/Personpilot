const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp({
  credential: admin.credential.applicationDefault(),
});

const fs = admin.firestore();

exports.randomNotification = functions.pubsub
  .schedule("* * * * *")
  .onRun(async () => {
    const activeReminder = true; // to active notification, testing purpose

    const query_a = await admin.firestore().collection("DeviceID").get();

    query_a.docs.map(async (snapshot) => {
      const token = snapshot.data().token;
      const userId = snapshot.id;

      const query_b = await admin
        .firestore()
        .collection("me")
        .doc(userId)
        .collection("StateOfMind")
        .get();

      console.log(userId + " - " + query_b.docs.length);

      if (query_b.docs.length > 0) {
        if (activeReminder) {
          sendNotification(token, "Alert", "Alert");
        }
      }
    });

    async function sendNotification(notificationToken, title, body) {
      const message = {
        notification: { title: title, body: body },
        token: notificationToken,
        data: { click_action: "FLUTTER_NOTIFICATION_CLICK" },
        content_available : true,
      };

      await admin
        .messaging()
        .send(message)
        .then((res) => {
          return console.log("Done");
        });
    }
  });

exports.sendNotification = functions.pubsub
  .schedule("* * * * *")
  .onRun(async (context) => {
    const query_a = await admin.firestore().collection("DeviceID").get();

    query_a.docs.map(async (snapshot) => {
      const token = snapshot.data().token;
      const userId = snapshot.id;
      // console.log("userId");
      // console.log(userId);
      const query_b = await admin
        .firestore()
        .collection("me")
        .doc(userId)
        .collection("Reminders")
        .get();

      query_b.docs.map(async (reminder) => {
        const nextTime = reminder.data().nextTime._seconds;
        const reminderIndex = reminder.data().index;

        const query_c = await admin.firestore().collection("reminders").get();

        if (
          nextTime ==
          Math.floor(admin.firestore.Timestamp.now()._seconds / 60) * 60
        ) {
          sendNotification(
            token,
            query_c.docs[reminderIndex].data().name,
            query_c.docs[reminderIndex].data().intro
          );
          console.log("sent");
          await fs
            .collection("me")
            .doc(userId)
            .collection("Reminders")
            .doc(reminder.id)
            .update({ nextTime: 0 });
        }
      });
    });

    async function sendNotification(notificationToken, title, body) {
      const message = {
        notification: { title: title, body: body },
        token: notificationToken,
        data: { click_action: "FLUTTER_NOTIFICATION_CLICK" },
        content_available : true,
      };

      await admin
        .messaging()
        .send(message)
        .then((res) => {
          return console.log("Done");
        });
    }
  });

exports.modifyUser = functions.firestore
  .document("me/{userId}/Reminders/{remNo}")
  .onWrite(async (change, context) => {
    console.log(context.params.userId);
    console.log(context.params.remNo);

    const reminderDoc = fs //await
      .collection("me")
      .doc(context.params.userId)
      .collection("Reminders")
      .doc(context.params.remNo)
      .get();

    const startTime = await reminderDoc.then((doc) => {
      return Math.floor(doc.data().startTime._seconds / 60) * 60;
    });

    const endTime = await reminderDoc.then((doc) => {
      return Math.floor(doc.data().endTime._seconds / 60) * 60;
    });

    const noOfReminders = await reminderDoc.then((doc) => {
      return doc.data().noOfReminders;
    });

    const interval = Math.round((endTime - startTime) / noOfReminders);
    const currentTime = Math.round(new Date().getTime() / 1000);

    if (currentTime > endTime) {
      fs.collection("me")
        .doc(context.params.userId)
        .collection("Reminders")
        .doc(context.params.remNo)
        .update({ nextTime: 0 });
    } else if (currentTime < startTime) {
      fs.collection("me")
        .doc(context.params.userId)
        .collection("Reminders")
        .doc(context.params.remNo)
        .update({
          nextTime: new admin.firestore.Timestamp(
            Math.floor(startTime / 60) * 60,
            0
          ),
        });
    } else {
      var nextTime = startTime + interval;
      while (true) {
        if (nextTime > currentTime) {
          await fs
            .collection("me")
            .doc(context.params.userId)
            .collection("Reminders")
            .doc(context.params.remNo)
            .update({
              nextTime: new admin.firestore.Timestamp(
                Math.floor(nextTime / 60) * 60,
                0
              ),
            });

          break;
        } else {
          nextTime += interval;
        }
      }
    }
  });
