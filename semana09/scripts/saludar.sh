#!/bin/bash
# Saluda a quien pases como primer argumento

nombre="${1:-Invitado}"

echo "👋 ¡Hola, $nombre!"
echo "📝 Recibiste $# argumento(s)"
echo "🔎 Todos los argumentos: $@"
