// const label = document.getElementById('response-label');
// const input = document.getElementById('response-input');

const dynamicResponses = () => {

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
console.log(responsesText)
// const toggleOtherResponses = (responsesText) => {
//   responsesText.forEach(response => {
//     if (response.classList.contains("hide") == false) {
//       response.classList.toggle("hide");
//     }
//   })
// }

const questions = document.querySelectorAll(".questions");
const toggleResponsesText = (event) => {
  if (event.target.parentElement.classList.contains("questions")) {
    console.log(event)
    event.target.parentElement.nextElementSibling.classList.toggle('hide');
    event.target.parentElement.lastElementChild.classList.toggle('fa-chevron-down');
    event.target.parentElement.lastElementChild.classList.toggle('fa-chevron-up')
  }

}

questions.forEach(question => {
  addEventListener("click", toggleResponsesText);
})

// label.addEventListener("click", (event) => {
//   console.log(event);
//   event.classList.remove('btn-outline-primary');
//   event.classList.add('btn-primary');
// });
// else if (event.target.classList.contains("fas")) {
  //   event.target.parentElement.nextElementSibling.classList.toggle('hide')
  //   event.target.classList.toggle('fa-chevron-down')
  //   event.target.classList.toggle('fa-chevron-up') }

}

export { dynamicResponses };
