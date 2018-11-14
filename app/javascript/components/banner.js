import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Find", "Fight"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
