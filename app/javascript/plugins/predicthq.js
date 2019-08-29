// const Client = require('predicthq')
import { Client } from 'predicthq';


const predicthq = () => {
  var phq = new Client({access_token: "ll_m1nQWoVShuSxrV5yRZQlhZUHszh9jyo4_pfQ_"})

  const cards = document.querySelector('.card-meeting-activities')

  if (!cards) return;

  var query = cards.innerHTML
  var eventElements = document.querySelectorAll('.event')
  eventElements.forEach((element) => {
    // var childrenElements = element.children
    // var arr = Array.prototype.slice.call(childrenElements)
    // (arr)
    // arr.forEach((child) => {
    //   (child)
    // })
  })

  var text_truncate = function(str, length, ending) {
    if (length == null) {
      length = 100;
    }
    if (ending == null) {
      ending = '...';
    }
    if (str.length > length) {
      return str.substring(0, length - ending.length) + ending;
    } else {
      return str;
    }
  };

  phq.events.search({q: query, limit: 5, offset: 1})
      .then(function(results){
        let i=0
        var events = results.toArray()
        while(i < 5) {
          eventElements.forEach((element) => {
            var imgWithContentDiv = element.children[0]
            console.info(imgWithContentDiv)
            const img = `<img src='https://loremflickr.com/320/240/${events[i].category}'class='avatar-medium'>`
            imgWithContentDiv.insertAdjacentHTML('afterbegin', img)
            const contentDiv = imgWithContentDiv.children[1]
            console.info(contentDiv)
            var contentChildren = contentDiv.children
            console.info(contentChildren)
            const title = events[i].title
            // const days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thusrday", "Friday", "Saturday"];
            // const months = ["Jan", "Feb". "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            // var dateTimeString = events[i].start;
            // const d = new Date(dateTimeString.substring(0, 4).to_);
            // const eventDate = days[d.getDay()] + ", " + months[d.getMonth()] + " " + d.getDate();
            contentChildren[0].innerHTML = text_truncate(title, 40)
            contentChildren[1].innerHTML = events[i].start.substring(8, 10)
            contentChildren[1].innerHTML += '/'
            contentChildren[1].innerHTML += events[i].start.substring(5, 7)
            contentChildren[1].innerHTML += ', '
            contentChildren[1].innerHTML += events[i].start.substring(11, 16)
            contentChildren[1].innerHTML += ' am'
            events[i].labels.forEach((label) => {
              console.info(label)
              contentDiv.children[2].insertAdjacentHTML('beforeend', `<p class="event-labels p-2 mr-2">${label}</p>`)
            })
            // contentChildren[3].innerHTML = events[i].description
            i++
          })
        }
            // for(var i=0; i < events.length; i++)
      })
}

export { predicthq };
