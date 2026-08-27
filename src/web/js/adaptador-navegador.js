// Source - https://stackoverflow.com/a/6798187
// Posted by alex, modified by community. See post 'Timeline' for change history
// Retrieved 2026-08-23, License - CC BY-SA 3.0

const pre = document.querySelector('pre');

function escrever(texto) {
  pre.innerText = texto
}

document.addEventListener('keydown', () => {
  executarMovimento();
});
