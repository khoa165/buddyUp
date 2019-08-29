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

  phq.events.search({q: query, limit: 5, offset: 1})
      .then(function(results){
        let i=0
        var events = results.toArray()
        while(i < 5) {
          eventElements.forEach((element) => {
            var imgWithContentDiv = element.children[0]
            console.info(imgWithContentDiv)
            const img = `<img src='https://loremflickr.com/320/240/${events[i].category}' class='event-square'>`
            imgWithContentDiv.insertAdjacentHTML('afterbegin', img)
            const contentDiv = imgWithContentDiv.children[1]
            console.info(contentDiv)
            var contentChildren = contentDiv.children
            console.info(contentChildren)
            contentChildren[0].innerHTML = events[i].title
            contentChildren[1].innerHTML = events[i].start.substring(0, 10)
            contentChildren[1].innerHTML += ', '
            contentChildren[1].innerHTML += events[i].start.substring(11, 19)
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
