$(function() {
  const chatChannel = App.cable.subscriptions.create ({channel: "RoomChannel",group:$('#messages').data('group_id')},{

    connected: function() {
      // Called when the subscription is ready for use on the server
    },
    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },
    received: function(data) {
      // room_channel.rbでブロードキャストされたものがここに届く
      $('#messages').append(data['message']);
      $('.chat-room__wrap--contents').animate({scrollTop: $('.chat-room__wrap--contents')[0].scrollHeight});
      console.log('ok')
    },
    speak: function(message) {
      return this.perform('speak', {message: message, group_id: $('#messages').data('group_id')
      });
    },
  });

  $(document).on('keypress',  '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) {
      chatChannel.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
});



  // document.addEventListener('DOMContentLoaded', function(){
  //   // message/show.html.haml内のchat-input
  //   const input = document.getElementById('chat-input').attr('data-message')
  //   // message/show.html.haml内のchat-button
  //   const button = document.getElementById('chat-button')
  //   // button(#chat-button)をクリックしたら
  //   button.addEventListener('click', function(){
  //   // 入力(input)した値(value)
  //     const content = input.value
  //   // 上記のspeakにcontent(引数=入力した値)を渡す
  //     App.room.speak(content)
  //     input.value = ''
  //   })
  // })