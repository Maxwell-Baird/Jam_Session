function countdown(minutes) {
var seconds = 60;
var mins = minutes;
var hours = Math.floor((minutes - 1)  / 60);
function tick() {
    var counter = document.getElementById("counter");
    var current_minutes = (mins - 1) % 60
    seconds--;
    if( seconds < 1) {
      if(current_minutes < 1 && hours < 1){
          counter.innerHTML = "You are DONE! "+"<a href='/dashboard'> Return To Home</a>";
      }
      else {
        counter.innerHTML = (hours < 10 ? "0" : "") + hours.toString() + ":" +
                            (current_minutes < 10 ? "0" : "") +
                            current_minutes.toString() + ":" +
                            (seconds < 10 ? "0" : "") + String(seconds);
        countdown(mins-1);
      }
    }
    else {
      counter.innerHTML = (hours < 10 ? "0" : "") + hours.toString() + ":" +
                          (current_minutes < 10 ? "0" : "") +
                          current_minutes.toString() + ":" +
                          (seconds < 10 ? "0" : "") + String(seconds);
      if( seconds > 0 ) {
          setTimeout(tick, 1000);
      } else {
          if(mins > 1){
              countdown(mins-1);
          }
      }
    }

}
tick();
}
