
  document.getElementById('navbar-toggler-button').addEventListener('click', () => {
    const navbarNav = document.getElementById('navbarNav');
    navbarNav.classList.toggle('show');
    
    const overlay = document.getElementById('overlay');
    overlay.classList.toggle('menu-expanded');
  });

  document.getElementById('navbarNav').addEventListener('click', () => {
    navbarNav.classList.toggle('show');
    const overlay = document.getElementById('overlay');
    overlay.classList.remove('menu-expanded');
  });