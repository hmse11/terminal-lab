#!/bin/bash
# monitor-procesos.sh - Monitor de los procesos del usuario actual
# Autor: Tu Nombre y Apellido
# Fecha: 2026-11-27
# Uso: ./monitor-procesos.sh
# Descripcion: informa procesos por consumo y por estado, y demuestra el
# ciclo completo de lanzar y terminar un proceso.

set -euo pipefail

echo "=== Monitor de procesos ==="
echo "Usuario: $USER"
echo "Fecha: $(date)"
echo ""

echo "=== Procesos del usuario ordenados por %CPU ==="
ps -u "$USER" -o pid,stat,%cpu,%mem,comm --sort=-%cpu | head -n 20
echo ""

echo "=== Proceso de mayor consumo ==="
ps -u "$USER" -o pid,comm,%cpu --sort=-%cpu | head -n 2 | tail -n 1
echo ""

echo "=== Conteo por estado ==="
ps -u "$USER" -o stat | tail -n +2 | cut -c1 | sort | uniq -c
echo ""

echo "=== Proceso de prueba ==="
sleep 60 &
PID=$!
echo "Proceso de prueba lanzado con PID=$PID"
ps -p "$PID" -o pid,stat,cmd
jobs -l
echo ""

echo "=== Terminacion en dos etapas ==="
kill -TERM "$PID" || true
sleep 1
if kill -0 "$PID" 2>/dev/null; then
    kill -KILL "$PID"
    echo "No respondio a SIGTERM: se envio SIGKILL"
else
    echo "Termino correctamente con SIGTERM"
fi

echo ""
echo "Monitoreo completado."
