import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const element = document.getElementById('banner-typed-text')
  if (element) {
    new Typed('#banner-typed-text', {
      strings: ["Click search...", "Drink a cup of tea...", "See your buddy!"],
      typeSpeed: 65,
      backSpeed: 30,
      backDelay: 1200,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
