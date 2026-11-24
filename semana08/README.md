# Semana 08 - Bash: Bucles, Arrays y Funciones

## ¿Qué hace `gestor-tareas.sh`?
Presenta un menú interactivo con cinco opciones para gestionar tareas guardadas en un archivo CSV: listar, agregar, completar, eliminar y salir. La lógica está separada en módulos dentro de la carpeta `lib/`.

## Archivos
- `gestor-tareas.sh` — Menú principal del programa
- `lib/validaciones.sh` — Validaciones de entrada
- `lib/tareas.sh` — Operaciones CRUD sobre las tareas
- `datos/tareas.csv` — Almacenamiento de datos
- `README.md` — Esta documentación

## Cómo ejecutar
```bash
cd semana08
chmod +x gestor-tareas.sh
./gestor-tareas.sh
