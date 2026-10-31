const elementoPre = document.querySelector('pre');

function desenharTabuleiro(tabuleiroEmTexto) {
  elementoPre.innerText = tabuleiroEmTexto
}

document.addEventListener('keydown', e => {
  const direcaoEmTexto = {
    ArrowLeft:  'ESQUERDA',
    ArrowUp:    'CIMA',
    ArrowRight: 'DIREITA',
    ArrowDown:  'BAIXO',
  }[e.code];
  if (direcaoEmTexto) window.processarEntrada(direcaoEmTexto);
});
