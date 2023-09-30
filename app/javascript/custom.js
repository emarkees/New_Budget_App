
  document.getElementById('navbar-toggler-button').addEventListener('click', () => {
    const navbarNav = document.getElementById('navbarNav');
    navbarNav.classList.toggle('show');
    
    const overlay = document.getElementById('overlay');
    overlay.classList.toggle('menu-expanded');
  });
