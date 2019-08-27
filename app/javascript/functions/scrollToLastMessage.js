// const scrollLastMessageIntoView = () => {
//   const messages = document.querySelectorAll('.message');
//   const lastMessage = messages[messages.length - 1];

//   if (lastMessage !== undefined) {
//     lastMessage.scrollIntoView(false);
//   }
// }

// global.scrollLastMessageIntoView = scrollLastMessageIntoView;

const scrollLastMessageIntoView = () => {
  const messagesContainer = document.querySelector('#messages');
  if (messagesContainer) {
    messagesContainer.scrollIntoView(false)
  }
}

export { scrollLastMessageIntoView }
