# Semana 09 - Procesos y señales

## Qué hace
`monitor-procesos.sh` informa sobre los procesos del usuario actual: los lista ordenados por consumo de CPU, señala el que más consume y cuenta cuántos hay en cada estado. Después lanza un `sleep` en segundo plano y lo termina en dos etapas, primero con SIGTERM y, si no responde, con SIGKILL.

## Archivos
- `monitor-procesos.sh` — script principal
- `reporte-ejemplo.txt` — salida capturada del script
- `README.md` — este archivo

## Cómo se ejecuta
1. cd semana09
2. chmod +x monitor-procesos.sh
3. ./monitor-procesos.sh
4. ./monitor-procesos.sh > reporte-ejemplo.txt

## Qué se aprendió
- Selección de columnas y orden en `ps` con `-o` y `--sort`.
- Estados de un proceso: R, S, D, T y Z.
- Lanzamiento en segundo plano con `&` y captura del PID con `$!`.
- Diferencia entre SIGTERM (se puede atender) y SIGKILL (no se puede ignorar).
- `kill -0` para comprobar si un proceso sigue vivo sin enviarle ninguna señal.

## Qué quedó pendiente
Extensión opcional: capturar la interrupción del propio script con `trap 'kill $PID 2>/dev/null' EXIT` para no dejar el `sleep` huérfano si se interrumpe con Ctrl+C.
