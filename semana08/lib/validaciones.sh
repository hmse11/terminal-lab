#!/bin/bash
# lib/validaciones.sh - Validaciones de entrada del gestor de tareas

# Rechaza una descripción vacía o formada solo por espacios
validar_no_vacia() {
  if [[ -z "${1:-}" || -z "${1// /}" ]]; then
    echo "La descripción no puede estar vacía" >&2
    return 1
  fi
  return 0
}

# Exige que el id sea un número entero
validar_id() {
  if [[ ! "${1:-}" =~ ^[0-9]+$ ]]; then
    echo "El id debe ser un número" >&2
    return 1
  fi
  return 0
}
