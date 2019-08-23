// const label = document.getElementById('response-label');
// const input = document.getElementById('response-input');

const responses = document.querySelectorAll(".js-response");
// console.log(responses);

const addCheckedStatus = (event) => {
  event.target.classList.toggle('btn-outline-primary');
  event.target.classList.toggle('btn-primary');
}
responses.forEach(response => {
  response.addEventListener("click", addCheckedStatus);
})
const responsesText = document.querySelectorAll(".responses");
const questions = document.querySelectorAll(".question");
const toggleResponsesText = (event) => {
  if (event.target.classList.contains("questions") && event.target.nextSibling.nextSibling.classList.contains("responses")) {
    event.target.nextSibling.nextSibling.classList.toggle('hide');
    event.target.firstElementChild.classList.toggle('fa-chevron-down')
    event.target.firstElementChild.classList.toggle('fa-chevron-up') }
  else if (event.target.classList.contains("fas")) {
    event.target.parentElement.nextElementSibling.classList.toggle('hide')
    event.target.classList.toggle('fa-chevron-down')
    event.target.classList.toggle('fa-chevron-up') }
}

questions.forEach(question => {
  addEventListener("click", toggleResponsesText);
})

// label.addEventListener("click", (event) => {
//   console.log(event);
//   event.classList.remove('btn-outline-primary');
//   event.classList.add('btn-primary');
// });
