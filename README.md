Muscle Track App

📋 Descripción

Muscle Track es una aplicación móvil desarrollada en Flutter que combina tecnología avanzada y fitness para ofrecer a los usuarios una experiencia única en el seguimiento de sus entrenamientos. La aplicación permite registrar sesiones de ejercicio, realizar un análisis de posturas y visualizar el progreso mediante gráficos interactivos y métricas.

🚀 Tecnologías Utilizadas

Frontend

Flutter: Framework principal para el desarrollo de aplicaciones multiplataforma.

Dart: Lenguaje de programación utilizado en Flutter.

Riverpod: Gestión de estado escalable y reactiva.

flutter_localizations + intl: Soporte multilenguaje para ofrecer una experiencia localizada.

Backend

Node.js: Entorno de ejecución para el backend.

Express: Framework para crear una API REST.

MongoDB: Base de datos NoSQL para almacenamiento de datos.

JWT (JSON Web Tokens): Autenticación segura.

Refresh Tokens: Para mantener sesiones activas sin interrupciones.

Reconocimiento de Poses

Google ML Kit Pose Detection API: Utilizado para analizar posturas corporales en tiempo real y proporcionar feedback inmediato sobre la técnica de los ejercicios.

📂 Estructura del Proyecto

muscle_track/
├── lib/
│   ├── common/
│   ├── core/
│   ├── features/
└── pubspec.yaml

📅 Características Principales

CustomCalendar: Componente personalizado que permite visualizar y gestionar eventos en un calendario interactivo.

Historial de Actividades: Registro detallado de las sesiones de entrenamiento.

Reconocimiento de Ejercicios: Análisis en tiempo real de posturas utilizando Google ML Kit Pose Detection API.

Seguimiento y Progreso: Visualización de estadísticas y gráficos interactivos que muestran el progreso del usuario.

Multilenguaje: Soporte para diferentes idiomas, con detección automática basada en la configuración del dispositivo.

📊 Roadmap

Mejorar la UI/UX

Implementar notificaciones push

Añadir nuevos ejercicios y categorías

Integrar más opciones de personalización para los usuarios

🤝 Contribuciones

¡Las contribuciones son bienvenidas! Por favor, abre un issue o envía un pull request para mejorar la aplicación.

📄 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.

👤 Autor/es

Jesús Morilla Ibáñez

