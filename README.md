# ToDoApp

Una aplicación Flutter para gestionar tareas y registrar cómo te sentiste al completarlas.

---

## ✨ Características

- Gestión de tareas con estados y sentimientos.
- Visualización de resumen con gráficas.
- Persistencia local con Shared Preferences.
- Cambio de tema claro/oscuro.

---

## 📱 Capturas de pantalla

### Lista de tareas

### Lista de tareas

<img src="https://github.com/user-attachments/assets/e33025d4-3f48-42a3-8c63-2394367f56ad" alt="Lista de tareas" width="300"/>

### Diálogo para agregar tarea

<img src="https://github.com/user-attachments/assets/a045ab95-be17-419d-8437-5389291d390e" alt="Agregar tarea" width="300"/>

### Diálogo para finalizar tarea

<img src="https://github.com/user-attachments/assets/528aa8ee-3cb4-45f1-af64-26ca91242111" alt="Finalizar tarea" width="300"/>

### Resumen de tareas completadas

<img src="https://github.com/user-attachments/assets/c008a614-f1df-459d-a06f-eb0c75fdd70a" alt="Resumen" width="300"/>

---

## 📦 Dependencias y versión de Flutter

- **Flutter:** 3.22.2
- **Paquetes principales:**
  - [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
  - [shared_preferences](https://pub.dev/packages/shared_preferences)
  - [google_fonts](https://pub.dev/packages/google_fonts)
  - [fl_chart](https://pub.dev/packages/fl_chart)

Instala las dependencias con:

```sh
flutter pub get
```

---

## ▶️ Instrucciones de ejecución

1. **Clona el repositorio:**

   ```sh
   git clone https://github.com/pomarmcdrac/ToDoApp.git
   ```

2. **Navega al directorio del proyecto:**

   ```sh
   cd ToDoApp/to_do_app
   ```

3. **Instala las dependencias:**

   ```sh
   flutter pub get
   ```

4. **Ejecuta la app:**
   ```sh
   flutter run
   ```

---

## 🏗️ Arquitectura usada

- **Riverpod** para gestión de estado.
- **Repository Pattern** para la persistencia de tareas.
- **Separación por features:**
  - `features/data`: acceso a datos y repositorios
  - `features/model`: modelos de datos
  - `features/provider`: providers de estado
  - `features/ui`: pantallas y widgets
  - `theme/`: temas y estilos
  - `utils/`: utilidades y formateadores

---

## 🧪 Pruebas unitarias

Para ejecutar las pruebas unitarias:

```sh
flutter test
```

Las pruebas cubren:

- Serialización de modelos
- Lógica de providers
- Funcionalidad del repositorio

---

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si encuentras algún problema o tienes sugerencias, por favor crea un issue o envía un pull request.

---

## ✨ Autor

- [pomarmcdrac](https://github.com/pomarmcdrac)

---
