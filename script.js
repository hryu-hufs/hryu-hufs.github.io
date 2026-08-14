document.querySelector('.menu-button')?.addEventListener('click',()=>document.querySelector('.nav').classList.toggle('open'));

const publicNav = document.querySelector('.site-header .nav');
if (publicNav && !publicNav.querySelector('a[href*="internal"]')) {
  const internalLink = document.createElement('a');
  internalLink.href = '/internal/';
  internalLink.textContent = 'Internal';
  publicNav.appendChild(internalLink);
}
