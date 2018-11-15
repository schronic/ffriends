import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';

const banner = document.getElementById('banner-typed-text')
if (banner) {
  loadDynamicBannerText();
}

