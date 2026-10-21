#!/usr/bin/env bash
set -e

BUILD_DIR="build"

if [ "$1" = "clean" ]; then
    echo "Limpando diretório de build e arquivos auxiliares..."
    rm -rf "$BUILD_DIR"
    echo "Limpeza concluída."
    exit 0
fi

# Determina qual arquivo compilar
TARGET="${1:-main.tex}"

case "$TARGET" in
    english|en|mainEnglish|mainEnglish.tex)
        MAIN_TEX="mainEnglish.tex"
        OUTPUT_PDF="mainEnglish.pdf"
        ;;
    pt|br|main|main.tex)
        MAIN_TEX="main.tex"
        OUTPUT_PDF="main.pdf"
        ;;
    all|both)
        "$0" main.tex
        "$0" mainEnglish.tex
        exit 0
        ;;
    *)
        MAIN_TEX="$TARGET"
        OUTPUT_PDF="${TARGET%.tex}.pdf"
        ;;
esac

if [ ! -f "$MAIN_TEX" ]; then
    echo "Erro: Arquivo $MAIN_TEX não encontrado!"
    exit 1
fi

mkdir -p "$BUILD_DIR"

echo "==> Compilando $MAIN_TEX -> $OUTPUT_PDF..."

if command -v latexmk >/dev/null 2>&1; then
    echo "[Engine: latexmk]"
    latexmk -pdf -interaction=nonstopmode -output-directory="$BUILD_DIR" "$MAIN_TEX"
    cp "$BUILD_DIR/$OUTPUT_PDF" .
elif command -v pdflatex >/dev/null 2>&1; then
    echo "[Engine: pdflatex]"
    pdflatex -interaction=nonstopmode -output-directory="$BUILD_DIR" "$MAIN_TEX"
    pdflatex -interaction=nonstopmode -output-directory="$BUILD_DIR" "$MAIN_TEX"
    cp "$BUILD_DIR/$OUTPUT_PDF" .
elif command -v tectonic >/dev/null 2>&1; then
    echo "[Engine: tectonic]"
    tectonic --outdir "$BUILD_DIR" "$MAIN_TEX"
    cp "$BUILD_DIR/$OUTPUT_PDF" .
elif command -v docker >/dev/null 2>&1; then
    echo "[Engine: Docker (texlive/texlive)]"
    docker run --rm -v "$(pwd):/workdir" -w /workdir texlive/texlive:latest pdflatex -interaction=nonstopmode -output-directory="$BUILD_DIR" "$MAIN_TEX"
    docker run --rm -v "$(pwd):/workdir" -w /workdir texlive/texlive:latest pdflatex -interaction=nonstopmode -output-directory="$BUILD_DIR" "$MAIN_TEX"
    cp "$BUILD_DIR/$OUTPUT_PDF" .
else
    echo "Erro: Nenhum compilador LaTeX (latexmk, pdflatex, tectonic) ou Docker encontrado."
    echo "Para instalar no EndeavourOS / Arch Linux:"
    echo "  sudo pacman -S texlive-basic texlive-latexextra texlive-fontsrecommended texlive-fontsextra"
    echo "ou:"
    echo "  sudo pacman -S tectonic"
    exit 1
fi

echo "==> Sucesso! PDF gerado em: $OUTPUT_PDF"
echo "==> Todos os arquivos temporários foram isolados em ./$BUILD_DIR/ sem poluir seu diretório."
