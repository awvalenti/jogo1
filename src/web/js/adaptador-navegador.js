const elementoPre = document.querySelector('pre');

function desenharTabuleiro(tabuleiroEmTexto) {
  elementoPre.innerText = tabuleiroEmTexto
}

document.addEventListener('keydown', () => window.processarEntrada('baixo'));
