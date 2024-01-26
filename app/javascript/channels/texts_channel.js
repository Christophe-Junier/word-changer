import consumer from "channels/consumer"

consumer.subscriptions.create("TextsChannel", {
    connected() {
        console.log("connected")
    },
    received(data) {
        console.log("received")
    }
})