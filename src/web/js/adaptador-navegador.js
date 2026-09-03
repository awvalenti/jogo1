const elementoPre = document.querySelector('pre');

function atualizarTabuleiro(tabuleiroEmTexto) {
  elementoPre.innerText = tabuleiroEmTexto
}

document.addEventListener('keydown', () => window.executarMovimento());
