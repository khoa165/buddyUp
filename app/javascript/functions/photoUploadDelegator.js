const delegator = () => {
  const btn = document.getElementById("imgBtn");
  if (btn) {
    btn.addEventListener("click", (e) => {
      document.getElementById("user_photo").click();
    })
  }
}

export { delegator };
