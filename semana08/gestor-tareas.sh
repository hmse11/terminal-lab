#!/bin/bash
# gestor-tareas.sh - Menú principal del gestor de tareas
# Autor: SAUL ELVIN HUANCA MARCA 
# Fecha: 2026-11-26
# Uso: ./gestor-tareas.sh
set -euo pipefail

# Ruta real del script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATOS="$SCRIPT_DIR/datos/tareas.csv"

# Crear archivo de datos si no existe
if [[ ! -f "$DATOS" ]]; then
  mkdir -p "$SCRIPT_DIR/datos"
  echo "id,descripcion,estado,fecha" > "$DATOS"
fi

# Cargar librerías
source "$SCRIPT_DIR/lib/validaciones.sh"
source "$SCRIPT_DIR/lib/tareas.sh"

# Menú principal
while true; do
  echo ""
  echo "===== GESTOR DE TAREAS ====="
  echo "1) Listar tareas"
  echo "2) Agregar tarea"
  echo "3) Completar tarea"
  echo "4) Eliminar tarea"
  echo "5) Salir"
  echo "============================"
  read -rp "Elige una opción: " opcion

  case "$opcion" in
    1) listar_tareas ;;
    2) agregar_tarea || true ;;
    3) completar_tarea || true ;;
    4) eliminar_tarea || true ;;
    5) echo "👋 ¡Hasta luego!"; exit 0 ;;
    *) echo "❌ Opción inválida: $opcion" >&2 ;;
  esac
done
