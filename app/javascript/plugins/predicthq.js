// const Client = require('predicthq')
import { Client } from 'predicthq';

var phq = new Client({access_token: "ll_m1nQWoVShuSxrV5yRZQlhZUHszh9jyo4_pfQ_"})

var query = document.querySelector('.card-meeting-activities').innerHTML
var eventElements = document.querySelectorAll('.event')
console.info(eventElements)
console.info(query)
eventElements.forEach((element) => {
  console.info(element.children[0])
  // var childrenElements = element.children
  // var arr = Array.prototype.slice.call(childrenElements)
  // console.info(arr)
  // arr.forEach((child) => {
  //   console.info(child)
  // })
})

phq.events.search({q: query, limit: 5, offset: 1})
    .then(function(results){
      let i=0
      var events = results.toArray()
      while(i < 5) {
        eventElements.forEach((element) => {
          var childrenElements = element.children
          childrenElements[0].innerHTML = events[i].title
          childrenElements[1].innerHTML = events[i].description
          childrenElements[2].innerHTML = events[i].category
          childrenElements[3].innerHTML = events[i].start
          childrenElements[4].innerHTML = events[i].country
          i++
        })
      }
          // for(var i=0; i < events.length; i++)
    })
