import consumer from "./consumer"

let room_id = gon.room.id;

const appRoom = consumer.subscriptions.create({channel: "RoomChannel", room_id: room_id}, {

  received(data) {
    const messages = document.getElementById('post');
    messages.insertAdjacentHTML('beforeend', data['post']);
  },

  speak: function(post) {
    return this.perform('speak', {post: post, room_id: room_id});
  }
});

window.addEventListener("keypress", function(e) {
  if (e.keyCode === 13) {
    appRoom.speak(e.target.value);
    e.target.value = '';
    e.preventDefault();
  }
})

//ルームを離れる直前に行う処理
//明示的に購読を解除する
window.onbeforeunload = function(){
  let subscriptions = consumer.subscriptions['subscriptions'];
  subscriptions.forEach(function(subscription){
    consumer.subscriptions.remove(subscription);
  });
  //appRoom.leave();
}