window.addEventListener('load', () =>{
  const loading = document.querySelector('#loading');
console.log(loading);
  setTimeout(() => {
    loading.classList.add('loaded');
  }, 1000);
});;
