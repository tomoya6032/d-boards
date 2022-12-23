import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.text}</p>`;
    const chats = document.getElementById('chats');
    const newChat = document.getElementById('chat_text');
    chats.insertAdjacentHTML('afterbegin', html);
    newChat.value='';

    // Called when there's incoming data on the websocket for this channel
  },




  speak: function() {
    return this.perform('chat: chat');
  }
});

window.addEventListener("keypress", function(e) {
  if (e.keyCode === 13) {
    appRoom.speak(e.target.value);
    e.target.value = '';
    e.preventDefault();
  }
})