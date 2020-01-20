App.room = App.cable.subscriptions.create ("RoomChannel",{

  connected: function() {
    // Called when the subscription is ready for use on the server
  },
  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },
  received: function(data) {
    // room_channel.rbでブロードキャストされたものがここに届く
    return $('#messages').append(data['message']);
  },
  speak: function(message) {
    return this.perform('speak', {message: message
    });
  },
});

document.addEventListener('DOMContentLoaded', function(){
  const input = document.getElementById('chat-input')
  const button = document.getElementById('chat-button')
  button.addEventListener('click', function(){
    const content = input.value
    App.room.speak(content)
    input.value = ''
  })
})


// $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
//   if (event.keyCode === 13) {
//     chatChannel.speak(event.target.value);
//     event.target.value = '';
//     return event.preventDefault();
//   }
// });